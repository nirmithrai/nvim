local vault_path = "/mnt/throne/Obsidian/ARC/"
local sync_script = vault_path .. "scripts/sync"

return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	ft = "markdown",

	---@module 'obsidian'
	---@type obsidian.config

	opts = {
		legacy_commands = false,

		checkbox = {
			enabled = true,
			create_new = true,
			order = { " ", "x" },
		},

		workspaces = {
			{
				name = "ARC",
				path = vault_path,
				overrides = {
					frontmatter = { enabled = false },
				},
			},
		},

		daily_notes = {
			folder = "Daily",
		},
	},
	init = function()
		local sync_timer = nil
		local started_sync_this_session = false
		local touched_vault_this_session = false

		local function in_vault(bufnr)
			local name = vim.api.nvim_buf_get_name(bufnr or 0)
			return name ~= "" and vim.startswith(name, vault_path)
		end

		local function run_sync(reason, blocking)
			if vim.fn.filereadable(sync_script) ~= 1 then
				vim.notify("Journal sync script not found: " .. sync_script, vim.log.levels.ERROR)
				return
			end

			if blocking then
				local obj = vim.system({ sync_script }, { text = true }):wait()
				if obj.code ~= 0 then
					vim.notify("Journal sync failed (" .. reason .. "). Check scripts/sync.log", vim.log.levels.ERROR)
				end
				return
			end

			vim.system({ sync_script }, { text = true }, function(obj)
				if obj.code ~= 0 then
					vim.schedule(function()
						vim.notify(
							"Journal sync failed (" .. reason .. "). Check scripts/sync.log",
							vim.log.levels.ERROR
						)
					end)
				end
			end)
		end

		local function schedule_sync()
			if sync_timer then
				sync_timer:stop()
				sync_timer:close()
				sync_timer = nil
			end

			sync_timer = vim.uv.new_timer()
			sync_timer:start(
				10 * 60 * 1000,
				0,
				vim.schedule_wrap(function()
					run_sync("idle save", false)
					sync_timer:stop()
					sync_timer:close()
					sync_timer = nil
				end)
			)
		end

		local function daily_nav(step)
			local current = vim.api.nvim_buf_get_name(0)
			local filename = vim.fn.fnamemodify(current, ":t:r")
			local y, m, d = filename:match("^(%d%d%d%d)%-(%d%d)%-(%d%d)$")

			local target
			if y and m and d then
				local ts = os.time({
					year = tonumber(y),
					month = tonumber(m),
					day = tonumber(d),
					hour = 12,
				})
				target = os.date("%Y-%m-%d", ts + (step * 24 * 60 * 60))
			else
				target = os.date("%Y-%m-%d")
			end

			vim.cmd("Obsidian today " .. target)
		end

		-- keymaps
		vim.keymap.set("n", "[n", function()
			daily_nav(-1)
		end, { desc = "Previous daily note" })

		vim.keymap.set("n", "]n", function()
			daily_nav(1)
		end, { desc = "Next daily note" })

		vim.keymap.set("n", "<C-->", "<cmd>Obsidian toggle_checkbox<CR>", { desc = "Toggle checkbox" })

		-- sync hooks
		vim.api.nvim_create_autocmd("BufEnter", {
			callback = function(args)
				if not started_sync_this_session and in_vault(args.buf) then
					started_sync_this_session = true
					touched_vault_this_session = true
					run_sync("session start", false)
				end
			end,
		})

		vim.api.nvim_create_autocmd("BufWritePost", {
			callback = function(args)
				if in_vault(args.buf) then
					touched_vault_this_session = true
					schedule_sync()
				end
			end,
		})

		vim.api.nvim_create_autocmd("VimLeavePre", {
			callback = function()
				if touched_vault_this_session then
					run_sync("vim exit", true)
				end
			end,
		})
	end,
}
