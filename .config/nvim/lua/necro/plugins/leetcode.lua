return {
	{
		"kawre/leetcode.nvim",
        cmd = 'Leet',
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
            arg = "leetcode.nvim",
			lang = "python3",
            image_support = true,
		},
	},
}
