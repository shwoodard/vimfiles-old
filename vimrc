set nocompatible

filetype off " Needs to be off before pathogen runs
silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags() 

syntax on
filetype plugin indent on " Now that pathogen is loaded we re-enable
set background=dark
colorscheme base16-eighties

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
" set wildmode=list:longest,list:full
set wildmode=full
set wildmenu

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
au BufWrite,BufRead,BufNewFile Capfile      set ft=ruby
au BufWrite,BufRead,BufNewFile /etc/nginx/* set ft=nginx
au BufWrite,BufRead,BufNewFile *.txt        set ft=text
au BufWrite,BufRead,BufNewFile *.snippets   set ft=snippet
au BufWrite,BufRead,BufNewFile *.thor       set ft=ruby
au BufWrite,BufRead,BufNewFile *.watchr     set ft=ruby
au BufWrite,BufRead,BufNewFile *.html       set ft=html
au BufWrite,BufRead,BufNewFile *.as         set ft=actionscript
au BufWrite,BufRead,BufNewFile *.c          set ft=c

au FileType ruby         set ts=2 sw=2 sts=2 expandtab
au FileType yaml         set ts=2 sw=2 sts=2 expandtab
au FileType rdoc         set ts=2 sw=2 sts=2 expandtab
au FileType eruby        set ts=2 sw=2 sts=2 expandtab
au FileType haml         set ts=2 sw=2 sts=2 expandtab
au FileType html         set ts=2 sw=2 sts=2 expandtab
au FileType php          set ts=2 sw=2 sts=2 expandtab
au FileType sass         set ts=2 sw=2 sts=2 expandtab
au FileType scss         set ts=2 sw=2 sts=2 expandtab
au FileType html         set ts=2 sw=2 sts=2 expandtab
au FileType css          set ts=2 sw=2 sts=2 expandtab
au FileType markdown     set ts=2 sw=2 sts=2 expandtab
au FileType vim          set ts=2 sw=2 sts=2 expandtab
au FileType javascript   set ts=2 sw=2 sts=2 expandtab
au FileType text         set ts=2 sw=2 sts=2 expandtab
au FileType snippet      set ts=8 sw=8 sts=8 noexpandtab
au FileType coffee       set ts=2 sw=2 sts=2 expandtab
au FileType cucumber     set ts=2 sw=2 sts=2 expandtab
au FileType zsh          set ts=2 sw=2 sts=2 noexpandtab
au FileType actionscript set ts=8 sw=8 sts=8 noexpandtab
au FileType c            set ts=4 sw=4 sts=4 noexpandtab

" \ is the leader character
let mapleader = "\\"

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

" Use very-magic Regex
nnoremap / /\v
vnoremap / /\v

" Soft-wrapped-friendly movement
nnoremap j gj
nnoremap k gk

" Wrappy Stuff for Visual Mode
vnoremap ( s)
vnoremap ) s(
vnoremap { s{
vnoremap } s}
vnoremap [ s]
vnoremap ] s[

" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp

" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Save the current file as root
command! W w !sudo tee % >/dev/null

" NERDCommenter Settings
let NERDSpaceDelims = 1

" Unformatting
nmap <silent><leader>u :s/\v(\S+)@<=\s+/ /g<CR>
vmap <silent><leader>u J :s/\v(\S+)@<=\s+/ /g<CR> 

" Toggle Comments
map <silent><D-/> <leader>c<space>

set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

source ~/.vimrc.guest
