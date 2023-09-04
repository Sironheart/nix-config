-- Settings
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.title = true
vim.opt.updatetime = 0
vim.opt.clipboard:prepend('unnamedplus')

-- Plugins
require('nvim-treesitter.configs').setup {
    highlight = { enable = true },
    indent = { enable = false }
}


-- LSP
local nvim_lsp = require('lspconfig')
