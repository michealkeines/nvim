return {
    {
      "saghen/blink.cmp",
      version = "1.*",
      event = { "InsertEnter", "CmdlineEnter" },
      opts = {
        keymap = {
          preset = "default",
          ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
          ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
          ["<CR>"] = { "accept", "fallback" },
          ["<C-Space>"] = { "show", "hide" },
          ["<C-e>"] = { "hide" },
        },
        sources = {
          default = { "lsp", "path", "buffer" },
        },
        completion = {
          documentation = { auto_show = true },
        },
        signature = { enabled = true },
      },
    },
  }