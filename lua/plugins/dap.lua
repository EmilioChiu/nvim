return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-telescope/telescope-dap.nvim",
		"jbyuki/one-small-step-for-vimkind",
		"williamboman/mason.nvim",
	},
	config = function()
		require("telescope").load_extension("dap")
		local dapui = require("dapui")
		local dap = require("dap")
		dapui.setup()

		vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "continue dap" })
		vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "step into a function with dap" })
		vim.keymap.set("n", "<leader>dn", dap.step_over, { desc = "step over a line with dap" })
		vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "step into a function with dap" })
		vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "restart the dap task" })

		vim.keymap.set("n", "<leader> ", function()
			dapui.eval(nil, { enter = true })
		end, {})

		local elixir_ls = vim.fn.exepath("elixir-ls-debugger")

		dap.adapters.mix_task = {
			type = "executable",
			command = elixir_ls,
		}

		dap.configurations.elixir = {
			{
				type = "mix_task",
				name = "phoenix server",
				task = "phx.server",
				request = "launch",
				projectDir = "${workspaceFolder}",
			},
		}

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
	end,
}
