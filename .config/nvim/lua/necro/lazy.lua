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
        event = "VimEnter",
        -- or                            , branch = '0.1.x',
        dependencies = { {'nvim-lua/plenary.nvim'}, }
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
        event = "InsertEnter",
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
        event = "InsertEnter",
        config = function ()
            require'cmp'.setup {
                snippet = {
                    expand = function(args)
                        require'luasnip'.lsp_expand(args.body)
                    end
                },

                sources = {
                    { name = 'luasnip' },
                    { name = 'neorg' },
                    { name = 'orgmode' },
                    -- more sources
                },
            }
        end
    },
    'saadparwaiz1/cmp_luasnip',
    'petRUShka/vim-sage',
    {
        "kawre/leetcode.nvim",
        event = "InsertEnter",
        cmd = "Leet",
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
        opts = {
            lang = "python3",
        },
    {
        "nvim-neorg/neorg",
        ft = 'norg',
        build = ":Neorg sync-parsers",
        dependencies = {{ "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" }, {'3rd/image.nvim'}, },
        config = function()
            require("neorg").setup {
                load = {
                    ["core.defaults"] = {}, -- Loads default behaviour
                    ["core.concealer"] = {
                        config = {
                            icons = {
                                code_block = {
                                    conceal = true,
                                }
                            }
                        }
                    }, -- Adds pretty icons to your documents
                    ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
                    ["core.keybinds"] = {
                        -- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
                        config = {
                            default_keybinds = true,
                            neorg_leader = "<Leader><Leader>",
                        },
                    },
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
                    ["core.integrations.treesitter"] = {},
                    ["core.integrations.image"] = {},
                    ["core.integrations.nvim-cmp"] = {},
                    ["core.latex.renderer"] = {},
                    ["core.highlights"] = {},
                    ["core.mode"] = {},
                    ["core.autocommands"] = {},
                },
            }
            vim.opt.conceallevel = 2
            local neorg_callbacks = require("neorg.core.callbacks")

            neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
                -- Map all the below keybinds only when the "norg" mode is active
                keybinds.map_event_to_mode("norg", {
                    n = { -- Bind keys in normal mode
                        { "<C-s>", "core.integrations.telescope.find_linkable" },
                    },

                    i = { -- Bind in insert mode
                        { "<C-l>", "core.integrations.telescope.insert_link" },
                    },
                }, {
                    silent = true,
                    noremap = true,
                })
            end)
        end,
    },
    {
        "folke/zen-mode.nvim",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
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
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
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
      event = "BufEnter *.hs",
      ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
      config = function()
          local ht = require('haskell-tools')
          local bufnr = vim.api.nvim_get_current_buf()
          local opts = { noremap = true, silent = true, buffer = bufnr, }
          -- haskell-language-server relies heavily on codeLenses,
          -- so auto-refresh (see advanced configuration) is enabled by default
          vim.keymap.set('n', '<space>cl', vim.lsp.codelens.run, opts)
          -- Hoogle search for the type signature of the definition under the cursor
          vim.keymap.set('n', '<space>hs', ht.hoogle.hoogle_signature, opts)
          -- Evaluate all code snippets
          vim.keymap.set('n', '<space>ea', ht.lsp.buf_eval_all, opts)
          -- Toggle a GHCi repl for the current package
          vim.keymap.set('n', '<leader>rr', ht.repl.toggle, opts)
          -- Toggle a GHCi repl for the current buffer
          vim.keymap.set('n', '<leader>rf', function()
              ht.repl.toggle(vim.api.nvim_buf_get_name(0))
          end, opts)
          vim.keymap.set('n', '<leader>rq', ht.repl.quit, opts)
      end,
  },
  {
      '3rd/image.nvim',
      ft = 'norg', 'md',
      config = function()
          -- default config
          require("image").setup({
              backend = "kitty",
              integrations = {
                  markdown = {
                      enabled = true,
                      clear_in_insert_mode = false,
                      download_remote_images = true,
                      only_render_image_at_cursor = false,
                      filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
                  },
                  neorg = {
                      enabled = true,
                      clear_in_insert_mode = false,
                      download_remote_images = true,
                      only_render_image_at_cursor = false,
                      filetypes = { "norg" },
                  },
              },
              max_width = nil,
              max_height = nil,
              max_width_window_percentage = nil,
              max_height_window_percentage = 50,
              window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
              window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
              editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
              tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
              hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" }, -- render image files as images when opened
          })
      end,
  },
}
})

