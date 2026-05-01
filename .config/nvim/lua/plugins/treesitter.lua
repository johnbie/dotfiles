return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        local treesitter = require('nvim-treesitter')
        treesitter.setup({
            highlight = { enable = true },
            indent = { enable = true },
        })
        treesitter.install {
            "javascript",
            "typescript",
            "php",
            "python",
            "bash",
            "json",
            "yaml",
            "html",
            "css",
            "sql",
            "go",
            "lua",
            "markdown",
            "dockerfile",
            "hcl",
            "xml",
            "regex",
            "jsdoc",
            "phpdoc",
        }
    end,
}
