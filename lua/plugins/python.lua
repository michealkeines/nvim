return {
    {
      "neovim/nvim-lspconfig",
      lazy = true,
    },
    {
      "williamboman/mason.nvim",
      opts = {
        ensure_installed = { "basedpyright", "ruff" },
      },
    },
    {
      "stevearc/conform.nvim",
      opts = {
        formatters_by_ft = {
          python = { "ruff_format" },
        },
      },
    },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = { ensure_installed = { "python" } },
    },
    {
      "neovim/nvim-lspconfig",
      config = function()
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
        vim.lsp.enable("basedpyright")
  
        vim.lsp.config("ruff", {
          init_options = {
            settings = { logLevel = "error" },
          },
          on_attach = function(client, _)
            -- disable hover in favor of basedpyright
            client.server_capabilities.hoverProvider = false
          end,
        })
        vim.lsp.enable("ruff")
      end,
    },
  }