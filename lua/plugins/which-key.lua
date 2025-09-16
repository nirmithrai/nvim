return {
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.preset = "helix" -- choices: "classic", "modern", "helix"
      return opts
    end,
  },
}
