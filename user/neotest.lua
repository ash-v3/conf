require("neotest").setup({
  adapters = {
    require("neotest-python")({}),
    require("neotest-plenary"),
    require("neotest-go"),
    require("neotest-rust"),
  },
})
