-- Gets the root dir from either:
-- * connected lsp
-- * .git from file
-- * .git from cwd
-- * cwd
---@param opts? table
local function project_files(opts)
    opts = opts or {}
    opts.cwd = require("util").get_root()
    require("telescope.builtin").find_files(opts)
end

return {
    { "nvim-telescope/telescope.nvim",
        cmd = { "Telescope" },

        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { 'nvim-lua/popup.nvim' },
            { "nvim-telescope/telescope-symbols.nvim", after = "telescope.nvim" },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                run = "make"
            },
            { "nvim-telescope/telescope-file-browser.nvim" },
            { "nvim-telescope/telescope-project.nvim" },
            { "nvim-telescope/telescope-ui-select.nvim" },
            { "cljoly/telescope-repo.nvim" },
            { "debugloop/telescope-undo.nvim" },
            { "nvim-telescope/telescope-media-files.nvim" },
            {
                "nvim-telescope/telescope-frecency.nvim",
                dependencies = { "kkharji/sqlite.lua" }
            },
            { "nvim-telescope/telescope-dap.nvim" },
            { "nvim-telescope/telescope-github.nvim" },
        },
        -- keys = {
        --   { "<leader><space>", project_files, desc = "Find File" },
        --   {
        --     "<leader>fl",
        --     function()
        --       require("telescope.builtin").find_files({
        --         cwd = require("lazy.core.config").options.root,
        --       })
        --     end,
        --     desc = "Find Plugin File",
        --   },
        -- },
        config = function()
            -- local actions = require("telescope.actions")

            local telescope = require("telescope")
            local borderless = true
            telescope.setup({
                defaults = {
                    layout_strategy = "horizontal",
                    layout_config = {
                        prompt_position = "top",
                    },
                    sorting_strategy = "ascending",
                    mappings = {
                        i = {
                            -- ["<c-t>"] = function(...)
                            --     return require("trouble.providers.telescope").open_with_trouble(...)
                            -- end,
                            ["<C-i>"] = function(...)
                                project_files({ no_ignore = true })
                            end,
                            ["<C-h>"] = function(...)
                                project_files({ hidden = true })
                            end,
                            ["<C-Down>"] = function(...)
                                return require("telescope.actions").cycle_history_next(...)
                            end,
                            ["<C-Up>"] = function(...)
                                return require("telescope.actions").cycle_history_prev(...)
                            end,
                            ["<C-j>"] = require("telescope.actions").move_selection_next,
                            ["<C-k>"] = require("telescope.actions").move_selection_previous,
                            ["<C-q>"] = require("telescope.actions").smart_send_to_qflist +
                                require("telescope.actions").open_qflist,
                            -- ["<esc>"] = require("telescope.actions").close,
                            -- ["<CR>"] = require("telescope.actions").select_default + require("telescope.actions").center
                        },
                        n = {
                            ["q"] = require("telescope.actions").close,
                            ["<C-j>"] = require("telescope.actions").move_selection_next,
                            ["<C-k>"] = require("telescope.actions").move_selection_previous,
                            ["<C-q>"] = require("telescope.actions").smart_send_to_qflist +
                                require("telescope.actions").open_qflist,
                        }
                    },
                    prompt_prefix = " ",
                    selection_caret = " ",
                    winblend = borderless and 0 or 10,
                },
                extensions = {
                    fzf = {
                        fuzzy = true, -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    },
                    file_browser = {
                        theme = "ivy",
                        -- disables netrw and use telescope-file-browser in its place
                        hijack_netrw = true,
                        mappings = {
                            ["i"] = {
                                -- your custom insert mode mappings
                            },
                            ["n"] = {
                                -- your custom normal mode mappings
                            },
                        },
                    },
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                            -- even more opts
                        }
                    }
                },
            })
            telescope.load_extension("fzf")
            telescope.load_extension("file_browser")
            telescope.load_extension("ui-select")
            telescope.load_extension("repo")
            telescope.load_extension("undo")
            telescope.load_extension("media_files")
            telescope.load_extension("frecency")
            telescope.load_extension("project")
            telescope.load_extension("dap")
            telescope.load_extension("gh")
        end, },
}
