
local on_attatch = require("nvchad.configs.lspconfig").on_attatch

-- local capabilities = require("plugins.configs.lspconfig").capabilities
local capabilities = require ("nvchad.configs.lspconfig").capabilities
local diagnostic = require "vim.diagnostic"
local lspconfig = require "lspconfig"
local servers = require ("configs.overrides").lsp_servers

diagnostic.config {
    update_in_insert = true,
}

for _, lsp in ipairs(servers) do
    local setup_table =
        {
            on_attach = on_attach,
            capabilities = capabilities,
        }
    lspconfig[lsp].setup(setup_table)

end
