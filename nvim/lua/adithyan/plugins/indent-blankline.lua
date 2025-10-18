return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    -- Define required highlight groups before setup
    local function setup_indent_highlights()
      -- Define the highlight groups that indent-blankline needs
      vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3b4261", bg = "none" })
      vim.api.nvim_set_hl(0, "IblWhitespace", { fg = "#3b4261", bg = "none" })
      vim.api.nvim_set_hl(0, "IblScope", { fg = "#7aa2f7", bg = "none" })

      -- Theme-specific colors
      if vim.g.colors_name == "tokyonight" then
        vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3b4261", bg = "none" })
        vim.api.nvim_set_hl(0, "IblScope", { fg = "#7aa2f7", bg = "none" })
      elseif vim.g.colors_name == "catppuccin-mocha" then
        vim.api.nvim_set_hl(0, "IblIndent", { fg = "#45475a", bg = "none" })
        vim.api.nvim_set_hl(0, "IblScope", { fg = "#89b4fa", bg = "none" })
      elseif vim.g.colors_name == "solarized-osaka" then
        vim.api.nvim_set_hl(0, "IblIndent", { fg = "#073642", bg = "none" })
        vim.api.nvim_set_hl(0, "IblScope", { fg = "#268bd2", bg = "none" })
      end
    end

    -- Setup highlights before plugin initialization
    setup_indent_highlights()

    require("ibl").setup({
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = {
        enabled = true,
        char = "│",
        show_start = false,
        show_end = false,
        injected_languages = false,
        highlight = { "IblScope" },
        priority = 500,
      },
      whitespace = {
        highlight = { "IblWhitespace" },
        remove_blankline_trail = true,
      },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    })

    -- Global function to refresh indent highlights
    _G.refresh_indent_highlights = setup_indent_highlights

    -- Auto-refresh highlights when colorscheme changes
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        vim.defer_fn(function()
          setup_indent_highlights()
        end, 100)
      end,
    })
  end,
}
