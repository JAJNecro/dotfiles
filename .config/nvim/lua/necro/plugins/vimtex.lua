return {
    {
	    'lervag/vimtex',
	    ft = 'tex',
	    config = function()
		    vim.g.vimtex_view_method = 'zathura'
		    vim.g.vimtex_compiler_engine = 'lualatex'
		    vim.g.maplocalleader = ','
		    vim.g.vimtex_quickfix_node = 0
		    vim.g.tex_conceal = 'abdmg'
            vim.cmd[[
            let g:Tex_IgnoredWarnings = 
            \'Underfull'."\n".
            \'Overfull'."\n".
            \'specifier changed to'."\n".
            \'You have requested'."\n".
            \'Missing number, treated as zero.'."\n".
            \'There were undefined references'."\n".
            \'LaTeX Font Warning:'."\n".
            \'Citation %.%# undefined'
            let g:Tex_IgnoreLevel = 8
            let g:vimtex_quickfix_ignore_filters = [
            \'Underfull',
            \'Overfull',
            \'LaTeX Font Warning:',
            \]
            ]]
	    end,
    },
}
