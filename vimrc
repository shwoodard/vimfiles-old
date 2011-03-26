set nocompatible

filetype off " Needs to be off before pathogen runs
silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()

syntax on
filetype plugin indent on " Now that pathogen is loaded we re-enable
colorscheme molokai

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

" Encoding
set encoding=utf-8

" Text
set nowrap
set textwidth=0
set nospell

" Invisible Characters
set nolist
set backspace=indent,eol,start
set listchars=tab:▸\ ,eol:¬

" Foldings
set nofoldenable
"   set foldmethod=syntax     " <-------- This is the performance culprit
"   set foldnestmax=2

" Completion
set wildmode=list:longest,list:full

" Spelling
set spelllang=en_us

" Filetypes
au BufWrite,BufRead,BufNewFile *.feature    set ft=cucumber
au BufWrite,BufRead,BufNewFile *.haml       set ft=haml
au BufWrite,BufRead,BufNewFile *.irb        set ft=ruby
au BufWrite,BufRead,BufNewFile *.json       set ft=javascript
au BufWrite,BufRead,BufNewFile *.liquid     set ft=html
au BufWrite,BufRead,BufNewFile *.markdown   set ft=markdown
au BufWrite,BufRead,BufNewFile *.ru         set ft=ruby
au BufWrite,BufRead,BufNewFile *.sass       set ft=sass
au BufWrite,BufRead,BufNewFile *.scss       set ft=scss
au BufWrite,BufRead,BufNewFile *.template   set ft=html
au BufWrite,BufRead,BufNewFile *.text       set ft=textile
au BufWrite,BufRead,BufNewFile Gemfile      set ft=ruby
au BufWrite,BufRead,BufNewFile /etc/nginx/* set ft=nginx
au BufWrite,BufRead,BufNewFile *.txt        set ft=text
au BufWrite,BufRead,BufNewFile *.snippets   set ft=snippet
au BufWrite,BufRead,BufNewFile *.thor       set ft=ruby

au FileType ruby        set ts=2 sw=2 sts=2 expandtab
au FileType yaml        set ts=2 sw=2 sts=2 expandtab
au FileType rdoc        set ts=2 sw=2 sts=2 expandtab
au FileType eruby       set ts=2 sw=2 sts=2 expandtab
au FileType haml        set ts=2 sw=2 sts=2 expandtab
au FileType html        set ts=2 sw=2 sts=2 expandtab
au FileType php         set ts=2 sw=2 sts=2 expandtab
au FileType sass        set ts=2 sw=2 sts=2 expandtab
au FileType scss        set ts=2 sw=2 sts=2 expandtab
au FileType html        set ts=2 sw=2 sts=2 expandtab
au FileType css         set ts=2 sw=2 sts=2 expandtab
au FileType markdown    set ts=2 sw=2 sts=2 expandtab
au FileType vim         set ts=2 sw=2 sts=2 expandtab
au FileType javascript  set ts=2 sw=2 sts=2 expandtab
au FileType text        set ts=2 sw=2 sts=2 expandtab
au FileType snippet     set ts=8 sw=8 sts=8 noexpandtab
au FileType coffee      set ts=2 sw=2 sts=2 expandtab
au FileType zsh         set ts=2 sw=2 sts=2 noexpandtab

" \ is the leader character
let mapleader = "\\"

" Toggle Fullscreen
nmap <silent> <leader>f :set invfullscreen <CR>

" Toggle Invisibles
nmap <silent> <leader>i :set list!<CR>

" Opens an edit command with the path of the currently edited file filled in
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Toggle NERDTree
nmap <silent> <leader>p :NERDTreeToggle <CR>

" Toggle soft-wrapping
nmap <silent> <leader>w :set wrap! linebreak! nolist<CR>

" Toggle Spell-Checking
nmap <silent> <leader>s :set spell!<CR>

" Create a ruby interpolation when you type #{
" inoremap #{ #{  }<left><left>

" Wrappy Stuff for Visual Mode
vmap ' s'
vmap " s"
vmap ( s(
vmap { s{
vmap [ s[

" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp

" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Save the current file as root
command! W w !sudo tee % >/dev/null

" Open the current file
command! Open silent!!open %

" NERDCommenter Settings
let NERDSpaceDelims = 1

" Unformatting
nmap <silent><leader>u :s/\v(\S+)@<=\s+/ /g<CR>
vmap <silent><leader>u J :s/\v(\S+)@<=\s+/ /g<CR> 

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

set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

let g:user_zen_settings = {
\  'xml' : {
\    'extends' : 'html',
\  },
\  'haml' : {
\    'extends' : 'html',
\    'filters' : 'haml',
\  },
\}
