return {
	{
		"mason-org/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"cssls",
					"html",
					"css_variables",
					"ast_grep",
					"lwc_ls",
					"ts_ls",
					"cssmodules_ls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("lua_ls", { settings = { capabilities = capabilities } })
			vim.lsp.config("cssls", { settings = { capabilities = capabilities } })
			vim.lsp.config("html", { settings = { capabilities = capabilities } })
			vim.lsp.config("css_variables", { settings = { capabilities = capabilities } })
			vim.lsp.config("ast_grep", { settings = { capabilities = capabilities } })
			vim.lsp.config("lwc_ls", { settings = { capabilities = capabilities } })
			vim.lsp.config("ts_ls", { settings = { capabilities = capabilities } })
			vim.lsp.config("cssmodules_ls", { settings = { capabilities = capabilities } })

			vim.lsp.enable("lua_ls")
			vim.lsp.enable("cssls")
			vim.lsp.enable("html")
			vim.lsp.enable("css_variables")
			vim.lsp.enable("ast_grep")
			vim.lsp.enable("lwc_ls")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("cssmodules_ls")

			vim.keymap.set("n", "<leader>li", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)
		end,
	},
}
