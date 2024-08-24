local dap_rb, dap, dapui = require "dap-ruby", require "dap", require "dapui"

-- Setup cmp dap
local ok_cmp, cmp = pcall(require, "cmp")
if ok_cmp then
    cmp.setup.filetype({ "dap-repl", "dapui_watches" }, {
        sources = cmp.config.sources({
            { name = "dap" },
        }, {
            { name = "buffer" },
        }),
    })
end

-- Set Icons
vim.api.nvim_call_function(
"sign_define",
{ "DapBreakpoint", { linehl = "", text = "", texthl = "diffRemoved", numhl = "" } }
)

vim.api.nvim_call_function(
"sign_define",
{ "DapBreakpointCondition", { linehl = "", text = "", texthl = "diffRemoved", numhl = "" } }
)

vim.api.nvim_call_function(
"sign_define",
{ "DapLogPoint", { linehl = "", text = "", texthl = "diffRemoved", numhl = "" } }
)

vim.api.nvim_call_function(
"sign_define",
{ "DapStopped", { linehl = "GitSignsChangeVirtLn", text = "", texthl = "diffChanged", numhl = "" } }
)

vim.api.nvim_call_function(
"sign_define",
{ "DapBreakpointRejected", { linehl = "", text = "", texthl = "", numhl = "" } }
)

-- Setup DAPUI
dapui.setup({
    icons = { collapsed = "", current_frame = "", expanded = "" },
    layouts = {
        {
            elements = { "scopes", "watches", "stacks", "breakpoints" },
            size = 80,
            position = "left",
        },
        { elements = { "console", "repl" }, size = 0.25, position = "bottom" },
    },
    render = { indent = 2 },
})

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- Setup Virtual Text
require("nvim-dap-virtual-text").setup {}

--config for ruby
dap_rb.setup()

--config for elixir
dap.adapters.mix_task = {
  type = 'executable',
  command = '/path/to/elixir-ls/debugger.sh',
  args = {}
}

dap.configurations.elixir = {
  {
    type = "mix_task",
    name = "mix test",
    task = 'test',
    taskArgs = {"--trace"},
    request = "launch",
    startApps = true, -- for Phoenix projects
    projectDir = "${workspaceFolder}",
    requireFiles = {
      "test/**/test_helper.exs",
      "test/**/*_test.exs"
    }
  },
}
