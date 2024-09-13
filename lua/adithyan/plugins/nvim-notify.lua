-- lazy.nvim
return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    -- Define custom highlight group
    vim.cmd("highlight NotifyBackground guibg=#1e1e1e") -- Set your desired background color

    -- Setup nvim-notify with custom settings
    require("notify").setup({
      background_colour = "NotifyBackground", -- Custom background color
      on_open = function(win)
        -- Apply background highlight to the notify window
        local buf = vim.api.nvim_win_get_buf(win)
        vim.api.nvim_buf_add_highlight(buf, -1, "NotifyBackground", 0, 0, -1)
      end,
    })

    -- Optionally, map some keys to trigger notifications
    vim.api.nvim_set_keymap(
      "n",
      "<leader>n",
      ':lua require("notify")("Hello, world!")<CR>',
      { noremap = true, silent = true }
    )
  end,
}
