return {
  "xiyaowong/transparent.nvim",
  lazy = false,
  priority = 999,
  config = function()
    require("transparent").setup({
      groups = {
        "Normal",
        "NormalNC",
        "Comment",
        "Constant",
        "Special",
        "Identifier",
        "Statement",
        "PreProc",
        "Type",
        "Underlined",
        "Todo",
        "String",
        "Function",
        "Conditional",
        "Repeat",
        "Operator",
        "Structure",
        "LineNr",
        "NonText",
        "SignColumn",
        "CursorLine",
        "CursorLineNr",
        "StatusLine",
        "StatusLineNC",
        "EndOfBuffer",
      },
      extra_groups = {
        -- General
        "NormalFloat",
        "FloatBorder",

        -- NvimTree specific groups
        "NvimTreeNormal",
        "NvimTreeNormalNC",
        "NvimTreeEndOfBuffer",
        "NvimTreeWinSeparator",
        "NvimTreeVertSplit",
        "NvimTreeCursorLine",
        "NvimTreeCursorColumn",
        "NvimTreeSignColumn",
        "NvimTreeStatusLine",
        "NvimTreeStatusLineNC",

        -- Telescope
        "TelescopeNormal",
        "TelescopeBorder",
        "TelescopePromptNormal",
        "TelescopeResultsNormal",
        "TelescopePreviewNormal",

        -- Which Key
        "WhichKeyFloat",

        -- Mason
        "MasonNormal",
      },
      exclude_groups = {},
    })

    -- Manual transparency toggle
    vim.keymap.set("n", "<leader>tt", "<cmd>TransparentToggle<cr>", { desc = "Toggle transparency" })

    -- Force nvim-tree transparency
    vim.keymap.set("n", "<leader>tn", function()
      if _G.refresh_nvim_tree_transparency then
        _G.refresh_nvim_tree_transparency()
      end
      vim.notify("NvimTree transparency refreshed", vim.log.levels.INFO)
    end, { desc = "Refresh NvimTree transparency" })
  end,
}
