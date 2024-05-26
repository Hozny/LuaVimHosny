-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({

    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    ----------------- Themes -------------------
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            -- vim.cmd('colorscheme rose-pine')
        end
    },

    {
        "ellisonleao/gruvbox.nvim",
        name = 'gruvbox',
        config = function()
            vim.cmd('colorscheme gruvbox')
        end
    },

    { 
        "catppuccin/nvim", name = "catppuccin" 
    }, -- looks promising, amoled variant

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
          local configs = require("nvim-treesitter.configs")

          configs.setup({
              ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
              sync_install = false,
              highlight = { enable = true },
              indent = { enable = true },  
            })
        end
    },

    {'nvim-tree/nvim-tree.lua',
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      keys = {
        { "<leader>pv", ":NvimTreeFindFileToggle<CR>", desc = "Toggle tree" },
        { "<leader>pe", ":NvimTreeFindFile<CR>", desc = "Toggle tree" },
        { "<leader>pt", ":NvimTreeToggle<CR>", desc = "Toggle tree" },
      },
      config = function()
        require("nvim-tree").setup({})
      end
    },
    {
        'theprimeagen/harpoon',
        config = function()
            require("harpoon").setup({
                menu = {
                    width = vim.api.nvim_win_get_width(0) - 4,
                }
            })
        end
    },
    {'mbbill/undotree'},
    {'tpope/vim-fugitive'},
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },


    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    },

    {
        'pechorin/any-jump.vim'
    },

    -------------- SCALA setup -----------------
    -- TODO: move remaps to remap.lua
   --[[ 
    {
        "scalameta/nvim-metals",
        dependencies = {
          "nvim-lua/plenary.nvim",
          {
            "j-hui/fidget.nvim",
            opts = {},
          },
          {
            "mfussenegger/nvim-dap",
            config = function(self, opts)
              -- Debug settings if you're using nvim-dap
              local dap = require("dap")

              dap.configurations.scala = {
                {
                  type = "scala",
                  request = "launch",
                  name = "RunOrTest",
                  metals = {
                    runType = "runOrTestFile",
                    --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
                  },
                },
                {
                  type = "scala",
                  request = "launch",
                  name = "Test Target",
                  metals = {
                    runType = "testTarget",
                  },
                },
              }
            end
          },
        },
        ft = { "scala", "sbt", "java", "bazel" },
        opts = function()
          local metals_config = require("metals").bare_config()

          -- Example of settings
          metals_config.settings = {
            showImplicitArguments = true,
            excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
          }

          -- *READ THIS*
          -- I *highly* recommend setting statusBarProvider to either "off" or "on"
          --
          -- "off" will enable LSP progress notifications by Metals and you'll need
          -- to ensure you have a plugin like fidget.nvim installed to handle them.
          --
          -- "on" will enable the custom Metals status extension and you *have* to have
          -- a have settings to capture this in your statusline or else you'll not see
          -- any messages from metals. There is more info in the help docs about this
          metals_config.init_options.statusBarProvider = "off"

          -- Example if you are using cmp how to make sure the correct capabilities for snippets are set
          metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

          metals_config.on_attach = function(client, bufnr)
            require("metals").setup_dap()

            -- LSP mappings
            map("n", "gD", vim.lsp.buf.definition)
            map("n", "K", vim.lsp.buf.hover)
            map("n", "gi", vim.lsp.buf.implementation)
            map("n", "gr", vim.lsp.buf.references)
            map("n", "gds", vim.lsp.buf.document_symbol)
            map("n", "gws", vim.lsp.buf.workspace_symbol)
            map("n", "<leader>cl", vim.lsp.codelens.run)
            map("n", "<leader>sh", vim.lsp.buf.signature_help)
            map("n", "<leader>rn", vim.lsp.buf.rename)
            map("n", "<leader>f", vim.lsp.buf.format)
            map("n", "<leader>ca", vim.lsp.buf.code_action)

            map("n", "<leader>ws", function()
              require("metals").hover_worksheet()
            end)

            -- all workspace diagnostics
            map("n", "<leader>aa", vim.diagnostic.setqflist)

            -- all workspace errors
            map("n", "<leader>ae", function()
              vim.diagnostic.setqflist({ severity = "E" })
            end)

            -- all workspace warnings
            map("n", "<leader>aw", function()
              vim.diagnostic.setqflist({ severity = "W" })
            end)

            -- buffer diagnostics only
            map("n", "<leader>d", vim.diagnostic.setloclist)

            map("n", "[c", function()
              vim.diagnostic.goto_prev({ wrap = false })
            end)

            map("n", "]c", function()
              vim.diagnostic.goto_next({ wrap = false })
            end)

            -- Example mappings for usage with nvim-dap. If you don't use that, you can
            -- skip these
            map("n", "<leader>dc", function()
              require("dap").continue()
            end)

            map("n", "<leader>dr", function()
              require("dap").repl.toggle()
            end)

            map("n", "<leader>dK", function()
              require("dap.ui.widgets").hover()
            end)

            map("n", "<leader>dt", function()
              require("dap").toggle_breakpoint()
            end)

            map("n", "<leader>dso", function()
              require("dap").step_over()
            end)

            map("n", "<leader>dsi", function()
              require("dap").step_into()
            end)

            map("n", "<leader>dl", function()
              require("dap").run_last()
            end)
          end

          return metals_config
        end,
        config = function(self, metals_config)
          local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
          vim.api.nvim_create_autocmd("FileType", {
            pattern = self.ft,
            callback = function()
              require("metals").initialize_or_attach(metals_config)
            end,
            group = nvim_metals_group,
          })
        end
    },
    --]]

    {
        "CopilotC-Nvim/CopilotChat.nvim",
        opts = {
          show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
          debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
          disable_extra_info = 'no', -- Disable extra information (e.g: system prompt) in the response.
          language = "English" -- Copilot answer language settings when using default prompts. Default language is English.
          -- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
          -- temperature = 0.1,
        },
        build = function()
          vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
        end,
        event = "VeryLazy"
    },


    {
        'terrortylor/nvim-comment',
        config = function()
            require('nvim_comment').setup({
              -- Linters prefer comment and line to have a space in between markers
              marker_padding = true,
              -- should comment out empty or whitespace only lines
              comment_empty = true,
              -- trim empty comment whitespace
              comment_empty_trim_whitespace = true,
              -- Should key mappings be created
              create_mappings = true,
              -- Normal mode mapping left hand side
              line_mapping = "<leader>c",
              -- Visual/Operator mapping left hand side
              operator_mapping = "<leader>/",
              -- text object mapping, comment chunk,,
              comment_chunk_text_object = "ic",
              -- Hook function to call before commenting takes place
              hook = nil
            })
        end
    }, -- Commenting plugin

    {'github/copilot.vim'},

    -- Kitty plugin for moving between windows (doesn't work as expected)
    {
        "MunsMan/kitty-navigator.nvim",
        keys = {
            {"<C-h>", function()require("kitty-navigator").navigateLeft()end, desc = "Move left a Split", mode = {"n"}},
            {"<C-j>", function()require("kitty-navigator").navigateDown()end, desc = "Move down a Split", mode = {"n"}},
            {"<C-k>", function()require("kitty-navigator").navigateUp()end, desc = "Move up a Split", mode = {"n"}},
            {"<C-l>", function()require("kitty-navigator").navigateRight()end, desc = "Move right a Split", mode = {"n"}},
        },
        build = {
            "cp navigate_kitty.py ~/.config/kitty",
            "cp pass_keys.py ~/.config/kitty",
        }
    }
})
