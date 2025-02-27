return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED SETUP
    harpoon:setup()

    -- Keymaps
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Add file to Harpoon" })
    vim.keymap.set("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggle Harpoon menu" })

    -- Quick access to files
    vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = "Go to Harpoon file 1" })
    vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = "Go to Harpoon file 2" })
    vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = "Go to Harpoon file 3" })
    vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = "Go to Harpoon file 4" })

    -- Navigation
    vim.keymap.set("n", "<", function() harpoon:list():prev() end, { desc = "Previous Harpoon buffer" })
    vim.keymap.set("n", ">", function() harpoon:list():next() end, { desc = "Next Harpoon buffer" })

    -- Telescope Integration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
                results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
        }):find()
    end

    vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end, { desc = "Open Harpoon with Telescope" })

    -- Harpoon UI Extensions
    harpoon:extend({
      UI_CREATE = function(cx)
        vim.keymap.set("n", "<C-v>", function()
          harpoon.ui:select_menu_item({ vsplit = true })
        end, { buffer = cx.bufnr, desc = "Open Harpoon file in vertical split" })

        vim.keymap.set("n", "<C-s>", function()
          harpoon.ui:select_menu_item({ split = true })
        end, { buffer = cx.bufnr, desc = "Open Harpoon file in horizontal split" })

        vim.keymap.set("n", "<C-t>", function()
          harpoon.ui:select_menu_item({ tabedit = true })
        end, { buffer = cx.bufnr, desc = "Open Harpoon file in new tab" })
      end,
    })
  end
}
