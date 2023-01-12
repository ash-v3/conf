return {
    -- better vim.notify
    {
        "rcarriga/nvim-notify",
        init = function()
            vim.notify = require("notify")
        end,
    },

    -- better vim.ui
    {
        "stevearc/dressing.nvim",
        lazy = false,
        init = function()
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.select = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.select(...)
            end
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.input = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.input(...)
            end
        end,
    },

    -- bufferline
    -- {
    --   "akinsho/bufferline.nvim",
    --   lazy = false,
    --   -- event = "BufAdd",
    --   config = function() require("bufferline").setup() end,
    -- },

    -- statusline
    -- {
    --   "nvim-lualine/lualine.nvim",
    --   event = "VeryLazy",
    --   config = {
    --     options = {
    --       globalstatus = true,
    --       disabled_filetypes = { statusline = { "lazy", "alpha" } },
    --     },
    --   },
    -- },

    -- indent guides for Neovim
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPre",
        config = {
            char = "▏",
        },
    },

    -- noicer ui
    -- {
    --   "folke/noice.nvim",
    --   event = "VeryLazy",
    --   config = {
    --     lsp = {
    --       override = {
    --         ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
    --         ["vim.lsp.util.stylize_markdown"] = true,
    --       },
    --     },
    --     presets = {
    --       bottom_search = true,
    --       command_palette = true,
    --       long_message_to_split = true,
    --     },
    --   },
    -- },

    -- dashboard
    {
        "goolord/alpha-nvim",
        lazy = false,
        config = function()
            local dashboard = require("alpha.themes.dashboard")
            local logo = [[
                _      _               __      __
    /\         | |    | |              \ \    / /
   /  \    ___ | |__  | |  ___  _   _   \ \  / / 
  / /\ \  / __|| '_ \ | | / _ \| | | |   \ \/ /  
 / ____ \ \__ \| | | || ||  __/| |_| |    \  /   
/_/    \_\|___/|_| |_||_| \___| \__, |     \/    
                                 __/ |           
                                |___/            ]]
            dashboard.section.header.val = vim.split(logo, "\n")
            dashboard.section.buttons.val = {
                dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
                dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
                dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
                dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
                dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
                dashboard.button("l", "鈴" .. " Lazy", ":Lazy<CR>"),
                dashboard.button("q", " " .. " Quit", ":qa<CR>"),
            }
            for _, button in ipairs(dashboard.section.buttons.val) do
                button.opts.hl = "AlphaButtons"
                button.opts.hl_shortcut = "AlphaShortcut"
            end
            dashboard.section.footer.opts.hl = "Type"
            dashboard.section.header.opts.hl = "AlphaHeader"
            dashboard.section.buttons.opts.hl = "AlphaButtons"
            dashboard.opts.layout[1].val = 8

            if vim.bo[0].filetype == "lazy" then
                vim.notify("Missing plugins installed!", vim.log.levels.INFO, { title = "LazyVim" })
                vim.cmd.close()
            end

            require("alpha").setup(dashboard.opts)

            vim.api.nvim_create_autocmd("User", {
                pattern = "LazyVimStarted",
                callback = function()
                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
                    pcall(vim.cmd.AlphaRedraw)
                end,
            })
        end,
    },

    { "windwp/nvim-spectre", cmd = { "Spectre" }, config = function() require("spectre").setup() end },

    {
        "smjonas/inc-rename.nvim",
        cmd = "IncRename",
        config = true,
    },

    {
        "folke/drop.nvim",
        event = "VimEnter",
        enabled = true,
        config = function()
            math.randomseed(os.time())
            local theme = ({ "stars", "snow", "xmas" })[math.random(1, 3)]
            require("drop").setup({ theme = theme })
        end,
    },

    {
        "folke/paint.nvim",
        enabled = false,
        event = "BufReadPre",
        config = function()
            require("paint").setup({
                highlights = {
                    {
                        filter = { filetype = "lua" },
                        pattern = "%s*%-%-%-%s*(@%w+)",
                        hl = "Constant",
                    },
                    {
                        filter = { filetype = "lua" },
                        pattern = "%s*%-%-%[%[(@%w+)",
                        hl = "Constant",
                    },
                    {
                        filter = { filetype = "lua" },
                        pattern = "%s*%-%-%-%s*@field%s+(%S+)",
                        hl = "@field",
                    },
                    {
                        filter = { filetype = "lua" },
                        pattern = "%s*%-%-%-%s*@class%s+(%S+)",
                        hl = "@variable.builtin",
                    },
                    {
                        filter = { filetype = "lua" },
                        pattern = "%s*%-%-%-%s*@alias%s+(%S+)",
                        hl = "@keyword",
                    },
                    {
                        filter = { filetype = "lua" },
                        pattern = "%s*%-%-%-%s*@param%s+(%S+)",
                        hl = "@parameter",
                    },
                },
            })
        end,
    },

    {
        "norcalli/nvim-terminal.lua",
        ft = "terminal",
        config = true,
    },

    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
        config = {
            auto_open = false,
            use_diagnostic_signs = true, -- en
        },
    },

    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        config = { options = { "buffers", "curdir", "tabpages", "winsize", "help" } },
    },

    {
        "Wansmer/treesj",
        keys = {
            { "J", "<cmd>TSJToggle<cr>" },
        },
        config = { use_default_keymaps = false },
    },

    {
        "cshuaimin/ssr.nvim",
        keys = {
            {
                "<leader>cR",
                function()
                    require("ssr").open()
                end,
                mode = { "n", "x" },
                desc = "Structural Replace",
            },
        },
    },

    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        config = function()
            vim.g.startuptime_tries = 10
        end,
    },

    -- { 'akinsho/clock.nvim',
    --   cmd = { "ClockEnable", "ClockDisable" },
    --   config = function()
    --     require('clock').setup({
    --       border = 'rounded',
    --       style = 'dark_shadow' -- | 'default'
    --     })
    --   end },


    {
        "romgrk/barbar.nvim",
        lazy = false,
        -- types = false,
        dependencies = "nvim-web-devicons",
    },

    { "akinsho/toggleterm.nvim", cmd = "ToggleTerm", config = function()
        require("toggleterm").setup()
    end
    },

    {
        "ahmedkhalf/project.nvim",
        event = "VeryLazy",
        config = function()
            require("project_nvim").setup()
        end,
    },

    -- File tags in vim window
    { "liuchengxu/vista.vim", cmd = "Vista" },

    { "mg979/vim-visual-multi", lazy = false },

    { "tpope/vim-obsession", cmd = "Obsession" },

    { "ray-x/guihua.lua", lazy = false, build = "cd lua/fzy && make" },

    {
        "matbme/JABS.nvim",
        cmd = "JABSOpen",
        config = function()
            require("jabs").setup()
        end,
    },

    -- {
    --     "declancm/cinnamon.nvim",
    --     lazy = false,
    --     config = function()
    --         require("cinnamon").setup(
    --             {
    --                 default_keymaps = true, -- Create default keymaps.
    --                 extra_keymaps = true, -- Create extra keymaps.
    --                 extended_keymaps = true, -- Create extended keymaps.
    --                 always_scroll = true,
    --                 default_delay = 0.1
    --             }
    --         )
    --     end,
    -- },

    -- { "ojroques/vim-scrollstatus", event = "VeryLazy" },

    {
        "beauwilliams/focus.nvim",
        lazy = false,
        config = function()
            require("focus").setup({ hybridnumber = true, excluded_filetypes = { "toggleterm" } })
        end,
    },

    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
    },

    { "kdheepak/lazygit.nvim", cmd = "LazyGit" },

    { "renerocksai/calendar-vim", cmd = "Calendar" },

    {
        "samodostal/image.nvim",
        lazy = false,
        ft = { "jpg" },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("image").setup()
        end,
    },

    -- { "edluffy/hologram.nvim", ft = { "markdown", "latex" },
    --     config = function() require("hologram").setup({ auto_display = true }) end },
}
