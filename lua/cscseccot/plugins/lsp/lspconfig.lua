return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },

    config = function()
        local lspconfig = require "lspconfig"
        local cmp_nvim_lsp = require "cmp_nvim_lsp"

        local opts = { noremap = true, silent = true }
        local keymap = vim.keymap
        local on_attach = function(client, bufnr)
            opts.buffer = bufnr

            -- set keybinds
            opts.desc = "Show LSP references"
            keymap.set("n", "gR", ":Telescope lsp_references<CR>", opts) -- show definition, references

            opts.desc = "Go to declaration"
            keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

            opts.desc = "Show LSP definitions"
            keymap.set("n", "gd", ":Telescope lsp_definitions<CR>", opts) -- show lsp definitions

            opts.desc = "Show LSP implementations"
            keymap.set("n", "gimp", ":Telescope lsp_implementations<CR>", opts) -- show lsp implementations

            opts.desc = "Show LSP type definitions"
            keymap.set("n", "gt", ":Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

            opts.desc = "See available code actions"
            keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

            opts.desc = "Smart rename"
            keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

            opts.desc = "Show buffer diagnostics"
            keymap.set("n", "<leader>D", ":Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

            opts.desc = "Show line diagnostics"
            keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts) -- show diagnostics for line

            opts.desc = "Go to previous diagnostic"
            keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

            opts.desc = "Go to next diagnostic"
            keymap.set("n", "]d", function()
                vim.diagnostic.goto_next()
            end, opts) -- jump to next diagnostic in buffer

            opts.desc = "Show documentation for what is under cursor"
            keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

            -- opts.desc = "Show Signature Help"
            -- vim.keymap.set({ "n", "v", "i" }, "<C-l>", vim.lsp.buf.signature_help(), opts)
        end

        -- Border for :LspInfo
        require("lspconfig.ui.windows").default_options.border = "rounded"

        -- Border for hover thing in lsp
        local _border = "rounded"
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = _border,
        })
        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = _border,
        })
        vim.diagnostic.config {
            float = { border = _border },
        }

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- Setup Language Servers
        lspconfig["tsserver"].setup {
            capabilities = capabilities,
            on_attach = on_attach,
        }

        lspconfig["emmet_language_server"].setup {
            filetypes = {
                "css",
                "eruby",
                "html",
                "javascript",
                "javascriptreact",
                "less",
                "sass",
                "scss",
                "svelte",
                "pug",
                "typescriptreact",
                "vue",
            },
            -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
            -- **Note:** only the options listed in the table are supported.
            init_options = {
                --- @type string[]
                excludeLanguages = {},
                --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
                preferences = {},
                --- @type boolean Defaults to `true`
                showAbbreviationSuggestions = true,
                --- @type "always" | "never" Defaults to `"always"`
                showExpandedAbbreviation = "always",
                --- @type boolean Defaults to `false`
                showSuggestionsAsSnippets = false,
                --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
                syntaxProfiles = {},
                --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
                variables = {},
            },
        }

        lspconfig["cssls"].setup {
            capabilities = capabilities,
            on_attach = on_attach,
        }

        lspconfig["html"].setup {
            capabilities = capabilities,
            on_attach = on_attach,
        }

        lspconfig["pyright"].setup {
            capabilities = capabilities,
            on_attach = on_attach,
        }

        lspconfig["clangd"].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
        }

        lspconfig["cmake"].setup {
            capabilities = capabilities,
            on_attach = on_attach,
        }

        lspconfig["taplo"].setup {
            capabilities = capabilities,
            on_attach = on_attach,
        }

        lspconfig["bashls"].setup {
            capabilities = capabilities,
            on_attach = on_attach,
        }

        lspconfig["rust_analyzer"].setup {
            capabilities = capabilities,
            on_attach = on_attach,
        }

        lspconfig["csharp_ls"].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            config = function()
                vim.g.LanguageServer_csharp_ls_bin = "/opt/homebrew/Cellar/dotnet/8.0.0/libexec"
            end,
        }

        lspconfig["lua_ls"].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = { -- custom settings for lua
                Lua = {
                    -- make the language server recognize "vim" global
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        -- make language server aware of runtime files
                        library = {
                            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                            [vim.fn.stdpath "config" .. "/lua"] = true,
                        },
                    },
                },
            },
        }
    end,
}
