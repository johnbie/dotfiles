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
                    "gopls",
                    "dockerls",
                    "terraformls",
                    "lemminx",
                }
            })
        end,
    }
}
