local M = {
    { "saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        config = function()
            require('crates').setup()
        end },
    { "rust-lang/rust.vim", ft = "rust", config = function()
        vim.g.rustfmt_autosave = 1
    end
    },
}

return M
