CONFIG_PATH = vim.fn.stdpath('config')
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

O = {
    colorscheme = 'gruvbox',

    auto_close_tree = 0,
    auto_complete = true,
    --colorscheme = 'lunar',
    hidden_files = true,
    wrap_lines = false,
    number = true,
    relative_number = true,
    shell = 'bash',
	timeoutlen = 100,
    nvim_tree_disable_netrw = 0,
    extras = false,
    lang = {
        python = {
            linter = '',
            -- @usage can be 'yapf', 'black'
            formatter = '',
            autoformat = false,
            isort = false,
            diagnostics = {
                virtual_text = {spacing = 0, prefix = ""},
                signs = true,
                underline = true
            },
            analysis = {
                type_checking = "basic",
                auto_search_paths = true,
                use_library_code_types = true
            }
        },
        lua = {
            -- @usage can be 'lua-format'
            formatter = '',
            autoformat = false,
            diagnostics = {
                virtual_text = {spacing = 0, prefix = ""},
                signs = true,
                underline = true
            }
        },
        sh = {
            -- @usage can be 'shellcheck'
            linter = '',
            -- @usage can be 'shfmt'
            formatter = '',
            autoformat = false,
            diagnostics = {
                virtual_text = {spacing = 0, prefix = ""},
                signs = true,
                underline = true
            }
        },
    },
    plugin = {
        hop = {active = false},
        dial = {active = false},
        dashboard = {active = false},
        matchup = {active = false},
        colorizer = {active = false},
        numb = {active = false},
        zen = {active = false},
        ts_playground = {active = false},
        indent_line = {active = false},
        ts_context_commentstring = {active = false},
        symbol_outline = {active = false},
        debug = {active = false},
        bqf = {active = false},
        trouble = {active = false},
        floatterm = {active = false},
        spectre = {active = false},
        lsp_rooter = {active = false},
        markdown_preview = {active = false},
        codi = {active = false},
        telescope_fzy = {active = false},
        sanegx = {active = false},
        snap = {active = false},
        ranger = {active = false},
        todo_comments = {active = false},
        lsp_colors = {active = false},
        git_blame = {active = false},
        gist = {active = false},
        gitlinker = {active = false},
        lazygit = {active = false},
        octo = {active = false},
        lush = {active = false},
        diffview = {active = false},
        bracey = {active = false},
        telescope_project = {active = false},
        dap_install = {active = false}
    },
}
