return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Function to apply nvim-tree transparency
    local function apply_nvim_tree_transparency()
      -- Clear all nvim-tree backgrounds
      local transparent_groups = {
        "NvimTreeNormal",
        "NvimTreeNormalNC",
        "NvimTreeEndOfBuffer",
        "NvimTreeWinSeparator",
        "NvimTreeVertSplit",
        "NvimTreeCursorLine",
        "NvimTreeCursorColumn",
        "NvimTreeSignColumn",
        "NvimTreeRootFolder",
        "NvimTreeFolderName",
        "NvimTreeFolderIcon",
        "NvimTreeFileIcon",
        "NvimTreeFileName",
        "NvimTreeIndentMarker",
        "NvimTreeOpenedFolderName",
        "NvimTreeEmptyFolderName",
        "NvimTreeStatusLine",
        "NvimTreeStatusLineNC",
      }

      for _, group in ipairs(transparent_groups) do
        vim.api.nvim_set_hl(0, group, { bg = "none" })
      end

      -- Set window separator to be invisible
      vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { bg = "none", fg = "none" })
      vim.api.nvim_set_hl(0, "NvimTreeVertSplit", { bg = "none", fg = "none" })
    end

    nvimtree.setup({
      view = {
        width = 50,
        relativenumber = true,
      },
      -- change folder arrow icons (keeping your existing arrows)
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })

    -- Apply transparency immediately after setup
    apply_nvim_tree_transparency()

    -- Global function for manual refresh
    _G.refresh_nvim_tree_transparency = apply_nvim_tree_transparency

    -- Auto-refresh transparency when colorscheme changes
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        vim.defer_fn(function()
          apply_nvim_tree_transparency()
        end, 100)
      end,
    })

    -- Also apply transparency when nvim-tree opens
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "NvimTree",
      callback = function()
        vim.defer_fn(function()
          apply_nvim_tree_transparency()
        end, 50)
      end,
    })

    -- set keymaps (keeping your existing keymaps)
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
  end,
}
