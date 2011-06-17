"custom key mappings
"this is helpful in moving in btwn tabs
:map <S-j> :tabp<CR>
:map <S-k> :tabn<CR>
:set t_Co=256


:set ts=4
:set sw=4
:set autoindent

"Pretty colors!
:colorscheme zenburn

"remap save and remap esc to thing below tilde (`)
:map ;w :w<cr>
:imap ` <esc> 
:map ` <esc> 

"highlight stuff
:set hlsearch
:set incsearch

"Turn off the bg so you can see the desktop
:hi Normal ctermbg=none
:hi Normal ctermbg=none

if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  autocmd BufRead,BufNewFile,FileReadPost *.py source ~/.vim/python
endif

" This beauty remembers where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
