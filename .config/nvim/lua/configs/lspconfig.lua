-- custom lspconfig, also loads defaults set
-- in lspconfig-defaults.lua

-- load defaults
require("configs.lspconfig-defaults")

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "configs.lspconfig-defaults"
local config = require "configs.lspconfig-defaults"


-- for LSPs with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

local on_attach = config.on_attach
local capabilities = config.capabilities
lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
}

lspconfig.markdown_oxide.setup {
  capabilities = vim.tbl_deep_extend("force", capabilities, {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  }),
  on_attach = on_attach,
}