lua << END
	require("symbols-outline").setup()
	require("mason").setup()
	require("mason-lspconfig").setup({
		automatic_installation = true,
	})
	require("mason-lspconfig").setup_handlers({
		function(server)
			require("lspconfig")[server].setup({})
		end,
	})

	require("lspconfig")["pyright"].setup({})

	
	require('lualine').setup()

END
