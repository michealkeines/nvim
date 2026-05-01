return {
    {
      "neovim/nvim-lspconfig",  -- still needed, ships the lsp/clangd.lua config
      lazy = true,
    },
    {
      "p00f/clangd_extensions.nvim",
      ft = { "c", "cpp" },
      opts = {
        inlay_hints = { inline = false },
      },
    },
    {
      "williamboman/mason.nvim",
      opts = {
        ensure_installed = { "clangd", "clang-format", "codelldb" },
      },
    },
    {
      "stevearc/conform.nvim",
      opts = {
        formatters_by_ft = {
          c = { "clang-format" },
          cpp = { "clang-format" },
        },
      },
    },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = { ensure_installed = { "c", "cpp" } },
    },
    -- native LSP config (replaces require('lspconfig').clangd.setup{})
    {
      "neovim/nvim-lspconfig",
      config = function()
        vim.lsp.config("clangd", {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
          init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
          },
          capabilities = {
            offsetEncoding = { "utf-16" },
          },
          on_attach = function(_, bufnr)
            vim.keymap.set("n", "<leader>ch", "<cmd>LspClangdSwitchSourceHeader<cr>",
              { desc = "Switch Source/Header", buffer = bufnr })
          end,
        })
        vim.lsp.enable("clangd")
      end,
    },
  }