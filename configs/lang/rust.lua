local M = {}
local capabilities = require("plugins.configs.lspconfig").capabilities
M.opts = {
  servers = {
    on_attach = function(client, bufnr)
      local keymap = vim.keymap.set -- for conciseness
      local opts = { noremap = true, silent = true }
      opts.buffer = bufnr
      -- set keybinds
      opts.desc = "Show LSP references"
      keymap("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

      opts.desc = "Go to declaration"
      keymap("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Show LSP definitions"
      keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

      opts.desc = "Show LSP implementations"
      keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

      opts.desc = "Show LSP type definitions"
      keymap("n", "<leader>t", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

      opts.desc = "rust code actions"
      keymap({ "n", "v" }, "<leader>la", "<cmd>RustHoverActions<cr><cmd>RustHoverActions<cr>", opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = "Smart rename"
      keymap("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = "Show buffer diagnostics"
      keymap("n", "<leader>d", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

      opts.desc = "Show line diagnostics"
      keymap("n", "<leader>D", vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = "Go to previous diagnostic"
      keymap("n", "[", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

      opts.desc = "Go to next diagnostic"
      keymap("n", "]", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

      opts.desc = "Show documentation for what is under cursor"
      keymap("n", "K", function()
        require("rust-tools").hover_actions.hover_actions()
      end, opts) -- show documentation for what is under cursor

      opts.desc = "Restart LSP"
      keymap("n", "<leader>lr", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

      opts.desc = "Open cargo.toml"
      keymap("n", "<leader>lco", function()
        require("rust-tools").open_cargo_toml.open_cargo_toml()
      end, opts)

      opts.desc = "LSP info"
      keymap("n", "<leader>li", ":LspInfo<CR>", opts) -- mapping to restart lsp if necessary
    end,
    capabilities = capabilities,
  },
}

return M
