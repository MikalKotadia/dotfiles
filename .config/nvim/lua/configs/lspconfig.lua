local diagnostic = require "vim.diagnostic"
local servers = require ("configs.overrides").lsp_servers

diagnostic.config {
    update_in_insert = true,
}

for _, lsp in ipairs(servers) do
    vim.lsp.config[lsp] = {
        root_markers = { ".git" }
    }

    vim.lsp.enable(lsp)
end
