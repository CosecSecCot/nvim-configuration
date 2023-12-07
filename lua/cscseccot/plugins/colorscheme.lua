-- return {
-- 	"mcchrish/zenbones.nvim",
-- 	dependencies = {
-- 		"rktjmp/lush.nvim",
-- 	},
-- 	priority = 1000,
--     config = function()
--         -- vim.cmd.colorscheme('tokyobones')
-- ColorMyPP("tokyobones")
--     end
-- }

return {
	{
		"neanias/everforest-nvim",
		config = function()
			require("everforest").setup({
				background = "hard",
			})
		end,
	},
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"mcchrish/zenbones.nvim",
		dependencies = {
			"rktjmp/lush.nvim",
		},
	},
	{ "nyoom-engineering/oxocarbon.nvim" },
	{ "nyoom-engineering/oxocarbon.nvim" },
	{ "https://github.com/rafi/awesome-vim-colorschemes" },
	{ "fcpg/vim-fahrenheit" },
	{ "Lokaltog/vim-distinguished" },
	{ "savq/melange-nvim" },
	{ "aktersnurra/no-clown-fiesta.nvim" },
	{ "adigitoleo/vim-mellow" },
	{ "TheNiteCoder/mountaineer.vim" },
	{ "water-sucks/darkrose.nvim" },
	{ "xero/miasma.nvim" },
	{ "kuuote/elly.vim" },
	{ "axvr/raider.vim" },
	{ "dylnmc/vulpo.vim" },
	{ "Lokaltog/vim-monotone" },
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				-- transparent = true,
				terminal_colors = true,
			})
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		config = function()
			require("nightfox").setup({
				options = {
					transparent = true,
					terminal_colors = true,
				},
			})
		end,
	},
	{ "ramojus/mellifluous.nvim" },
	{ "chiendo97/intellij.vim" },
	--  'tinted-theming/base16-vim'
	{ "metalelf0/base16-black-metal-scheme" },
	{ "rockerBOO/boo-colorscheme-nvim" },
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				transparent = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
			})
		end,
	},
	{
		"hachy/eva01.vim",
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				-- transparent_background = true, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = false, -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.15, -- percentage of the shade to apply to the inactive window
				},
				no_italic = false, -- Force no italic
				no_bold = false, -- Force no bold
				no_underline = false, -- Force no underline
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" }, -- Change the style of comments
					conditionals = { "italic" },
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
				},
				color_overrides = {},
				custom_highlights = {},
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = false,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
					-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
			})
		end,
	},
	{ "alessandroyorba/despacio" },

	-- lazy = false,
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "mellifluous",
		},
	},
}

-- use({ "rose-pine/neovim", as = "rose-pine" })
-- use("nyoom-engineering/oxocarbon.nvim")
-- use("https://github.com/rafi/awesome-vim-colorschemes")
-- use("fcpg/vim-fahrenheit")
-- use("Lokaltog/vim-distinguished")
-- use("savq/melange-nvim")
-- use("aktersnurra/no-clown-fiesta.nvim")
-- use("adigitoleo/vim-mellow")
-- use("TheNiteCoder/mountaineer.vim")
-- use("water-sucks/darkrose.nvim")
-- -- use 'xero/miasma.nvim'
-- use("kuuote/elly.vim")
-- use("axvr/raider.vim")
-- use("dylnmc/vulpo.vim")
-- use("Lokaltog/vim-monotone")
-- use("rebelot/kanagawa.nvim")
-- use("ramojus/mellifluous.nvim")
-- use("chiendo97/intellij.vim")
-- -- use 'tinted-theming/base16-vim'
-- use("metalelf0/base16-black-metal-scheme")
-- use("rockerBOO/boo-colorscheme-nvim")
-- use("folke/tokyonight.nvim")
-- use("alessandroyorba/despacio")
