return {
	"CRAG666/code_runner.nvim",
	config = function()
		require("code_runner").setup({
			filetype = {
				java = {
					"cd $dir &&",
					"javac $fileName &&",
					"java $fileNameWithoutExt",
				},
				python = "python3 -u",
				typescript = "deno run",
				rust = {
					"cd $dir &&",
					"rustc $fileName &&",
					"$dir/$fileNameWithoutExt",
				},
				cpp = {
					'cd "$dir" &&',
					'g++ -std=c++20 -O2 -Wall "$fileName" -o a.out &&',
					'"$dir/a.out"',
				},
			},
		})

		-- Keymaps
		vim.keymap.set("n", "<leader>R", ":RunCode<CR>", { noremap = true, silent = false })
	end,
}
