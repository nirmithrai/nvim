return {
  {
    "AstroNvim/astrocore",
    lazy = false,
    opts = function(_, opts)
      opts.mappings = opts.mappings or {}
      opts.mappings.n = opts.mappings.n or {}
      opts.mappings.i = opts.mappings.i or {}
      opts.mappings.v = opts.mappings.v or {}

      opts.mappings.n["<C-s>"] = { "<cmd>w<cr>", desc = "Save file" }
      opts.mappings.i["<C-s>"] = { "<esc><cmd>w<cr>", desc = "Save file" }
      opts.mappings.v["<C-s>"] = { "<esc><cmd>w<cr>", desc = "Save file" }

      opts.mappings.n["<leader>uZ"] = false
      opts.mappings.n["<leader>uz"] = {
        function() require("zen-mode").toggle() end,
        desc = "Zen Mode",
      }

      opts.mappings.n["<CR>"]   = { "o<Esc>", desc = "Add blank line below (normal mode)" }
      opts.mappings.n["<S-CR>"]   = { "O<Esc>", desc = "Add blank line above (normal mode)" }

      opts.mappings.n["H"] = { "<cmd>bprevious<CR>", desc = "Previous buffer" }
      opts.mappings.n["L"] = { "<cmd>bnext<CR>", desc = "Next buffer" }

      opts.options = opts.options or {}
      opts.options.opt = vim.tbl_deep_extend("force", opts.options.opt or {}, {
        wrap = true, -- enable wrapping
        linebreak = true, -- wrap at word boundaries
        breakindent = true, -- keep indent on wrapped lines
        number = true, -- keep absolute line numbers
        relativenumber = false, -- turn off relative line numbers
        tabstop = 4, -- how wide a tab displays
        shiftwidth = 4, -- indent width for >>, <<, autoindent
        softtabstop = 4, -- backspace/Delete feel like 4 spaces
        expandtab = false,
      })
      return opts
    end,
  },
  {
    "AstroNvim/astrotheme",
    opts = function(_, opts)
      opts.style = vim.tbl_deep_extend("force", opts.style or {}, {
        transparent = true,
      })
      return opts
    end,
  },
  {
    "AstroNvim/astroui",
    opts = function(_, opts)
      opts.highlights = opts.highlights or {}
      opts.highlights.init = vim.tbl_deep_extend("force", opts.highlights.init or {}, {
        Normal = { bg = "NONE" },
        NormalNC = { bg = "NONE" },
        NormalFloat = { bg = "NONE" },
        SignColumn = { bg = "NONE" },
        FloatBorder = { bg = "NONE" },
        WinSeparator = { bg = "NONE" },
        ZenBg = { bg = "NONE" },
        ZenBgNC = { bg = "NONE" },
      })
      return opts
    end,
  },
  { "nvim-telescope/telescope.nvim" },
}
