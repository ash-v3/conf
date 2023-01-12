local M = {
    enabled = true,
    "anuvyklack/windows.nvim",
    event = "WinNew",
    dependencies = {
        { "anuvyklack/middleclass" },
        { "anuvyklack/animation.nvim" },
    },
}

function M.config()
    -- vim.o.winwidth = 6
    -- vim.o.winminwidth = 4
    vim.o.equalalways = false
    require("windows").setup({
        animation = {
            duration = 150,
        },
    })
    vim.keymap.set("n", "<leader>Z", "<Cmd>WindowsMaximize<CR>")
end

return M
