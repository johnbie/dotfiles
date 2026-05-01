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
                    "dockerls",
                    "terraformls",
                    "lemminx",
                }
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.enable("lua_ls")
            vim.lsp.enable("ts_ls")
            vim.lsp.enable("intelephense")
            vim.lsp.enable("pyright")
            vim.lsp.enable("bashls")
            vim.lsp.enable("jsonls")
            vim.lsp.enable("yamlls")
            vim.lsp.enable("html")
            vim.lsp.enable("cssls")
            vim.lsp.enable("dockerls")
            vim.lsp.enable("terraformls")
            vim.lsp.enable("lemminx")
        end,
    }
}
