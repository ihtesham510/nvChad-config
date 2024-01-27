---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- save File
    ["<leader>w"] = { "<cmd> w <CR>", "Save file" },
    -- Quit
    ["<leader>q"] = { "<cmd> qa <CR>", "Quit" },
    -- cheatsheet
    ["ch"] = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet" },
    --  format with conform
    ["<leader>lf"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },

    ["<A-j>"] = { ":m .-2<CR>==", "Move Text Up" },
    ["<A-k>"] = { ":m .+1<CR>==", "Move Text Down" },
  },
  v = {
    ["q"] = { "<ESC>", "Exit Visual Mode" },
    ["<Tab>"] = { ">gv", "indent" },
    ["<S-Tab>"] = { "<gv", "indent" },
    ["<A-k>"] = { "<-2<CR>gv=gv", "Move Text Down" },
    ["<A-j>"] = { ">+1<CR>gv=gv", "Move Text Down" },
  },
  i = {
    ["kj"] = { "<ESC>", "Exit Insert Mode" },
    ["jk"] = { "<ESC>", "Exit Insert Mode" },
  },
}

-- more keybinds!

M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["L"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["H"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },

    -- close buffer + hide terminal buffer
    ["<leader>c"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
    ["<leader>C"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  },
}

M.lspconfig = {
  plugin = true,

  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

  n = {
    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },

    ["<leader>ltd"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "LSP definition type",
    },

    ["R"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },

    ["<leader>la"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },

    ["<leader>lr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "LSP references",
    },

    ["<leader>ldf"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },

    ["["] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev",
    },

    ["]"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next",
    },

    ["<leader>ldq"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Diagnostic setloclist",
    },

    ["wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },

    ["wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },

    ["wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },
  },

  v = {
    ["<leader>la"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },
  },
}


M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    -- focus
    ["t"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  },
}



-- terminal
M.nvterm = {
  t = {
    ["<A-f>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },
  },
  n = {

    ["<A-f>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },
  },
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["gcc"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["gcc"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

-- gitsigns
M.gitsigns = {
  plugin = true,

  n = {
    -- Navigation through hunks
    ["gj"] = {
      function()
        if vim.wo.diff then
          return "gj"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = { expr = true },
    },

    ["gk"] = {
      function()
        if vim.wo.diff then
          return "gk"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to prev hunk",
      opts = { expr = true },
    },

    -- Actions
    ["gr"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk",
    },

    ["gR"] = {
      function()
        require("gitsigns").reset_buffer()
      end,
      "Reset Buffer",
    },

    ["gs"] = {
      function()
        require("gitsigns").stage_hunk()
      end,
      "Stage Hunk",
    },

    ["gp"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Preview hunk",
    },

    ["gb"] = {
      function()
        package.loaded.gitsigns.blame_line()
      end,
      "Blame line",
    },

    ["gu"] = {
      function()
        require("gitsigns").undo_stage_hunk()
      end,
      "Blame line",
    },

    ["gt"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "Toggle deleted",
    },
  },
}
-- Telescope
M.telescope = {
  plugin = true,

  n = {
    -- find
    ["ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["F"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["sh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["sr"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["ss"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
    ["sp"] = { "<cmd> Telescope projects <CR>", "Find in current buffer" },

    -- git
    ["gc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["gS"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    -- pick a hidden term
    ["<leader>th"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

    -- theme switcher
    ["st"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },

    ["bm"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
  },
}
return M
