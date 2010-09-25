set nocompatible

silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()

set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

syntax on
filetype plugin indent on
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
"   set foldmethod=syntax     " <-------- This is the performance culprit
"   set foldnestmax=2

" Completion
set wildmode=list:longest,list:full


" Filetypes
au BufWrite,BufRead,BufNewFile *.feature    set ft=cucumber
au BufWrite,BufRead,BufNewFile *.haml       set ft=haml
au BufWrite,BufRead,BufNewFile *.irb        set ft=ruby
au BufWrite,BufRead,BufNewFile *.json       set ft=javascript
au BufWrite,BufRead,BufNewFile *.liquid     set ft=html
au BufWrite,BufRead,BufNewFile *.markdown   set ft=markdown
au BufWrite,BufRead,BufNewFile *.ru         set ft=ruby
au BufWrite,BufRead,BufNewFile *.sass       set ft=sass
au BufWrite,BufRead,BufNewFile *.scss       set ft=css
au BufWrite,BufRead,BufNewFile *.template   set ft=html
au BufWrite,BufRead,BufNewFile *.text       set ft=textile
au BufWrite,BufRead,BufNewFile /etc/nginx/* set ft=nginx

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
