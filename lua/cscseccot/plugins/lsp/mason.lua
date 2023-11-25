return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({
			PATH = "prepend",
			ui = {
				border = "rounded",
			},
			height = 0.5,
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"clangd",
				"tsserver",
				"rust_analyzer",
				"pyright",
			},
			automatic_installation = true,
		})
	end,
}
