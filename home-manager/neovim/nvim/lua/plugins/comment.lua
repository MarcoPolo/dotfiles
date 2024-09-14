return {
    {
        "numToStr/Comment.nvim",
        opts = {},
        event = { "BufReadPost", "BufNewFile" },
        config = function ()
            do
                local api = require('Comment.api')
                local esc = vim.api.nvim_replace_termcodes(
                '<ESC>', true, false, true
                )
                vim.keymap.set('x', '<D-/>', function()
                    vim.api.nvim_feedkeys(esc, 'nx', false)
                    api.locked('toggle.linewise')(vim.fn.visualmode())
                end)
            end
        end

    }
}
