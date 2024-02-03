local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
  -- local opts = {buffer = bufnr}
  -- local bind = vim.keymap.set
  -- bind('n', 'gd', '<cmd>tab split | lua vim.lsp.buf.definition({ reuse_win = true })<cr>', opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {'tsserver', 'rust_analyzer', 'pylsp'},
  handlers = {
    lsp_zero.default_setup,
    }
})

require'lspconfig'.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'E226', 'E501', 'W291', 'W503', 'W504'},
          -- maxLineLength = 100
        }
      }
    }
  }
}

require'lspconfig'.rust_analyzer.setup{
    settings = {
        ['rust-analyzer'] = {
            -- cargo = {
            --     features = { 
            --         'all',
            --     }
            -- },
            diagnostics = {
                disabled = { 'inactive-code' },
            }
        }
    }
}

local cmp = require('cmp')
local luasnip = require('luasnip')
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    ['<C-f>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, {'i', 's'}),

    ['<C-b>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {'i', 's'}),

    ['<Tab>'] = cmp.mapping(function(fallback)
      local col = vim.fn.col('.') - 1

      if cmp.visible() then
        cmp.select_next_item(select_opts)
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      else
        cmp.complete()
      end
    end, {'i', 's'}),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      else
        fallback()
      end
    end, {'i', 's'}),
  }),
})
