-- ~/.config/nvim/lua/plugins/gdscript-format.lua
return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        gdscript = { "gdformat" },
      },
      formatters = {
        gdformat = {
          stdin = false, -- gdformat needs a file, not stdin
          command = "gdformat", -- or pin Mason path below if you prefer
          -- command = vim.fn.stdpath("data") .. "/mason/bin/gdformat",
        },
      },
    },
  },
}
