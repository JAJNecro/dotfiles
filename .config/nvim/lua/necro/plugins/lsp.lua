return {
    {
        'VonHeikemen/lsp-zero.nvim',
        event = "BufReadPost",
        branch = 'v3.x',
        dependencies = {
            --- Uncomment these if you want to manage LSP servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
--            {'jay-babu/mason-nvim-dap.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
            {"folke/trouble.nvim"},
            -- Formatter
            {"mhartington/formatter.nvim"},
        },
        config = function()
            local lsp_zero = require('lsp-zero')

            vim.diagnostic.config({
                virtual_text = false,
                signs = true,
                underline = true,
                update_in_insert = true,
                severity_sort = false,
            })

            lsp_zero.on_attach(function(client, bufnr)
                local opts = {buffer = bufnr, remap = false}

                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            end)

            require('mason').setup({})
            --require("mason-nvim-dap").setup()
            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
                    end,
                }
            })

            local cmp = require('cmp')
            local cmp_select = {behavior = cmp.SelectBehavior.Select}

            cmp.setup({
                sources = {
                    {name = 'path'},
                    {name = 'nvim_lsp'},
                    {name = 'nvim_lua'},
                },
                formatting = lsp_zero.cmp_format(),
                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-Space>'] = cmp.mapping.complete(),
                }),
            })
            require'lspconfig'.dafny.setup{}  --dafny lsp
        end,
    },
    {
	    'mrcjkb/haskell-tools.nvim',
	    version = '^3', -- Recommended
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
            vim.keymap.set('n', '<leader>l', ht.repl.reload, opts)
	    end,
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
    {
	    'mlr-msft/vim-loves-dafny',
	    ft = {'dafny', 'dfy'}
    },
    {
	    "folke/trouble.nvim",
        event = "BufReadPost",
	    dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function ()
            vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
            vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
            vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
            vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
            vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
            vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
        end
    },
    {
        'petRUShka/vim-sage',
        ft = "sage",
    },
}
