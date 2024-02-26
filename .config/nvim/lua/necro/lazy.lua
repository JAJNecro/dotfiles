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
        'nvim-telescope/telescope.nvim', version = '0.1.4',
        -- or                            , branch = '0.1.x',
        dependencies = { {'nvim-lua/plenary.nvim'}, }
    },
    { 
        'rebelot/kanagawa.nvim',
        as = 'kanagawa',
        config = function()
            vim.cmd('colorscheme kanagawa')
        end
    },
    { 
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    },
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    'nvim-treesitter/playground', 
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim"  }
    },
    'mbbill/undotree', 
    'tpope/vim-fugitive', 
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            --- Uncomment these if you want to manage LSP servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            {'jay-babu/mason-nvim-dap.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    },
    {
        'hrsh7th/nvim-cmp',
        config = function ()
            require'cmp'.setup {
                snippet = {
                    expand = function(args)
                        require'luasnip'.lsp_expand(args.body)
                    end
                },

                sources = {
                    { name = 'luasnip' },
                    -- more sources
                },
            }
        end
    },
    'saadparwaiz1/cmp_luasnip',
    'petRUShka/vim-sage',
    {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim", -- required by telescope
        "MunifTanjim/nui.nvim",

        -- optional
        "rcarriga/nvim-notify",
        "nvim-tree/nvim-web-devicons",
    },
    {
        "nvim-neorg/neorg",
        ft = {'norg'},
        build = ":Neorg sync-parsers",
        dependencies = {{ "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },
        config = function()
            require("neorg").setup {
                load = {
                    ["core.defaults"] = {}, -- Loads default behaviour
                    ["core.concealer"] = {}, -- Adds pretty icons to your documents
                    ["core.dirman"] = { -- Manages Neorg workspaces
                        config = {
                            workspaces = {
                                notes = "~/neorg/notes",
                            },
                            default_workspace = "notes",
                        },
                    },
                    ["core.ui"] = {},
                    ["core.ui.calendar"] ={},
                    ["core.integrations.telescope"] = {},
                },
            }
        end,
    },
    'junegunn/goyo.vim',
    'preservim/vim-pencil',
    {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim", -- required by telescope
            "MunifTanjim/nui.nvim",

            -- optional
            "nvim-treesitter/nvim-treesitter",
            "rcarriga/nvim-notify",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            -- configuration goes here
            lang = "cpp",
        },
    },
    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        'mlr-msft/vim-loves-dafny',
        ft = {'dafny', 'dfy'}
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
    'jbyuki/nabla.nvim',
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    opts = {
        -- configuration goes here
    },
    {
        'lervag/vimtex',
        ft = 'tex',
        config = function()
            vim.g.vimtex_view_method = 'zathura'
            vim.g.vimtex_compiler_engine = 'lualatex'
            vim.g.maplocalleader = ','
            vim.g.vimtex_quickfix_node = 0
            vim.g.tex_conceal = 'abdmg'
        end,
    },
    {
        "iurimateus/luasnip-latex-snippets.nvim",
        -- vimtex isn't required if using treesitter
        branch = "fix/lazy-loading",
        dependencies = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
        ft = {"tex", "markdown" },
        config = function()
            require'luasnip-latex-snippets'.setup({ use_treesitter = true })
            -- or setup({ use_treesitter = true })
            require("luasnip").config.setup { enable_autosnippets = true }
        end,
  },
  {
      'mrcjkb/haskell-tools.nvim',
      version = '^3', -- Recommended
      ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
  },
}
})

