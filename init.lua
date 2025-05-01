-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
if vim.g.neovide then
  vim.g.neovide_transparency = 0.5
  vim.g.neovide_normal_opacity = 0.5
end
