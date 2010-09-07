syntax on
filetype on
filetype plugin on
filetype indent on
colorscheme vividchalk

" Backups
set nobackup
set nowritebackup

" UI
set ruler
set number
set numberwidth=6
set splitbelow
set splitright
set cursorline
set laststatus=2

" Text Wrapping
set nowrap
set textwidth=0

" Invisible Characters
set list
set backspace=indent,eol,start
set listchars=tab:▸\ ,eol:¬

" Foldings
set nofoldenable
set foldmethod=syntax
set foldnestmax=2


" Filetypes
au BufRead,BufNewFile *.feature    set ft=cucumber
au BufRead,BufNewFile *.haml       set ft=haml
au BufRead,BufNewFile *.irb        set ft=ruby
au BufRead,BufNewFile *.liquid     set ft=html
au BufRead,BufNewFile *.markdown   set ft=markdown
au BufRead,BufNewFile *.ru         set ft=ruby
au BufRead,BufNewFile *.sass       set ft=sass
au BufRead,BufNewFile *.scss       set ft=css
au BufRead,BufNewFile *.template   set ft=html
au BufRead,BufNewFile *.text       set ft=textile
au BufRead,BufNewFile /etc/nginx/* set ft=nginx

au FileType ruby        set ts=2 sw=2 sts=2 expandtab
au FileType rdoc        set ts=2 sw=2 sts=2 expandtab
au FileType eruby       set ts=2 sw=2 sts=2 expandtab
au FileType haml        set ts=2 sw=2 sts=2 expandtab
au FileType html        set ts=2 sw=2 sts=2 expandtab
au FileType php         set ts=2 sw=2 sts=2 expandtab
au FileType sass        set ts=2 sw=2 sts=2 expandtab
au FileType html        set ts=2 sw=2 sts=2 expandtab
au FileType css         set ts=2 sw=2 sts=2 expandtab
au FileType markdown    set ts=2 sw=2 sts=2 expandtab
au FileType javascript  set ts=2 sw=2 sts=2 expandtab


" \ is the leader character
let mapleader = "\\"

" Toggle Fullscreen
map <Leader>f :set invfullscreen <CR>

" Toggle Invisibles
nmap <leader>i :set list!<CR>

" Opens an edit command with the path of the currently edited file filled in
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Remove trailing spaces in the current document
nnoremap <silent> <leader>s :call <SID>StripTrailingWhitespaces()<CR>


" Automatically Reload Config Files
if has("autocmd")
  autocmd bufwritepost .vimrc  source $MYVIMRC
  autocmd bufwritepost .gvimrc source $MYGVIMRC
endif


function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
