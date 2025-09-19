return {
  "benlubas/molten-nvim",
  dependencies = {{'willothy/wezterm.nvim', config = true}},
  build = ":UpdateRemotePlugins",
  config = function()
    local molten = require("molten-nvim")
    vim.g.molten_image_provider = "image.nvim"
    vim.g.molten_output_win_max_height = 20
    --molten.setup({})
  end
}
