local M = {
  {
    "phaazon/mind.nvim",
    cmd = { "MindClose", "MindOpenMain", "MindOpenProject", "MindOpenSmartProject", "MindReloadState" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("mind").setup()
    end,
  },
}

return M
