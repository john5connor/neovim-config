vim.o.number = true           -- Show absolute line numbers
vim.o.relativenumber = true   -- Show relative line numbers

-- Tabs and Indentation
vim.o.tabstop = 2             -- Number of spaces a tab counts for
vim.o.shiftwidth = 2          -- Indentation level
vim.o.expandtab = true        -- Convert tabs to spaces
vim.o.smartindent = true      -- Smart indentation

-- Search Settings
vim.o.ignorecase = true       -- Case-insensitive search
vim.o.smartcase = true        -- Case-sensitive if search query contains uppercase

-- Enable mouse support
vim.o.mouse = "a"

-- Enable system clipboard
vim.o.clipboard = "unnamedplus"

-- Enable true color support
vim.o.termguicolors = true

-- Disable line wrap
vim.o.wrap = false

-- Map leader to space
vim.g.mapleader = " "

-- Map Explore 
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Save and quit shortcuts
vim.keymap.set("n", "<leader>w", ":w<CR>") -- Save file
vim.keymap.set("n", "<leader>q", ":q<CR>") -- Quit Neovim

-- Split navigation
vim.keymap.set("n", "<C-h>", "<C-w>h") -- Move to the left split
vim.keymap.set("n", "<C-l>", "<C-w>l") -- Move to the right split
vim.keymap.set("n", "<C-j>", "<C-w>j") -- Move to the below split
vim.keymap.set("n", "<C-k>", "<C-w>k") -- Move to the above split
