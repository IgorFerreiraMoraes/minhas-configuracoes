local lsp_zero = require("lsp-zero")

lsp_zero.preset("recommended")
lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"eslint",
		"prettier",
		"stylua",
		"black",
		"emmet-language-server",
	},
	handlers = {
		lsp_zero.default_setup,
	},
})
require("mason-lspconfig").setup({
	ensure_installed = {
		"cssls",
		"html",
		"lua_ls",
		-- "ts_ls",
		"volar",
		"pyright",
	},
	handlers = {
		lsp_zero.default_setup,
		volar = function()
			require("lspconfig").volar.setup({})
		end,
		ts_ls = function()
			local vue_typescript_plugin = require("mason-registry")
				.get_package("vue-language-server")
				:get_install_path() .. "/node_modules/@vue/language-server" .. "/node_modules/@vue/typescript-plugin"

			require("lspconfig").ts_ls.setup({
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = vue_typescript_plugin,
							languages = { "javascript", "typescript", "vue" },
						},
					},
				},
				filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
					"vue",
				},
			})
		end,
	},
})
