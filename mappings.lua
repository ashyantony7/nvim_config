local M = {}

M.dap = {
  n = {
    ["<leader>db"] =  {
      "<cmd> DapToggleBreakpoint <CR>",
      "Toggle breakpoint"
    },
    ["<Leader>dx"] = {
      "<cmd> DapTerminate <CR>",
      "Terminate Debug"
    },
    ["<Leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Continue Debug"
    },
    ["<Leader>z"] = {"<cmd> lua require'zen-mode'.toggle({window={width=.95}})<cr>"},
    ["<F5>"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step into" },
    ["<F6>"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step over" },
    ["<F7>"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step out" },
    ["<F8>"] = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
  }
}

M.toggleterm = {
  n = {
    ["<F1>"] = {
      "<cmd> ToggleTerm <CR>",
      "Toggle Terminal"
    }
  }
}

return M

