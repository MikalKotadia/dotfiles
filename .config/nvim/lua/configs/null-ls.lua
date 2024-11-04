local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {
    b.diagnostics.eslint,
    b.code_actions.eslint_d,
    b.formatting.autopep8,
}

null_ls.setup {
    debug = true,
    sources = sources,
}
