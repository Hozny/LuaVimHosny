local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    --	print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then vim.cmd("packadd " .. plugin) end
    return ok, err, code
end

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
  return
end

packer.init {
  -- compile_path = vim.fn.stdpath('data')..'/site/pack/loader/start/packer.nvim/plugin/packer_compiled.vim',
  compile_path = require("packer.util").join_paths(vim.fn.stdpath "config", "plugin", "packer_compiled.vim"),
  git = { clone_timeout = 300 },
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
}

vim.cmd("autocmd BufWritePost plugins.lua PackerCompile") -- Auto compile when there are changes in plugins.lua

return require("packer").startup(function(use)
    -- Packer can manage itself as an optional plugin
    use "wbthomason/packer.nvim"

     -- TODO refactor all of this (for now it works, but yes I know it could be wrapped in a simpler function)
    use {"neovim/nvim-lspconfig", opt = true}
    use {"glepnir/lspsaga.nvim", opt = true}
    use {"kabouzeid/nvim-lspinstall", opt = true}
    use {"folke/trouble.nvim", opt = true}
    --[[
    require_plugin("nvim-lspconfig")
    require_plugin("lspsaga.nvim")
    require_plugin("nvim-lspinstall")
    require_plugin("trouble.nvim")
    --]]
         
    -- Telescope
    use {"nvim-lua/popup.nvim", opt = true}
    use {"nvim-lua/plenary.nvim", opt = true}
    use { "tjdevries/astronauta.nvim" }
    use {
        "nvim-telescope/telescope.nvim",
        config = [[require('lv-telescope')]],
        cmd = "Telescope",
   }
    use {"nvim-telescope/telescope-fzy-native.nvim", opt = true}
    use {"nvim-telescope/telescope-project.nvim", opt = true}

    --[[
    require_plugin("popup.nvim")
    require_plugin("plenary.nvim")
    require_plugin("telescope.nvim")
    require_plugin("telescope-project.nvim")
    require_plugin("austronata.nvim")
    --]]

    -- Icons
    use {"kyazdani42/nvim-web-devicons", opt = true}
    require_plugin("nvim-web-devicons") 

    -- Debugging
    use {"mfussenegger/nvim-dap", opt = true}

    -- Snap
    use {
        "camspiers/snap",
        rocks = "fzy",
        config = function()
          require("hzny-snap").config()
        end,
        disable = not O.plugin.snap.active,
    }
    -- Autocomplete
    use {
        "hrsh7th/nvim-compe",
        config = function()
            require("hzny-compe").config()
        end
    }
    use {"hrsh7th/vim-vsnip", opt = true}
    use {"rafamadriz/friendly-snippets", opt = true}
    --require_plugin("nvim-compe")

     -- whichkey
    use {"folke/which-key.nvim"}

    -- Treesitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use {"windwp/nvim-ts-autotag", opt = true}
    use {'andymass/vim-matchup', opt = true}
    require_plugin("snap")
    require_plugin("vim-vsnip")
    require_plugin("friendly-snippets")
    require_plugin("which-key")
    require_plugin("nvim-treesitter")
    require_plugin("nvim-ts-autotag")
    require_plugin("vim-matchup")

    -- Nvim Tree
    use {"kyazdani42/nvim-tree.lua"}
    require_plugin("nvim-tree.lua")

    -- Explorer
    use {"ahmedkhalf/lsp-rooter.nvim", opt = true} -- with this nvim-tree will follow you
    require_plugin("lsp-rooter.nvim")
    -- TODO remove when open on dir is supported by nvimtree
    use "kevinhwang91/rnvimr"
    require_plugin("rnvimr")

   use {
        "lewis6991/gitsigns.nvim",
        config = function()
          require("hzny-gitsigns").config()
        end,
        event = "BufRead",
    }

    -- Comments
    use {
        "terrortylor/nvim-comment",
        cmd = "CommentToggle",
        config = function()
          require("nvim_comment").setup()
        end,
    }

    -- Themes
    use {"morhetz/gruvbox", opt = true}
    require_plugin("gruvbox")

   end)
