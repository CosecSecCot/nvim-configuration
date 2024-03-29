-- plugins/telescope.lua:
return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require "telescope"
        -- local actions = require('telescope.actions')

        telescope.setup {}

        telescope.load_extension "fzf"

        -- Keymaps
        vim.keymap.set("n", "<leader>pf", "<cmd>Telescope find_files<CR>")
        vim.keymap.set("n", "<leader>rf", "<cmd>Telescope oldfiles<CR>")
        vim.keymap.set("n", "<leader>gf", "<cmd>Telescope git_files<CR>")
        vim.keymap.set("n", "<leader>pS", "<cmd>Telescope live_grep<CR>")
        vim.keymap.set(
            "n",
            "<leader>ps",
            "<cmd>Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case<CR>"
        )
    end,
}
