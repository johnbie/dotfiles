return {
    {
        "mason-org/mason.nvim",
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    }
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason-lspconfig").setup({
                automatic_enable = false,
                ensure_installed = {
                    "lua_ls",
                    "ts_ls",
                    "intelephense",
                    "pyright",
                    "bashls",
                    "jsonls",
                    "yamlls",
                    "html",
                    "cssls",
                }
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config("lua_ls", {
                root_markers = { ".emmyrc.json", ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
            })
            vim.lsp.enable("lua_ls")
            vim.lsp.config("ts_ls", {
                root_markers = { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock", ".git" },
            })
            vim.lsp.enable("ts_ls")
            vim.lsp.enable("intelephense")
            vim.lsp.enable("pyright")
            vim.lsp.enable("bashls")
            vim.lsp.enable("jsonls")
            vim.lsp.enable("yamlls")
            vim.lsp.enable("html")
            vim.lsp.enable("cssls")

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
        end,
    }
}
