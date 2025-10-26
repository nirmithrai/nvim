-- lua/plugins/transparency.lua
return {
  {
    -- run after colorscheme so our highlights stick
    "LazyVim/LazyVim",
    opts = {
      -- no options needed here; we just need a place in the load order
    },
  },
  {
    -- apply our highlight overrides on colorscheme changes
    "folke/tokyonight.nvim", -- present in LazyVim by default; any always-loaded plugin is fine
    opts = { transparent = true },
    init = function()
      local function make_transparent()
        local groups = {
          "Normal",
          "NormalNC",
          -- "NormalFloat",
          "SignColumn",
          -- "FloatBorder",
          "WinSeparator",
          "ZenBg",
          "ZenBgNC",
          "NeoTreeNormal",
          "NeoTreeNormalNC",
          "NeoTreeEndOfBuffer",
          "NeoTreeSignColumn",
          "NeoTreeWinSeparator",
          "NeoTreeTabActive",
          "NeoTreeTabInactive",
          "NeoTreeTabSeparatorActive",
          "NeoTreeTabSeparatorInactive",
        }
        for _, g in ipairs(groups) do
          pcall(vim.api.nvim_set_hl, 0, g, { bg = "NONE" })
        end
      end

      vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
        callback = make_transparent,
        desc = "Force transparent backgrounds",
      })
    end,
  },
}
