require("nvim-treesitter.configs").setup {
  ensure_installed = { "python", "cpp", "lua", "vim", "rust", "toml"},
  auto_install = true,
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { 'help' }, -- list of language that will be disabled
  },
  ident = { enable = true }, 
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}
