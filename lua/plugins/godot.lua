-- ~/.config/nvim/lua/plugins/godot.lua
return {
  require("lspconfig")["gdscript"].setup({
    name = "godot",
    cmd = { "ncat", "127.0.0.1", "6005" },
  }),
}
