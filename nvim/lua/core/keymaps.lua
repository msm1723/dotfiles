local keymap = vim.keymap.set

local opts = { noremap = true, silent = true }

keymap("n", "<Esc>", "<cmd>nohlsearch<cr>", opts)

keymap("n", "<leader>w", "<cmd>write<cr>", { desc = "Save file" })
keymap("n", "<leader>q", "<cmd>quit<cr>", { desc = "Quit window" })

keymap("n", "<leader>h", "<cmd>split<cr>", { desc = "Horizontal split" })
keymap("n", "<leader>v", "<cmd>vsplit<cr>", { desc = "Vertical split" })

keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

keymap("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next buffer" })
keymap("n", "<leader>bN", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
keymap("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })

keymap("v", "<", "<gv", { desc = "Indent left and keep selection" })
keymap("v", ">", ">gv", { desc = "Indent right and keep selection" })

keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
