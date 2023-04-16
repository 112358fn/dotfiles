" Plugins will be downloaded under the specified directory.
call plug#begin(stdpath('data') . '/plugged')

" Declare the list of plugins.
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

:lua require('lualine').setup {options = { theme  = 'dracula' }}

