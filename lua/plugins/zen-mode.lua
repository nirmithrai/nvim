return {
  {
    "folke/zen-mode.nvim",
    lazy = false,
    opts = {
      window = {
        width = 70, -- centered column (tweak to taste)
        height = 1, -- full height
        backdrop = 1, -- don't dim the background
      },
      plugins = {
        options = {
          enabled = true,
          laststatus = 0,
        },
        twilight = { enabled = false }, -- prevent extra code-dimming
        tmux = { enabled = false },
      },
    },
  },
}
