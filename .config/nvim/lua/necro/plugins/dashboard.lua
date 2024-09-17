return {
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                -- config
                theme = 'doom',
                config = {
                    week_header = {
                        enable = true
                    }, --your header
                    center = {
                        {
                            icon = ' ',
                            icon_hl = 'Title',
                            desc = 'Find File',
                            desc_hl = 'String',
                            key = 'f',
                            keymap = 'SPC f f',
                            key_hl = 'Number',
                            key_format = ' %s', -- remove default surrounding `[]`
                            action = 'Telescope find_files'
                        },
                        {
                            icon = '󱞁 ',
                            desc = 'Notes',
                            desc_hl = 'String',
                            key = 'n',
                            keymap = 'SPC n i',
                            key_format = ' %s', -- remove default surrounding `[]`
                            action = ":e ~/notes/school_notes/obsidian/Dashboard.md"
                        },
                        {
                            icon = ' ',
                            desc = 'Leetcode',
                            desc_hl = 'String',
                            key = 'l',
                            keymap = 'SPC n l',
                            key_format = ' %s', -- remove default surrounding `[]`
                            action = 'Leet'
                        },
                    },
                }
            }
        end,
        dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },
}
