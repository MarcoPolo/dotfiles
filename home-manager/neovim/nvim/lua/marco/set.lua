
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




--
--
-- BerkeleyMono Colorscheme
--
-- local cmd = vim.cmd
--
-- -- Function to apply highlight with nil checks
-- local function highlight(group, fg, bg, attr)
--   local command = "highlight " .. group
--   if fg then
--     command = command .. " guifg=" .. fg
--   end
--   if bg then
--     command = command .. " guibg=" .. bg
--   end
--   if attr then
--     command = command .. " gui=" .. attr
--   end
--   cmd(command)
-- end
--
-- -- Clear and set background
-- cmd("highlight clear")
-- cmd("set background=light")
--
-- -- Basic Colors
-- highlight("Normal", "#3A3A3A", "#FAF8F5")
-- highlight("Comment", "#919191")
-- highlight("Keyword", "#D73A49")
-- highlight("String", "#008080")
-- highlight("Function", "#4078F2")
-- highlight("Type", "#6F42C1")
-- highlight("Constant", "#D73A49")
-- highlight("Number", "#005CC5")
-- highlight("Special", "#E36209")
--
-- -- Background highlights
-- highlight("Visual", nil, "#FFD580")
-- highlight("LineNr", "#FFCB6B")
-- highlight("CursorLine", nil, "#FFFBEC")
-- highlight("CursorLineNr", "#D73A49", "#FFFBEC")
--
-- -- Extra elements
-- highlight("Pmenu", "#3A3A3A", "#FFF1E8")
-- highlight("PmenuSel", "#3A3A3A", "#FFD580")
-- highlight("VertSplit", "#CCCCCC", "#FAF8F5")
--
-- -- Error and Warning
-- highlight("Error", "#FF0000")
-- highlight("Warning", "#FFCB6B")
--
-- -- Syntax on
-- cmd("syntax on")
