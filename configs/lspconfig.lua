local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"
local tsserver = require "custom.configs.lang.tsserver"
-- if you just want default config for the servers then put them in a table
local servers = { "html", "svelte", "taplo", "prismals", "cssls", "clangd", "tailwindcss", "emmet_ls" }

-- tsserver
lspconfig["tsserver"].setup {
  on_attach = tsserver.on_attach,
  capabilities = capabilities,
}

-- jsonls settings
lspconfig["jsonls"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
  diagnostics = true,
  setup = {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
        end,
      },
    },
  },
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
--
-- lspconfig.pyright.setup { blabla}
