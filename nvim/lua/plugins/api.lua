-- plugins that provide apis for other plugins
return {
  {
    "nvim-tree/nvim-web-devicons",
    config = { default = true },
  },
  "nvim-lua/plenary.nvim",
  "MunifTanjim/nui.nvim",
  { "skywind3000/asyncrun.vim", cmd = { "AsyncRun" } },
}
