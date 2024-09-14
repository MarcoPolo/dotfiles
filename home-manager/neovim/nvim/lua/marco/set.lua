
-- Show line numbers
vim.o.number = true

-- Map Command+s to save the file
vim.api.nvim_set_keymap('n', '<D-s>', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<D-s>', '<Cmd>w<CR>', { noremap = true, silent = true })


-- Map in normal, visual, insert, and terminal modes
vim.api.nvim_set_keymap('n', '<D-j>', '<Cmd>ToggleTerm<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<D-j>', '<Cmd>ToggleTerm<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<D-j>', '<Cmd>ToggleTerm<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<D-j>', '<Cmd>ToggleTerm<CR>', { noremap = true, silent = true })

-- Map in normal and visual mode to comment line or selection
vim.api.nvim_set_keymap('n', '<D-/>', '<Cmd>lua require("Comment.api").toggle.linewise.current()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', '<D-/>', '<Cmd>lua require("Comment.api").toggle.blockwise(vim.fn.visualmode())<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', '<D-/>', '<Cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', { noremap = true, silent = true })
-- Toggle selection (blockwise)
-- vim.keymap.set('x', '<D-/>', function()
--     vim.api.nvim_feedkeys(esc, 'nx', false)
--     api.toggle.blockwise(vim.fn.visualmode())
-- end)


-- WIP 

local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
local result = handle:read("*a")
handle:close()

if result:find("Dark") then
    vim.o.background = "dark"
else
    vim.o.background = "light"
end

vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.shiftwidth = 4        -- Number of spaces per indentation
vim.opt.softtabstop = 4       -- Number of spaces when pressing <Tab>
vim.opt.tabstop = 4           -- Number of spaces a <Tab> counts for
