local lspconfig = require 'lspconfig'
local treesitter = require 'nvim-treesitter.configs'
local treesitter_context = require 'treesitter-context'

local function init()
    local language_servers = {
        bashls = {},
        cssls = {},
        dockerls = {},
        html = {},
        jsonls = {},
        jsonnet_ls = {},
        lua_ls = {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    },
                    runtime = {
                        version = 'LuaJIT',
                    },
                    telemetry = {
                        enable = false,
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                },
            }
        },
        nil_ls = {
            settings = {
                ['nil'] = {
                    formatting = { command = { "nixpkgs-fmt" } },
                },
            }
        },
        terraformls = {},
        tsserver = {},
        yamlls = {
            settings = {
                yaml = {
                    keyOrdering = false,
                },
            },
        },
    }

    -- Initialize servers
    for server, server_config in pairs(language_servers) do
        local config = { on_attach = on_attach }

        if server_config then
            for k, v in pairs(server_config) do
                config[k] = v
            end
        end

        lspconfig[server].setup(config)
    end

    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

    treesitter.setup {
        highlight = { enable = true },
        indent = { enable = true },
        rainbow = { enable = true },
    }

    treesitter_context.setup()
end

return {
    init = init
}
