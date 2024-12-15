-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")
keymap.set("i", "jk", "<Esc>")
--Select all

keymap.set("n", "<C-a>", "gg<S-v>G")

-- tabs

keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
keymap.set("n", "<F7>", ":ToggleTerm direction=float<CR>")
keymap.set(
  "n",
  "<F7>",
  ":ToggleTerm dir=%:p:h direction=float<CR>" .. [[<C-\><C-n>]] .. "i",
  { noremap = true, silent = true }
)

keymap.set("t", "<F7>", [[<C-\><C-n>]] .. ":ToggleTerm<CR>", opts)
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")
keymap.set("i", "<Tab>", "<Nop>")
keymap.set("i", "<F8>", "<cmd>DapStepInto<CR>")
keymap.set("i", "<F9>", "<cmd>DapStepOver<CR>")
keymap.set("i", "<F10>", "<cmd>DapStepOut<CR>")
keymap.set("", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)
keymap.set(
  "n",
  "<leader>p",
  ":lua require('telescope').extensions.project.project{}<CR>",
  { desc = "Telescope projects" }
)
-- local cmp = require("blink-cmp")
--
-- cmp.setup({
--   mapping = {
--     ["<Tab>"] = function(fallback)
--       if cmp.is_visible() then
--         cmp.select_next()
--       else
--         fallback()
--       end
--     end,
--   },
-- })
