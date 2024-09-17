return {
	'mbbill/undotree',
    event = "BufReadPost",
    config = function()
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end
}
