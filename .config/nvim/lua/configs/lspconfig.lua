
-- local capabilities = require ("nvchad.configs.lspconfig").capabilities
local diagnostic = require "vim.diagnostic"
local lspconfig = require "lspconfig"
local servers = require ("configs.overrides").lsp_servers

diagnostic.config {
    update_in_insert = true,
}

for _, lsp in ipairs(servers) do
    local setup_table =
        {
            root_dir = require("lspconfig").util.root_pattern(".git")
        }

    -- if lsp == 'intelephense' then
    --     table.insert(setup_table, {
    --     })
    -- end

    lspconfig[lsp].setup(setup_table)

end
