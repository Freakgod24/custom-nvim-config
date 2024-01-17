return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "clangd",
            },
            handlers = {
                function(server_name)
                    if server_name == "lua_ls" then
                        require 'lspconfig'.lua_ls.setup {
                            settings = {
                                Lua = {
                                    diagnostics = { globals = { "vim" } }
                                }
                            }
                        }
                    else
                        require("lspconfig")[server_name].setup {}
                    end
                end,
            },
        })
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
        vim.keymap.set('n', 'rn', vim.lsp.buf.rename, {})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
        vim.keymap.set('n', 'fc', vim.lsp.buf.format, {})
    end
}
