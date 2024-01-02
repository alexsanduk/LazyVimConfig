-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Shorten function name
local keymap = vim.keymap.set
local cmd = vim.cmd
-- Silent keymap option
local opts = { silent = true, noremap = true }

-- Expand %% to current path
cmd("cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'")

keymap("n", "Q", "<cmd>bdelete<CR>", opts)

function getVisualSelection()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg("v")
  vim.fn.setreg("v", {})

  text = string.gsub(text, "\n", "")
  if #text > 0 then
    return text
  else
    return ""
  end
end

keymap("v", "<leader>ft", function()
  require("telescope.builtin").live_grep({
    default_text = getVisualSelection(),
  })
end, opts)
