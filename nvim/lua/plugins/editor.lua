vim.g.neo_tree_remove_legacy_commands = 1

return {
    { "lewis6991/impatient.nvim", lazy = false, priority = 1000 },

    -- file explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = "Neotree",
        keys = { { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree" } },
        config = {
            filesystem = {
                follow_current_file = true,
                hijack_netrw_behavior = "open_current",
            },
        },
    },

    -- fuzzy finder
    -- {
    --   "nvim-telescope/telescope.nvim",
    --   cmd = "Telescope",
    --   keys = {
    --     { "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    --     { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    --     { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
    --     { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    --     { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Find in Files (Grep)" },
    --   },
    --   config = true,
    -- },

    -- which-key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            local wk = require("which-key")
            wk.setup({
                show_help = false,
                plugins = { spelling = true },
                key_labels = { ["<leader>"] = "SPC" },
            })
            wk.register({
                f = { name = "+file" },
                g = { name = "+git" },
                b = { name = "+buffer" },
            }, { prefix = "<leader>" })
        end,
    },

    -- -- git signs
    -- {
    --   "lewis6991/gitsigns.nvim",
    --   event = "BufReadPre",
    --   config = {
    --     signs = {
    --       add = { text = "▎" },
    --       change = { text = "▎" },
    --       delete = { text = "契" },
    --       topdelete = { text = "契" },
    --       changedelete = { text = "▎" },
    --       untracked = { text = "▎" },
    --     },
    --   },
    -- },

    -- references
    {
        "RRethy/vim-illuminate",
        event = "BufReadPost",
        config = function()
            require("illuminate").configure({ delay = 200 })
        end,
        keys = {
            {
                "]]",
                function()
                    require("illuminate").goto_next_reference(false)
                end,
                desc = "Next Reference",
            },
            {
                "[[",
                function()
                    require("illuminate").goto_prev_reference(false)
                end,
                desc = "Prev Reference",
            },
        },
    },

    -- buffer remove
    --{
    --  "echasnovski/mini.bufremove",
    --  keys = {
    --    {
    --      "<leader>bd",
    --      function()
    --        require("mini.bufremove").delete(0, false)
    --      end,
    --      desc = "Delete Buffer",
    --    },
    --    {
    --      "<leader>bD",
    --      function()
    --        require("mini.bufremove").delete(0, true)
    --      end,
    --      desc = "Delete Buffer (Force)",
    --    },
    --  },
    --},

    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        config = {
            plugins = {
                gitsigns = true,
                tmux = true,
                kitty = { enabled = false, font = "+2" },
            },
        },
    },

    -- {
    --   "andymass/vim-matchup",
    --   event = "BufReadPost",
    --   config = function()
    --     vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
    --   end,
    -- },

    {
        'akinsho/git-conflict.nvim',
        cmd = { "GitConflictChooseOurs", "GitConflictChooseTheirs", "GitConflictChooseBoth", "GitConflictChooseNone",
            "GitConflictNextConflict", "GitConflictPrevConflict", "GitConflictListQf" }, config = function()
            require('git-conflict').setup()
        end
    },

    -- Hop
    {
        "phaazon/hop.nvim",
        branch = "v2", -- optional but strongly recommended
        event = "VimEnter",
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
        end,
    },

    { "chrisbra/unicode.vim", event = "VimEnter" },

    { "wellle/targets.vim", event = "VimEnter" },

    {
        "terror/chatgpt.nvim",
        build = "pip3 install -r requirements.txt",
        cmd = "ChatGPT"
    },

    {
        "karb94/neoscroll.nvim",
        event = "VimEnter",
        config = function()
            require("neoscroll").setup {
                easing_function = "quadratic",
            }

            local t = {}
            -- Syntax: t[keys] = {function, {function arguments}}
            -- Use the "sine" easing function
            t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "20", [['cubic']] } }
            t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "20", [['cubic']] } }
            -- Use the "circular" easing function
            t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "50", [['cubic']] } }
            t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "50", [['cubic']] } }
            -- Pass "nil" to disable the easing animation (constant scrolling speed)
            t["<C-y>"] = { "scroll", { "-0.10", "false", "100", nil } }
            t["<C-e>"] = { "scroll", { "0.10", "false", "100", nil } }
            -- When no easing function is provided the default easing function (in this case "quadratic") will be used
            t["zt"] = { "zt", { "10" } }
            t["zz"] = { "zz", { "10" } }
            t["zb"] = { "zb", { "10" } }

            require("neoscroll.config").set_mappings(t)
        end,
    },

    -- {
    --   "ldelossa/litee.nvim",
    --   config = function()
    --     require("litee.lib").setup()
    --   end,
    -- },

    -- {
    --   "jghauser/mkdir.nvim",
    --   cmd = "w",
    -- },

    { "junegunn/vim-easy-align", event = "VeryLazy" },

    {
        "NFrid/due.nvim",
        ft = "markdown",
        config = function()
            require("due_nvim").setup({})
        end,
    },

    {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        config = function() require("nvim-tree").setup() end,
        cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile", "NvimTreeCollapse" },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    },

    { "iamcco/markdown-preview.nvim", build = "cd app && npm install",
        init = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" } },

    { "godlygeek/tabular", cmd = "Tabularize" },

    { "Pocco81/HighStr.nvim", cmd = { "HSExport", "HSHighlight", "HSImport", "HSRmHighlight" } },

    -- { "tmillr/sos.nvim", config = function() require("sos").setup() end }

    { "numToStr/FTerm.nvim", config = function() require("FTerm").setup({}) end },

    { "Chaitanyabsprip/present.nvim", cmd = { "Present", "PresentEnable", "PresentDisable" },
        config = function() require("present").setup() end }
}
