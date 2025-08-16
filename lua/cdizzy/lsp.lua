
-- Better diagnostics look & behavior
vim.diagnostic.config({
  virtual_text = { prefix = '●', spacing = 2, source = 'if_many' }, -- inline messages
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
})

-- Pretty signs in the sign column
local signs = { Error = '', Warn = '', Hint = '', Info = '' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

-- Show diagnostics in a float when you pause the cursor
vim.api.nvim_create_autocmd('CursorHold', {
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
})

-- Autocomplete (cmp) configuration 
vim.o.completeopt = 'menu,menuone,noselect'

local cmp = require('cmp')
cmp.setup({
  snippet = { expand = function(args) vim.snippet.expand(args.body) end },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
  },
})

-- This gives each LSP the cmp capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.lsp.config('*', { capabilities = capabilities })


-- clangd (C/C++)
vim.lsp.config('clangd', {
  cmd = {
    'clangd',
    '-j=2',
    '--background-index',
    '--clang-tidy',
    '--inlay-hints',
    '--fallback-style=llvm',
    '--all-scopes-completion',
    '--completion-style=detailed',
    '--header-insertion=iwyu',
    '--header-insertion-decorators',
    '--pch-storage=memory',
  },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
  root_markers = {
    'CMakeLists.txt',
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac',
    '.git',
    vim.uv.cwd(), -- keep if you really want the current dir treated as a root
  },
  -- (Optional) inlay hints on by default, if your clangd supports them:
  init_options = { },
})

-- Enable the server (or do a list: {'clangd', 'pyright', ...})
vim.lsp.enable('clangd')
