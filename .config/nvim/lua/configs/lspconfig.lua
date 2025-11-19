local diagnostic = require "vim.diagnostic"
local servers = require ("configs.overrides").lsp_servers

diagnostic.config {
    update_in_insert = true,
}

for lsp, opts in pairs(servers) do
    local config = vim.tbl_deep_extend("force", {
        root_markers = { ".git" }
    }, opts)

    vim.lsp.config[lsp] = config
    vim.lsp.enable(lsp)
end
