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
keymap.set("i", "<F8>", "<cmd>DapStepInto<CR>")
keymap.set("i", "<F9>", "<cmd>DapStepOver<CR>")
keymap.set("i", "<F10>", "<cmd>DapStepOut<CR>")
keymap.set("", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

local function get_autocomplete_next()
  local cmp = require("blink-cmp")
  if cmp.is_visible() then
    cmp.select_next()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", true)
  end
end

local function get_autocomplete_prev()
  local cmp = require("blink-cmp")
  if cmp.is_visible() then
    cmp.select_prev()
  else
    vim.cmd([[
      normal! <<
      startinsert
    ]])
  end
end

keymap.set("i", "<Tab>", get_autocomplete_next, { silent = true, expr = false })
keymap.set("i", "<S-Tab>", get_autocomplete_prev, { silent = true, expr = false })

keymap.set("n", "\\b", ":Telescope file_browser<CR>", { desc = "Open file browser(Root)" })
keymap.set(
  "n",
  "\\B",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { desc = "Open file browser (cwd)" }
)
