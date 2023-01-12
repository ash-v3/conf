return {

    -- snippets
    -- {
    --   "L3MON4D3/LuaSnip",
    --   dependencies = {
    --     "rafamadriz/friendly-snippets",
    --     config = function()
    --       require("luasnip.loaders.from_vscode").lazy_load()
    --     end,
    --   },
    -- },

    -- auto completion
    -- {
    --   "hrsh7th/nvim-cmp",
    --   event = "InsertEnter",
    --   dependencies = {
    --     -- "hrsh7th/cmp-nvim-lsp",
    --     "hrsh7th/cmp-buffer",
    --     "hrsh7th/cmp-emoji",
    --     { "hrsh7th/cmp-cmdline" },
    --     { "dmitmel/cmp-cmdline-history" },
    --     "hrsh7th/cmp-path",
    --     "saadparwaiz1/cmp_luasnip",
    --   },
    --
    --   config = function()
    --     local cmp = require("cmp")
    --     cmp.setup({
    --       completion = {
    --         completeopt = "menu,menuone,noinsert",
    --       },
    --       snippet = {
    --         expand = function(args)
    --           require("luasnip").lsp_expand(args.body)
    --         end,
    --       },
    --       mapping = cmp.mapping.preset.insert({
    --         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    --         ["<C-f>"] = cmp.mapping.scroll_docs(4),
    --         ["<C-Space>"] = cmp.mapping.complete(),
    --         ["<C-e>"] = cmp.mapping.abort(),
    --         ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    --         ["<C-p>"] = cmp.mapping.select_prev_item(),
    --         ["<C-n>"] = cmp.mapping({ i = function()
    --           cmp.select_next_item({ behavior = cmp.SelectBehavior.Replace })
    --         end
    --         }),
    --       }),
    --       sources = cmp.config.sources({
    --         -- { name = "nvim_lsp" },
    --         { name = "luasnip" },
    --         { name = "buffer" },
    --         { name = "path" },
    --         { name = "emoji" },
    --         { name = "neorg" },
    --       }),
    --       formatting = {
    --         format = function(_, item)
    --           local icons = require("config.icons").kinds
    --           if icons[item.kind] then
    --             item.kind = icons[item.kind] .. item.kind
    --           end
    --           return item
    --         end,
    --       },
    --     })
    --   end,
    -- },

    -- auto pairs
    -- {
    --   "echasnovski/mini.pairs",
    --   event = "VeryLazy",
    --   config = function()
    --     require("mini.pairs").setup({})
    --   end,
    -- },

    -- comments
    -- { "JoosepAlviste/nvim-ts-context-commentstring" },
    -- {
    --   "echasnovski/mini.comment",
    --   event = "VeryLazy",
    --   config = function()
    --     require("mini.comment").setup({
    --       hooks = {
    --         pre = function()
    --           require("ts_context_commentstring.internal").update_commentstring({})
    --         end,
    --       },
    --     })
    --   end,
    -- },

    -- Only use these plugin on Windows and Mac and when LaTeX is installed
    {
        "lervag/vimtex",
        ft = { "tex" },
    },

    { "cespare/vim-toml", ft = { "toml" }, branch = "main" },

    { "sakhnik/nvim-gdb", cmd = { "GdbStart", "GdbStartBashDB", "GdbStartLLDB", "GdbStartPDB", "GdbStartRR" },
        build = { ":!./install.sh" } },

    { "vim-autoformat/vim-autoformat", cmd = "AutoFormat" },

    { "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" },

    {
        "ray-x/go.nvim",
        ft = "go",
        config = function()
            require("go").setup()
        end,
    },

    {
        "potamides/pantran.nvim",
        cmd = "Pantran"
    },

    -- {
    --   "filipdutescu/renamer.nvim",
    --   lazy = false,
    --   dependencies = { { "nvim-lua/plenary.nvim" } },
    --   config = function()
    --     require("renamer").setup({})
    --   end,
    -- },

    -- {
    --   "AckslD/nvim-neoclip.lua",
    --   event = "VeryLazy",
    --   dependencies = {
    --     { 'kkharji/sqlite.lua', module = 'sqlite' },
    --     -- you'll need at least one of these
    --     { 'nvim-telescope/telescope.nvim' },
    --     -- { 'ibhagwan/fzf-lua' },
    --   },
    --   config = function()
    --     require("neoclip").setup()
    --   end,
    -- },

    { "sheerun/vim-polyglot", event = "VeryLazy" },

    {
        "nvim-neotest/neotest",
        lazy = false,
        -- cmd = "",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            -- "antoinemadec/FixCursorHold.nvim", -- NO LONGER NEEDED
            "nvim-neotest/neotest-python",
            "nvim-neotest/neotest-plenary",
            "nvim-neotest/neotest-go",
            "rouge8/neotest-rust",
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-plenary"),
                    require("neotest-go"),
                    require("neotest-rust"),
                    require("neotest-python")({
                        dap = { justMyCode = false },
                    }),
                    -- require("neotest-vim-test")({
                    --   ignore_file_types = { "python", "vim", "lua" },
                    -- }),
                    require("neotest-rust")
                },
            })
        end,
    },

    {
        "andythigpen/nvim-coverage",
        cmd = { "Coverage", "CoverageClear", "CoverageHide", "CoverageLoad", "CoverageShow", "CoverageSummary",
            "CoverageToggle" },
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("coverage").setup()
        end,
    },

    {
        "sQVe/sort.nvim",
        cmd = "Sort",
        -- Optional setup for overriding defaults.
        config = function()
            require("sort").setup({})
        end,
    },

    {
        "amrbashir/nvim-docs-view",
        cmd = { "DocsViewToggle" },
        config = function()
            require("docs-view").setup({
                position = "right",
                width = 60,
            })
        end,
    },

    { 'ibhagwan/fzf-lua', cmd = "FzfLua", config = function()
        require('fzf-lua').setup({})
    end
    },

    -- { "mizlan/iswap.nvim",
    --     cmd = { "ISwap", "ISwapNode", "ISwapNodeWith", "ISwapNodeWithLeft", "ISwapNodeWithRight", "ISwapWith" },
    --     config = function() require("iswap").setup() end }

    -- { 'anuvyklack/pretty-fold.nvim',
    --     lazy = false,
    --     config = function()
    --         require('pretty-fold').setup()
    --     end
    -- }

    { "michaelb/sniprun", cmd = { "SnipRun", "SnipClose", "SnipInfo", "SnipReplMemoryClean", "SnipReset" },
        build = "bash install.sh" },

    -- { 'hkupty/iron.nvim', cmd = { "IronRepl", "IronRestart", "IronFocus", "IronHide" },
    --     config = function() require("iron.core").setup() end }
    { 'davidgranstrom/scnvim',
        config = function()
            require('scnvim').setup()
        end },

    { "krady21/compiler-explorer.nvim",
        cmd = { "CEAddLibrary", "CECompile", "CECompileLive", "CEDeleteCache", "CEFormat", "CELoadExample",
            "CEOpenWebsite" } }
}
