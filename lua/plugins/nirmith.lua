return {
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      opts.mappings = opts.mappings or {}
      opts.mappings.n = opts.mappings.n or {}
      opts.mappings.i = opts.mappings.i or {}
      opts.mappings.v = opts.mappings.v or {}

      opts.mappings.n["<C-s>"] = { "<cmd>w<cr>", desc = "Save file" }
      opts.mappings.i["<C-s>"] = { "<esc><cmd>w<cr>", desc = "Save file" }
      opts.mappings.v["<C-s>"] = { "<esc><cmd>w<cr>", desc = "Save file" }

      -- remove the default <leader>uZ
      opts.mappings.n["<leader>uZ"] = false

      -- add <leader>uz
      opts.mappings.n["<leader>uz"] = {
        function() require("zen-mode").toggle() end,
        desc = "Zen Mode",
      }

      opts.options = opts.options or {}
      opts.options.opt = vim.tbl_deep_extend("force", opts.options.opt or {}, {
        -- Word wrap (soft wrap)
        wrap = true,        -- enable wrapping
        linebreak = true,   -- wrap at word boundaries
        breakindent = true, -- keep indent on wrapped lines
        -- Line numbers
        number = true,        -- keep absolute line numbers
        relativenumber = false, -- turn off relative line numbers
      })

            opts.options.opt = vim.tbl_deep_extend("force", opts.options.opt or {}, {
        tabstop = 4,     -- how wide a tab displays
        shiftwidth = 4,  -- indent width for >>, <<, autoindent
        softtabstop = 4, -- backspace/Delete feel like 4 spaces
        expandtab = false
      })

      return opts
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.window = opts.window or {}
      opts.window.position = "right"
      opts.window.width = 35
      return opts
    end,
  },
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.preset = "helix" -- choices: "classic", "modern", "helix"
      return opts
    end,
  },
  {
    "folke/zen-mode.nvim",
    lazy = false, -- load at startup so we can open it immediately
    opts = {
      window = {
        width = 0.5,  -- centered column (tweak to taste)
        height = 1,   -- full height
        backdrop = 1, -- don't dim the background
        options = {
          -- don't change numbers/signs/etc; keep your normal UI
          -- (leave this table empty to avoid disabling anything)
        },
      },
      plugins = {
        -- don't touch global UI (statusline/cmd/ruler/etc.)
        options = { enabled = false },
        twilight = { enabled = false }, -- no code dimming
        gitsigns = { enabled = false },
        tmux = { enabled = false },
        kitty = { enabled = false },
        alacritty = { enabled = false },
        wezterm = { enabled = false },
        neovide = { enabled = false },
      },
    },
    -- init = function()
    --   -- Open Zen Mode on the first real file (not dashboard/neo-tree, etc.)
    --   vim.api.nvim_create_autocmd("User", {
    --     pattern = "AstroFile",
    --     once = true,
    --     callback = function() require("zen-mode").open() end,
    --   })
    -- end,
  },
}
