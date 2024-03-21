return {
    "tpope/vim-commentary",
    config = function()
        vim.cmd [[autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s]]
    end,
    -- lazy = false
}
