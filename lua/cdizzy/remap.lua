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

-- LSP remaps
local opts = { noremap = true, silent = true }
 
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
