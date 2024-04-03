return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "gitui" })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ruby_ls" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
    --  lspconfig.lua_ls.setup({})
    --  lspconfig.ruby_ls.setup({})

      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
    --  vim.diagnostic.config({virtual_text=false})
    end
  }
}
