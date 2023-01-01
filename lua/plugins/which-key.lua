local M = {}

-- TODO: consider adding conf, opts, vopts, ... to a global variable (not sure if there is a use case for that)
local conf = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are CReated
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<CR>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadCRumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}


local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when CReating keymaps
    noremap = true, -- use `noremap` when CReating keymaps
    nowait = true, -- use `nowait` when CReating keymaps
}
local mappings = {
    ["/"] = { "<cmd>CommentToggle<CR>", "Comment" },
    ["c"] = { "<cmd>BufferClose!<CR>", "Close Buffer" },
    ["f"] = { "<cmd>Telescope find_files<CR>", "Find File" },
    ["e"] = { ":NvimTreeToggle<CR>", "File Explorer" },
	["q"] = {"<cmd>quit<CR>", "quit"},
	["="] = {"<cmd>resize +5<CR>", "Increase window"},
	["-"] = {"<cmd>resize -5<CR>", "Reduce window"},

    b = {
        name = "Buffer",
        f = { "<cmd>Telescope buffers<CR>", "Find" },
        b = { "<cmd>b#<CR>", "Previous" },
    },
    e = {
        e = { ":NvimTreeToggle<CR>", "File Explorer" },
        f = { ":NvimTreeFindFile<CR>", "Find File" },
    },
    f = {
        b = {":Telescope file_browser<CR>", "File Browser"},
        f = {":Telescope find_files<CR>", "Find Files"},
        g = {":Telescope git_commits<CR>", "Git Commits"},
        s = { "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>"},
        t = { "<cmd>Telescope live_grep<cr>", "Text" },
        G = {":Telescope git_branches<CR>", "Git Branches"},
    },
    g = {
        name = "Git",
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
        l = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "Blame" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", "Reset Buffer" },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "Stage Hunk" },
        u = {
          "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>",
          "Undo Stage Hunk",
        },
        o = { "<cmd>Telescope git_status<CR>", "Open changed file" },
        b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<CR>", "Checkout commit" },
        C = {
          "<cmd>Telescope git_bcommits<CR>",
          "Checkout commit(for current file)",
        },
        d = {
          "<cmd>Gitsigns diff this HEAD<CR>",
          "Git Diff",
        },
      },
    n = {
        name = "No (disable/toggle) option",
        l = { "<cmd>set rnu!<CR>", "Line number" },
        h = { "<cmd>nohlsearch<CR>", "No search highlights" }
    },
    p = {
        name = "Packer",
        c = { "<cmd>PackerCompile<CR>", "Compile" },
        i = { "<cmd>PackerInstall<CR>", "Install" },
        r = { "<cmd>lua require('utils').reload_lv_config()<CR>", "Reload" },
        s = { "<cmd>PackerSync<CR>", "Sync" },
        S = { "<csd>PackerStatus<CR>", "Status" },
        u = { "<cmd>PackerUpdate<CR>", "Update" },
	},
    L = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
        d = {
          "<cmd>Telescope lsp_document_diagnostics<CR>",
          "Document Diagnostics",
        },
        w = {
          "<cmd>Telescope lsp_workspace_diagnostics<CR>",
          "Workspace Diagnostics",
        },
        -- f = { "<cmd>silent FormatWrite<CR>", "Format" },
        f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format" },
        i = { "<cmd>LspInfo<CR>", "Info" },
        j = {
          "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
          "Next Diagnostic",
        },
        k = {
          "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",
          "Prev Diagnostic",
        },
        p = {
          name = "Peek",
          d = { "<cmd>lua require('lsp.peek').Peek('definition')<CR>", "Definition" },
          t = { "<cmd>lua require('lsp.peek').Peek('typeDefinition')<CR>", "Type Definition" },
          i = { "<cmd>lua require('lsp.peek').Peek('implementation')<CR>", "Implementation" },
        },
        q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
	},
	s = {
		name = "Split",
		v = { "<cmd> vsplit<CR>", "Vertical Split"},
		h = { "<cmd> split<CR>", "Horizontal Split"},
	},
    T = {
        name = "Treesitter",
        i = { ":TSConfigInfo<CR>", "Info" },
    },
}

local vopts = {}
local vmappings = {}

M.setup = function()
  local which_key = require "which-key"

  which_key.setup(conf)
  which_key.register(mappings, opts)
end

return M
