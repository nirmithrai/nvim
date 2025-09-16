return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      gdscript = {
        cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
        filetypes = { "gd", "gdscript" },
        root_dir = require("lspconfig.util").root_pattern("project.godot", ".git"),
      },
    },
  },
}
