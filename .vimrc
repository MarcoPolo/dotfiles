filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
"call pathogen#infect()

colorscheme zenburn

"Give gundo <F5> functionality :D
nnoremap <F5> :GundoToggle<CR>

"load syntastic syntax highlighter for js
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=0


"ability to maximize window using C-W o
"

nnoremap <C-W>O :call MaximizeToggle ()<CR>
nnoremap <C-W>o :call MaximizeToggle ()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle ()<CR>

function! MaximizeToggle()
    if exists("s:maximize_session")
        exec "source " . s:maximize_session
        call delete(s:maximize_session)
        unlet s:maximize_session
        let &hidden=s:maximize_hidden_save
        unlet s:maximize_hidden_save
    else
        let s:maximize_hidden_save = &hidden
        let s:maximize_session = tempname()
        set hidden
        exec "mksession! " . s:maximize_session
        only
    endif
endfunction

nnoremap <silent> <F9> :TagbarToggle<CR>


map ;w :w<cr>
map ` <esc>
imap ` <esc>


set smartindent
set ts=4
set shiftwidth=4
set expandtab

set hidden

set t_Co=256


set hlsearch
set incsearch


set number
set ts=4


set foldmethod=indent
set foldlevel=99

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

map <s-j> :tabp<cr>
map <s-k> :tabn<cr>


map <leader>td <Plug>TaskList


map <leader>g :GundoToggle<CR>

let g:pyflakes_use_quickfix = 0

au Filetype python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview



syntax on
"filetype on
"filetype plugin indent on

"To get a clear background

highlight Normal ctermbg=none

