return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.window = opts.window or {}
      opts.window.position = "right"
      opts.window.width = 35

      opts.filesystem = opts.filesystem or {}
      opts.filesystem.filtered_items = vim.tbl_deep_extend("force", opts.filesystem.filtered_items or {}, {
        visible = false, -- keep hidden by default; toggle with "H"
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_pattern = {
          "*.log",
          "*.class",
          "*.pyc",
          "*.min.js",
          "*.map",
          "*.uid",
        },
        hide_by_name = { "node_modules", ".DS_Store", "__pycache__", ".venv" },
        never_show = { ".git" },
      })
      return opts
    end,
  },
}
