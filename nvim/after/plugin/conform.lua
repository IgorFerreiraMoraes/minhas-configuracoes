require("conform").setup({
	formatters_by_ft = {
		javascript = { "prettier" },
		vue = { "prettier" },
		lua = { "stylua" },
		python = { "black" },
	},
	format_on_save = {
		lsp_fallback = true,
		timeout_ms = 500,
	},
	format_after_save = {
		lsp_fallback = true,
	},
})
