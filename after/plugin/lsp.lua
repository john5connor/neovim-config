local lspconfig = require('lspconfig')
local cmp = require('cmp')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
  },
})

vim.diagnostic.config({
  virtual_text = true,   -- show message inline
    signs = true,          -- gutter signs
    underline = true,      -- underline problem code
    update_in_insert = false,
    severity_sort = true,
    float = {
      border = "rounded",
      source = "always",
    },
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = "rounded",
      source = "always",
      prefix = "",
    })
  end,
})

lspconfig.pyright.setup({
  capabilities = capabilities,
})

lspconfig.clangd.setup({
  capabilities = capabilities,
  cmd = { '/lib/llvm-18/bin/clangd', '--background-index', '--clang-tidy' },
  init_options = {
    fallbackFlags = { '-std=c++17' },
  },
})


