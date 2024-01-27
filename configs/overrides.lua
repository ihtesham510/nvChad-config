local M = {}
local function nvimtree_on_attach(bufnr)
  local api = require "nvim-tree.api"
  local keymap = vim.keymap.set

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- copy default mappings here from defaults in next section
  keymap("n", "<C-]>", api.tree.change_root_to_node, opts "CD")
  keymap("n", "<C-e>", api.node.open.replace_tree_buffer, opts "Open: In Place")
  keymap("n", "l", api.node.open.edit, opts "Open file")
  ---
  -- OR use all default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- remove a default
  vim.keymap.del("n", "<C-]>", { buffer = bufnr })

  -- override a default
  keymap("n", "<C-e>", api.tree.reload, opts "Refresh")

  -- add your mappings
  keymap("n", "?", api.tree.toggle_help, opts "Help")
  ---
end

-- treesitter
M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
  auto_install = true,
  -- for autotag
  autotag = { enable = true },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

-- Mason
M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- Rust
    "rust-analyzer",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "eslint_d",
    "json-lsp",
    "prisma-language-server",
    "graphql-language-service-cli",
    "emmet-ls",
    "typescript-language-server",
    "tailwindcss-language-server",
    "deno",
    "svelte-language-server",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",
  },
}

-- nvimtree
M.nvimtree = {
  on_attach = nvimtree_on_attach,
  git = {
    enable = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}
-- NvChad colorizer
M.nvim_colorizer = {
  tailwindcss = true,
}
-- toggleterm
M.nvterm = {
  size = 7,
}

-- Cmp

M.cmp = {
  sources = require("cmp").config.sources {
    { name = "crates" }, -- crates
    { name = "nvim_lsp" },
    { name = "cmp-tw2css" },
    { name = "luasnip" }, -- snippets
    { name = "buffer" }, -- text within current buffer
    { name = "path" }, -- file system paths
  },
}

-- Telescope
local actions = require "telescope.actions"
M.telescope = {
  defaults = {
    prompt_prefix = "      ",
    initial_mode = "normal",
    path_display = { "truncate" },
    file_ignore_patterns = { "node%_modules/.*", "target/*", ".git/*" },
    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-h>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },
      n = {
        ["<esc>"] = actions.close,
        ["q"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["l"] = actions.select_default,
        ["h"] = actions.select_horizontal,
        ["s"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,
        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
      },
    },
  },
  extensions_list = {
    "themes",
    "terms",--[[ "project" ]]
  },
}

return M
