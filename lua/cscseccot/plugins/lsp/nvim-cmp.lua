return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets", -- snippets
	},

	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		-- require("luasnip.loaders.from_vscode").lazy_load() -- load snippets
		require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/snippets" }) -- load snippets
		-- local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			completion = {
				completeopt = "menu, menuone, preview, noselect",
			},
			window = {
				diagnostic = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered({
					padding = { 2, 2, 2, 2 },
				}),
				completion = cmp.config.window.bordered(),
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				-- Priority-wise (uppermost -> highest priority)
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
		})

		luasnip.config.setup({
			history = true,
			updateevents = "TextChanged, TextChangedI",
			enable_autosnippets = true,
		})

		-- KeyMaps
		vim.keymap.set({ "i" }, "<C-y>", function()
			luasnip.expand()
		end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<C-L>", function()
			luasnip.jump(1)
		end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<C-J>", function()
			luasnip.jump(-1)
		end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<C-E>", function()
			if luasnip.choice_active() then
				luasnip.change_choice(1)
			end
		end, { silent = true })
	end,
}
