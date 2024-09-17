return {
    {
	    "folke/zen-mode.nvim",
        cmd = "ZenMode",
    },
    {
        'preservim/vim-pencil',
        cmd = "SoftPencil",
    },
    {
	    'stevearc/oil.nvim',
        cmd = "Oil",
	    opts = {},
	    -- Optional dependencies
	    dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function ()
            require("oil").setup()
        end
    },
}
