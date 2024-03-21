return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
        local conform = require "conform"

        conform.setup {
            formatters_by_ft = {
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                -- css = { "prettier" },
                -- html = { "prettier" },
                -- json = { "prettier" },
                -- markdown = { "prettier" },

                lua = { "stylua" },

                python = { "autopep8" },

                cpp = { "clang-format" },
                c = { "clang-format" },
            },

            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            },
        }

        vim.keymap.set({ "n", "v" }, "<leader>f", function()
            conform.format {
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            }
        end)
    end,
}
