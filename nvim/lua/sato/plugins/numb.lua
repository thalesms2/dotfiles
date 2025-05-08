return {
  'nacro90/numb.nvim',
  config = function()
    require('numb').setup({
        centered_peeking = true,
        show_cursorline = true,
    })
  end,
}
