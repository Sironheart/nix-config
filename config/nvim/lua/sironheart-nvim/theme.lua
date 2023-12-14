local catppuccin = require 'catppuccin'
local colorizer = require 'colorizer'
local lualine = require 'lualine'

local function init()
    catppuccin.setup({
        flavour = "macchiato",
        integrations = {
            native_lsp = {
                enabled = true,
            },
            telescope = true,
            treesitter = true,
        },
    })

    colorizer.setup {}

    lualine.setup {
        options = {
            component_separators = { left = '', right = '' },
            extensions = { "fzf", "quickfix" },
            icons_enabled = false,
            section_separators = { left = '', right = '' },
            theme = "catppuccin"
        },
    }

    vim.cmd.colorscheme "catppuccin"
end

return {
    init = init,
}
