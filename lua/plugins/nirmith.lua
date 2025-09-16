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
      return opts
    end,
  },

}
