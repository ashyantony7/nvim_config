local mason_registry = require("mason-registry")
local codelldb_root = mason_registry.get_package("codelldb"):get_install_path() .. "/extension/"
local codelldb_path = codelldb_root .. "adapter/codelldb"
local liblldb_path = codelldb_root .. "lldb/lib/liblldb.dylib"

local rt = require("rust-tools")

local options = {
  server = {
    on_attach = function(_, bufnr)
      require("plugins.configs.lspconfig").on_attach(_, bufnr)
      vim.keymap.set("n", "<Leader>k", rt.hover_actions.hover_actions, { buffer = bufnr })
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
    capabilities = require("plugins.configs.lspconfig").capabilities,
  },
  dap = {
    adapter = require("rust-tools.dap").get_codelldb_adapter(
      codelldb_path, liblldb_path)
  },
  tools = {
    hover_actions = {
      auto_focus = true,
    }
  }
}

return options
