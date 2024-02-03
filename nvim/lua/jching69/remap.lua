vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- paste reg 0
keymap("n", "<leader>0", "\"0p", opts)

-- Better window navigation
keymap("n", "<leader>=", "<C-w>=", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
    -- navigate to next/previous window
keymap("n", "<leader>p", "<C-w>W", opts)
keymap("n", "<leader>n", "<C-w>w", opts)

-- Resize with arrows
keymap("n", "<leader><", ":resize -5<CR>", opts)
keymap("n", "<leader>>", ":resize +5<CR>", opts)
keymap("n", "<leader>-", ":vertical resize -10<CR>", opts)
keymap("n", "<leader>+", ":vertical resize +10<CR>", opts)

-- Move visual block up and down
keymap("v", "<A-j>", "xp`[V`]", opts)
keymap("v", "<A-k>", "xkP`[V`]", opts)

-- Move single line up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)

-- Comment / Uncomment block
keymap("x", "<leader>/", "I// <Esc>", opts)
keymap("x", "<leader>#", "I# <Esc>", opts)

-- Clear Searching word in the register
keymap("n", "<leader>us", ":let @/=''<CR>", opts)
