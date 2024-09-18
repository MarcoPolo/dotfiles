return {
  'Mofiqul/vscode.nvim',
  config = function()
    require('vscode').setup({
        italic_comments = true,
    })
    vim.cmd.colorscheme "vscode"
  end
}
