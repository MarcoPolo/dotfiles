return {
  'https://github.com/fresh2dev/zellij.vim.git',
  lazy = false,
  config = function()
    vim.g.zellij_navigator_no_default_mappings = 1

    -- Keybindings for Zellij navigation
    vim.keymap.set('n', '<C-h>', ':ZellijNavigateLeft<CR>', { noremap = true })
    vim.keymap.set('n', '<C-j>', ':ZellijNavigateDown<CR>', { noremap = true })
    vim.keymap.set('n', '<C-k>', ':ZellijNavigateUp<CR>', { noremap = true })
    vim.keymap.set('n', '<C-l>', ':ZellijNavigateRight<CR>', { noremap = true })
  end
}
