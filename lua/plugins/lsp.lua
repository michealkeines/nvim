return {
  {
    "williamboman/mason-lspconfig.nvim",
    event = "BufReadPre",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = { "basedpyright", "ruff", "clangd" },
      automatic_enable = {
        exclude = { "rust_analyzer" }, -- managed by rustaceanvim
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- vim.lsp.config() sets custom options; mason-lspconfig calls vim.lsp.enable() via automatic_enable
      vim.lsp.config("basedpyright", {
        settings = {
          basedpyright = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "openFilesOnly",
              useLibraryCodeForTypes = true,
              typeCheckingMode = "standard",
            },
          },
        },
      })

      vim.lsp.config("ruff", {
        init_options = {
          settings = { logLevel = "error" },
        },
        on_attach = function(client, _)
          client.server_capabilities.hoverProvider = false
        end,
      })

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
    end,
  },
}
