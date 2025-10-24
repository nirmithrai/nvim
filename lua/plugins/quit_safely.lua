-- lua/plugins/quit_safely.lua
return {
  "AstroNvim/astrocore",
  opts = function(_, opts)
    opts.mappings = opts.mappings or {}
    opts.mappings.n = opts.mappings.n or {}
    opts.mappings.n["<C-q>"] = {
      function()
        local ok, resession = pcall(require, "resession")
        if ok then
          pcall(resession.save, "last", { notify = false })
          pcall(resession.save, vim.fn.getcwd(), { dir = "dirsession", notify = false })
        end
        vim.cmd "qa" -- not qa!; still a clean exit
      end,
      desc = "Save sessions, then quit",
    }
    return opts
  end,
}
