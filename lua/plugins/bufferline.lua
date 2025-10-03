return {
  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
        mode = "buffers",              -- keep buffer mode
        sort_by = "id",                -- order by bufnr (stable)
        persist_buffer_sort = true,    -- remember your manual order
        offsets = { { filetype = "neo-tree", text = "Explorer", highlight = "Directory", separator = true } },
        -- insert behavior (choose one):
        -- insert_at_end = true,       -- new buffers go to the right end
        -- OR
        insert_after_current = true -- new buffers appear next to current
      })
      return opts
    end,
  },
}
