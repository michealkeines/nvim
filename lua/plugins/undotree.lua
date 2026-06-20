return {
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle undotree" },
    },
    config = function()
      vim.g.undotree_WindowLayout = 2      -- tree on left, diff below
      vim.g.undotree_ShortIndicators = 1   -- compact timestamps
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },
}
