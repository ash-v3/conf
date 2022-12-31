--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {

        -- Configure AstroNvim updates
        updater = {
                remote = "origin", -- remote to use
                channel = "nightly", -- "stable" or "nightly"
                version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
                branch = "main", -- branch name (NIGHTLY ONLY)
                commit = nil, -- commit hash (NIGHTLY ONLY)
                pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
                skip_prompts = false, -- skip prompts about breaking changes
                show_changelog = true, -- show the changelog after performing an update
                auto_reload = false, -- automatically reload and sync packer after a successful update
                auto_quit = false, -- automatically quit the current session after a successful update
                -- remotes = { -- easily add new remotes to track
                --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
                --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
                --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
                -- },
        },

        -- Set colorscheme to use
        colorscheme = "tokyonight-moon",

        -- Add highlight groups in any theme
        highlights = {
                -- init = { -- this table overrides highlights in all themes
                --   Normal = { bg = "#000000" },
                -- }
                -- duskfox = { -- a table of overrides/changes to the duskfox theme
                --   Normal = { bg = "#000000" },
                -- },
        },

        -- set vim options here (vim.<first_key>.<second_key> = value)
        options = {
                opt = {
                        -- set to true or false etc.
                        relativenumber = true, -- sets vim.opt.relativenumber
                        number = true, -- sets vim.opt.number
                        spell = true, -- sets vim.opt.spell
                        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
                        wrap = true, -- sets vim.opt.wrap
                        lazyredraw = false,
                },
                g = {
                        mapleader = " ", -- sets vim.g.mapleader
                        autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
                        cmp_enabled = true, -- enable completion at start
                        autopairs_enabled = true, -- enable autopairs at start
                        diagnostics_enabled = true, -- enable diagnostics at start
                        status_diagnostics_enabled = true, -- enable diagnostics in statusline
                        icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
                        ui_notifications_enabled = true, -- disable notifications when toggling UI elements
                        heirline_bufferline = false, -- enable new heirline based bufferline (requires :PackerSync after changing)
                },
        },
        -- If you need more control, you can use the function()...end notation
        -- options = function(local_vim)
        --   local_vim.opt.relativenumber = true
        --   local_vim.g.mapleader = " "
        --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
        --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
        --
        --   return local_vim
        -- end,

        -- Set dashboard header
        header = {
                "     ..                 .x+=:.                     ..                                                    ",
                "  :**888H: `: .xH''    z`    ^%    .uef^'    x .d88'    .x~~'*Weu.     ..                                ",
                " X   `8888k XX888         .   <k :d88E        5888R    d8Nu.  9888c   @L                  ...     ..     ",
                "'8hx  48888 ?8888       .@8Ned8' `888E        '888R    88888  98888  9888i   .dL       :~''888h.:^'888:  ",
                "'8888 '8888 `8888     .@^%8888'   888E .z8k    888R    '***'  9888%  `Y888k:*888.     8X   `8888X  8888> ",
                " %888>'8888  8888    x88:  `)8b.  888E~?888L   888R         ..@8*'     888E  888I    X888n. 8888X  ?888> ",
                "   '8 '888'  8888    8888N=*8888  888E  888E   888R      ````'8Weu     888E  888I    '88888 8888X   ?**h.",
                "  .-` X*'    8888     %8'    R88  888E  888E   888R     ..    ?8888L   888E  888I      `*88 8888~ x88x.  ",
                "    .xhx.    8888      @8Wou 9%   888E  888E   888R   :@88N   '8888N   888E  888I     ..<'  88*`  88888X ",
                "  .H88888h.~`8888.>  .888888P`    888E  888E  .888B . *8888~  '8888F  x888N><888'        ..XC.    `*8888k",
                " .~  `%88!` '888*~   `   ^'F     m888N= 888>  ^*888%  '*8'`   9888%    '88'  888       :888888H.    `%88>",
                "       `'     ''                  `Y'   888     '%      `~===*%'`            88F      <  `'888888:    X' ",
                "                                       J88'                                 98'             %888888x.-`  ",
                "                                       @%                                 ./'                 ''**''     ",
                "                                     :'                                  ~`                              ",
        },

        -- Default theme configuration
        default_theme = {
                -- Modify the color palette for the default theme
                colors = {
                        fg = "#abb2bf",
                        bg = "#1e222a",
                },
                highlights = function(hl) -- or a function that returns a new table of colors to set
                        local C = require "default_theme.colors"

                        hl.Normal = { fg = C.fg, bg = C.bg }

                        -- New approach instead of diagnostic_style
                        hl.DiagnosticError.italic = true
                        hl.DiagnosticHint.italic = true
                        hl.DiagnosticInfo.italic = true
                        hl.DiagnosticWarn.italic = true

                        return hl
                end,
                -- enable or disable highlighting for extra plugins
                plugins = {
                        aerial = true,
                        beacon = false,
                        bufferline = true,
                        cmp = true,
                        dashboard = true,
                        highlighturl = true,
                        hop = true,
                        indent_blankline = true,
                        lightspeed = true,
                        ["neo-tree"] = true,
                        notify = true,
                        ["nvim-tree"] = true,
                        ["nvim-web-devicons"] = true,
                        rainbow = true,
                        symbols_outline = true,
                        telescope = true,
                        treesitter = true,
                        vimwiki = false,
                        ["which-key"] = true,
                },
        },

        -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
        diagnostics = {
                virtual_text = true,
                underline = true,
        },

        -- Extend LSP configuration
        lsp = {
                -- enable servers that you already have installed without mason
                servers = {
                        -- "pyright"
                },
                formatting = {
                        -- control auto formatting on save
                        format_on_save = {
                                enabled = true, -- enable or disable format on save globally
                                allow_filetypes = { -- enable format on save for specified filetypes only
                                        -- "go",
                                },
                                ignore_filetypes = { -- disable format on save for specified filetypes
                                        -- "python",
                                },
                        },
                        disabled = { -- disable formatting capabilities for the listed language servers
                                -- "sumneko_lua",
                        },
                        timeout_ms = 1000, -- default format timeout
                        -- filter = function(client) -- fully override the default formatting function
                        --   return true
                        -- end
                },
                -- easily add or disable built in mappings added during LSP attaching
                mappings = {
                        n = {
                                -- ["<leader>lf"] = false -- disable formatting keymap
                        },
                },
                -- add to the global LSP on_attach function
                -- on_attach = function(client, bufnr)
                -- end,

                -- override the mason server-registration function
                -- server_registration = function(server, opts)
                --   require("lspconfig")[server].setup(opts)
                -- end,

                -- Add overrides for LSP server settings, the keys are the name of the server
                ["server-settings"] = {
                        -- example for addings schemas to yamlls
                        -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
                        --   settings = {
                        --     yaml = {
                        --       schemas = {
                        --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
                        --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                        --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
                        --       },
                        --     },
                        --   },
                        -- },
                },
        },

        -- Mapping data with "desc" stored directly by vim.keymap.set().
        --
        -- Please use this mappings table to set keyboard mapping since this is the
        -- lower level configuration and more robust one. (which-key will
        -- automatically pick-up stored data by this setting.)
        mappings = {
                -- first key is the mode
                n = {
                        -- second key is the lefthand side of the map
                        -- mappings seen under group name "Buffer"
                        ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
                        ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
                        ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
                        ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
                        -- quick save
                        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
                },
                t = {
                        -- setting a mapping to false will disable it
                        -- ["<esc>"] = false,
                },
        },

        -- Configure plugins
        plugins = {
                init = {
                        -- You can disable default plugins as follows:
                        -- ["goolord/alpha-nvim"] = { disable = true },

                        -- You can also add new plugins here as well:
                        -- Add plugins, the packer syntax without the "use"
                        -- { "andweeb/presence.nvim" },
                        -- {
                        --   "ray-x/lsp_signature.nvim",
                        --   event = "BufRead",
                        --   config = function()
                        --     require("lsp_signature").setup()
                        --   end,
                        -- },

                        -- We also support a key value style plugin definition similar to NvChad:
                        -- ["ray-x/lsp_signature.nvim"] = {
                        --   event = "BufRead",
                        --   config = function()
                        --     require("lsp_signature").setup()
                        --   end,
                        -- },
                        { "tpope/vim-endwise" },
                        { "rstacruz/vim-closer" },
                        {
                                "phaazon/hop.nvim",
                                branch = "v2", -- optional but strongly recommended
                                event = "VimEnter",
                                config = function()
                                        -- you can configure Hop the way you like here; see :h hop-config
                                        require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
                                end,
                        },
                        {
                                "kevinhwang91/nvim-hlslens",
                                keys = { { "n", "*" }, { "n", "#" }, { "n", "n" }, { "n", "N" } },
                                config = function() require("hlslens").setup() end,
                        },
                        { "mg979/vim-visual-multi" },
                        { "gbprod/yanky.nvim" },
                        { "tpope/vim-fugitive", event = "User InGitRepo", config = [[require('user.fugitive')]] },
                        { "kevinhwang91/nvim-bqf", ft = "qf", config = [[require('user.bqf')]] },
                        { "preservim/vim-markdown", ft = { "markdown" } },
                        { "chrisbra/unicode.vim", event = "VimEnter" },
                        { "lervag/vimtex", ft = { "tex" } },
                        { "skywind3000/asyncrun.vim", opt = true, cmd = { "AsyncRun" } },
                        { "cespare/vim-toml", ft = { "toml" }, branch = "main" },
                        {
                                "sakhnik/nvim-gdb",
                                run = { "bash install.sh" },
                                opt = true,
                                setup = [[vim.cmd('packadd nvim-gdb')]],
                        },
                        { "gelguy/wilder.nvim", opt = true, setup = [[vim.cmd('packadd wilder.nvim')]] },
                        {
                                "folke/trouble.nvim",
                                requires = "kyazdani42/nvim-web-devicons",
                                config = function()
                                        require("trouble").setup {
                                                -- your configuration comes here
                                                -- or leave it empty to use the default settings
                                                -- refer to the configuration section below
                                        }
                                end,
                        },
                        { "m-demare/hlargs.nvim" },
                        { "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" },
                        {
                                "saecki/crates.nvim",
                                config = function() require "user.crates" end,
                        },
                        {
                                "folke/todo-comments.nvim",
                                requires = "nvim-lua/plenary.nvim",
                                config = function()
                                        require("todo-comments").setup {
                                                -- refer to the configuration section below
                                        }
                                end,
                        },
                        {
                                "simrat39/rust-tools.nvim",
                                after = "nvim-lspconfig",
                                config = function() require "user.rust-tools" end,
                        },
                        {
                                "ray-x/go.nvim",
                                config = function() require("go").setup() end,
                        },
                        { "potamides/pantran.nvim" },
                        {
                                "samodostal/image.nvim",
                                requires = {
                                        "nvim-lua/plenary.nvim",
                                },
                                config = function() require("image").setup() end,
                        },
                        {
                                "NFrid/due.nvim",
                                config = function() require("due_nvim").setup {} end,
                        },
                        { "jghauser/mkdir.nvim" },
                        {
                                "nvim-neotest/neotest",
                                requires = {
                                        "nvim-lua/plenary.nvim",
                                        "nvim-treesitter/nvim-treesitter",
                                        "antoinemadec/FixCursorHold.nvim",
                                        "nvim-neotest/neotest-python",
                                        "nvim-neotest/neotest-plenary",
                                        "nvim-neotest/neotest-go",
                                        "rouge8/neotest-rust",
                                },
                                config = function() require "user.neotest" end,
                        },
                        {
                                "andythigpen/nvim-coverage",
                                requires = "nvim-lua/plenary.nvim",
                                config = function() require("coverage").setup() end,
                        },
                        {
                                "sQVe/sort.nvim",

                                -- Optional setup for overriding defaults.
                                config = function()
                                        require("sort").setup {
                                                -- Input configuration here.
                                                -- Refer to the configuration section below for options.
                                        }
                                end,
                        },
                        {
                                "beauwilliams/focus.nvim",
                                config = function() require("focus").setup() end,
                        },
                        { "rust-lang/rust.vim" },
                        {
                                "amrbashir/nvim-docs-view",
                                opt = true,
                                cmd = { "DocsViewToggle" },
                                config = function()
                                        require("docs-view").setup {
                                                position = "right",
                                                width = 60,
                                        }
                                end,
                        },
                        { "mbbill/undotree" },
                        { "morhetz/gruvbox", as = "gruvbox" },
                        {
                                "simrat39/symbols-outline.nvim",
                                config = function() require("symbols-outline").setup() end,
                        },
                        { "kdheepak/lazygit.nvim" },
                        { "sheerun/vim-polyglot" },
                        { "renerocksai/calendar-vim" },
                        {
                                "danymat/neogen",
                                config = function() require("neogen").setup {} end,
                                requires = "nvim-treesitter/nvim-treesitter",
                        },
                        {
                                "ggandor/leap.nvim",
                                config = function() require("leap").add_default_mappings() end,
                        },
                        {
                                "ggandor/flit.nvim",
                                config = function() require("flit").setup() end,
                        },

                        -- Packer
                        {
                                "folke/noice.nvim",
                                config = function() require "user.noice" end,
                                requires = {
                                        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
                                        "MunifTanjim/nui.nvim",
                                        -- OPTIONAL:
                                        --   `nvim-notify` is only needed, if you want to use the notification view.
                                        --   If not available, we use `mini` as the fallback
                                        "rcarriga/nvim-notify",
                                },
                        },
                        { "folke/tokyonight.nvim" },
                        {
                                "folke/persistence.nvim",
                                event = "BufReadPre", -- this will only start session saving when an actual file was opened
                                module = "persistence",
                                config = function() require("persistence").setup() end,
                        },
                },
                -- All other entries override the require("<key>").setup({...}) call for default plugins
                ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
                        -- config variable is the default configuration table for the setup function call
                        -- local null_ls = require "null-ls"

                        -- Check supported formatters and linters
                        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
                        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
                        config.sources = {
                                -- Set a formatter
                                -- null_ls.builtins.formatting.stylua,
                                -- null_ls.builtins.formatting.prettier,
                        }
                        return config -- return final config table
                end,
                treesitter = { -- overrides `require("treesitter").setup(...)`
                        -- ensure_installed = { "lua" },
                },
                -- use mason-lspconfig to configure LSP installations
                ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
                        -- ensure_installed = { "sumneko_lua" },
                },
                -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
                ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
                        -- ensure_installed = { "prettier", "stylua" },
                },
                ["mason-nvim-dap"] = { -- overrides `require("mason-nvim-dap").setup(...)`
                        -- ensure_installed = { "python" },
                },
        },

        -- LuaSnip Options
        luasnip = {
                -- Extend filetypes
                filetype_extend = {
                        -- javascript = { "javascriptreact" },
                },
                -- Configure luasnip loaders (vscode, lua, and/or snipmate)
                vscode = {
                        -- Add paths for including more VS Code style snippets in luasnip
                        paths = {},
                },
        },

        -- CMP Source Priorities
        -- modify here the priorities of default cmp sources
        -- higher value == higher priority
        -- The value can also be set to a boolean for disabling default sources:
        -- false == disabled
        -- true == 1000
        cmp = {
                source_priority = {
                        nvim_lsp = 1000,
                        luasnip = 750,
                        buffer = 500,
                        path = 250,
                },
        },

        -- Customize Heirline options
        heirline = {
                -- -- Customize different separators between sections
                -- separators = {
                --   tab = { "", "" },
                -- },
                -- -- Customize colors for each element each element has a `_fg` and a `_bg`
                -- colors = function(colors)
                --   colors.git_branch_fg = astronvim.get_hlgroup "Conditional"
                --   return colors
                -- end,
                -- -- Customize attributes of highlighting in Heirline components
                -- attributes = {
                --   -- styling choices for each heirline element, check possible attributes with `:h attr-list`
                --   git_branch = { bold = true }, -- bold the git branch statusline component
                -- },
                -- -- Customize if icons should be highlighted
                -- icon_highlights = {
                --   breadcrumbs = false, -- LSP symbols in the breadcrumbs
                --   file_icon = {
                --     winbar = false, -- Filetype icon in the winbar inactive windows
                --     statusline = true, -- Filetype icon in the statusline
                --   },
                -- },
        },

        -- Modify which-key registration (Use this with mappings table in the above.)
        ["which-key"] = {
                -- Add bindings which show up as group name
                register = {
                        -- first key is the mode, n == normal mode
                        n = {
                                -- second key is the prefix, <leader> prefixes
                                ["<leader>"] = {
                                        -- third key is the key to bring up next level and its displayed
                                        -- group name in which-key top level menu
                                        ["b"] = { name = "Buffer" },
                                },
                        },
                },
        },

        -- This function is run last and is a good place to configuring
        -- augroups/autocommands and custom filetypes also this just pure lua so
        -- anything that doesn't fit in the normal config locations above can go here
        polish = function()
                -- Set up custom filetypes
                -- vim.filetype.add {
                --   extension = {
                --     foo = "fooscript",
                --   },
                --   filename = {
                --     ["Foofile"] = "fooscript",
                --   },
                --   pattern = {
                --     ["~/%.config/foo/.*"] = "fooscript",
                --   },
                -- }
        end,
}

return config
