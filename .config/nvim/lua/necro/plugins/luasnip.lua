return {
    {
        'saadparwaiz1/cmp_luasnip',
        event = "BufReadPost",
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
            vim.cmd[[
            " press <Tab> to expand or jump in a snippet. These can also be mapped separately
            " via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
            imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
            " -1 for jumping backwards.
            inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

            snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
            snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

            " For changing choices in choiceNodes (not strictly necessary for a basic setup).
            imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
            smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
            ]]
	    end,
    },
}