vim.wo.number = true

-- Make 4 spaces the default tab width for all filetypes
vim.opt.tabstop = 4       -- number of spaces a <Tab> counts for
vim.opt.shiftwidth = 4    -- number of spaces used for autoindent
vim.opt.expandtab = true  -- use spaces instead of actual tab characters
vim.opt.softtabstop = 4   -- number of spaces when pressing <Tab> in insert mode

-- Override for Lua files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
  end,
})
