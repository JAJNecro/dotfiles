return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function ()
            ColorTransparent = function ()
                require("tokyonight").setup({
                    transparent = true,
                    styles = {
                        sidebars = "transparent",
                        floats = "transparent",
                    },
                    on_colors = function(colors)
                        colors.fg_gutter = "#b2b8cf"
                    end
                })
            end
            vim.cmd.colorscheme "tokyonight-night"
            vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
            vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
        end
    },
}
