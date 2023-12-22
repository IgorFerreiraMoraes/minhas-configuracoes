require("conform").setup({
    formatters_by_ft = {
        javascript = { { "prettierd", "prettier" } },
        vue = { { "prettierd", "prettier" } },
        lua = { "stylua" },
    },
    formatters = {
        prettier = {
            require_cwd = false,
        }
    },
    format_on_save = {
        lsp_fallback = true,
        timeout_ms = 500,
    },
})

