return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      -- ensure_installed = { "lua_ls", "marksman" },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
      -- Useful status updates for LSP.
      { "j-hui/fidget.nvim", opts = {} },
    },
  },
  vim.lsp.enable("marksman"),
  vim.lsp.enable("lua_ls"),
  vim.lsp.enable("nixd"),
}
