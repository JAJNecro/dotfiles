return {
    {
        "nvim-neorg/neorg",
        lazy = false,
        enabled = false,
        dependencies = {{ "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" }, {'3rd/image.nvim'}, "luarocks.nvim"},
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
                        { "<Leader>fh", "core.integrations.telescope.search_headings" },
                        { "<Leader>fn", "core.integrations.telescope.find_norg_files" },
                    },

                    i = { -- Bind in insert mode
                        { "<C-l>", "core.integrations.telescope.insert_link" },
                        { "<C-f>", "core.integrations.telescope.insert_file_link" },
                    },
                }, {
                    silent = true,
                    noremap = true,
                })
            end)
        end,
    },
    {
        '3rd/image.nvim',
        ft = 'norg',
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
            })
        end,
    },
    {
        "vhyrro/luarocks.nvim",
        priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
        config = true,
    },
}
