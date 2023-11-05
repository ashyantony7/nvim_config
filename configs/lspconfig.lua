local base = require("plugins.configs.lspconfig")

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    base.on_attach(client, bufnr)
  end,
}

lspconfig.gopls.setup {
  on_attach = base.on_attach,
  capabilities = base.capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
}

lspconfig.pyright.setup {
  on_attach = base.on_attach,
  capabilities = base.capabilities,
  filetypes = {"python"},
}

