return {
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      local maps = opts.mappings or {}

      maps.n = vim.tbl_extend("force", maps.n or {}, {
        ["<A-j>"] = { ":m .+1<CR>==", desc = "Move line down" },
        ["<A-k>"] = { ":m .-2<CR>==", desc = "Move line up" },
        ["<M-j>"] = { ":m .+1<CR>==", desc = "Move line down (meta)" },
        ["<M-k>"] = { ":m .-2<CR>==", desc = "Move line up (meta)" },
      })

      maps.i = vim.tbl_extend("force", maps.i or {}, {
        ["<A-j>"] = { "<Esc>:m .+1<CR>==gi", desc = "Move line down" },
        ["<A-k>"] = { "<Esc>:m .-2<CR>==gi", desc = "Move line up" },
        ["<M-j>"] = { "<Esc>:m .+1<CR>==gi", desc = "Move line down (meta)" },
        ["<M-k>"] = { "<Esc>:m .-2<CR>==gi", desc = "Move line up (meta)" },
      })

      maps.x = vim.tbl_extend("force", maps.x or {}, {
        ["<A-j>"] = { ":m '>+1<CR>gv=gv", desc = "Move selection down" },
        ["<A-k>"] = { ":m '<-2<CR>gv=gv", desc = "Move selection up" },
        ["<M-j>"] = { ":m '>+1<CR>gv=gv", desc = "Move selection down (meta)" },
        ["<M-k>"] = { ":m '<-2<CR>gv=gv", desc = "Move selection up (meta)" },
      })

      opts.mappings = maps
      return opts
    end,
  },
}
