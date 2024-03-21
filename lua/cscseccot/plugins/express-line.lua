local generator = function()
    local builtin = require "el.builtin"
    local extensions = require "el.extensions"
    local subscribe = require "el.subscribe"
    local sections = require "el.sections"
    local diagnostic = require "el.diagnostic"
    local lsp_statusline = require "el.plugins.lsp_status"

    local mode = extensions.gen_mode { format_string = " %s " }

    local git_icon = subscribe.buf_autocmd("el_file_icon", "BufRead", function(_, bufnr)
        local icon = extensions.file_icon(_, bufnr)
        if icon then
            return icon .. " "
        end

        return ""
    end)

    local git_branch = subscribe.buf_autocmd("el_git_branch", "BufEnter", function(window, buffer)
        local branch = extensions.git_branch(window, buffer)
        if branch then
            return " " .. extensions.git_icon() .. " " .. branch
        end
    end)

    local diagnostic_display = diagnostic.make_buffer()

    local show_current_func = function(window, buffer)
        if buffer.filetype == "lua" then
            return ""
        end

        return lsp_statusline.current_function(window, buffer)
    end

    local items = {
        { mode, required = true },
        { git_branch },
        { " " },
        { sections.split, required = true },
        { git_icon },
        { sections.maximum_width(builtin.file_relative, 0.60), required = true },
        { sections.collapse_builtin { { " " }, { builtin.modified_flag } } },
        { sections.split, required = true },
        { diagnostic_display },
        { show_current_func },
        { "[" },
        { builtin.line_with_width(3) },
        { ":" },
        { builtin.column_with_width(2) },
        { "]" },
        { builtin.filetype },
    }

    return items
end

return {
    "tjdevries/express_line.nvim",

    config = function()
        local el = require "el"

        -- Disappearing statusline for commands
        --
        -- vim.opt.cmdheight = 0
        -- vim.api.nvim_create_autocmd("ModeChanged", {
        --     group = vim.api.nvim_create_augroup("StatusDisappear", { clear = true }),
        --     callback = function()
        --         if vim.v.event.new_mode == "c" then
        --             vim.opt.laststatus = 0
        --         elseif vim.v.event.old_mode == "c" then
        --             vim.opt.laststatus = 3
        --         end

        --         vim.cmd [[silent! redraw]]
        --     end,
        -- })

        el.setup { generator = generator }
    end,
}
