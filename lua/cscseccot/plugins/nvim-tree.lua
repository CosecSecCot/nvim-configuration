-- return {
-- 	"nvim-tree/nvim-tree.lua",
-- 	version = "*",
-- 	lazy = false,
-- 	dependencies = {
-- 		"nvim-tree/nvim-web-devicons",
-- 	},
-- 	config = function()
-- 		local nvimtree = require("nvim-tree")
-- 		nvimtree.setup({
-- 			-- disable_netrw = false,
-- 			-- hijack_netrw = false,
-- 			actions = {
-- 				open_file = {
-- 					quit_on_open = true,
-- 				},
-- 			},
-- 			view = {
-- 				width = 30,
-- 			},
-- 			filters = {
-- 				custom = {
-- 					".DS_Store",
-- 				},
-- 			},
-- 			update_focused_file = {
-- 				enable = true,
-- 				update_root = true,
-- 				ignore_list = { "help" },
-- 			},
-- 		})

-- 		-- TransparentDeezNuts()

-- 		-- Keymaps
-- 		vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
-- 	end,
-- }

return {}
