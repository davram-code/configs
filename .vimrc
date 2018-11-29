"Use pathogen
execute pathogen#infect()

"Makes colorscheme work
set nocompatible

"Enable syntax highlight
syntax enable

"Number of visual spaces per TAB
set tabstop=4      

"Set color scheme
colorscheme onedark


"Make backspace work like most other apps
set backspace=2

"Set line numbers
set number

"Highlight current line
set cursorline

"Visual autocomplete menu
set wildmenu

"Vim loves to redraw the screen during things it probably doesn't need to
"Tells vim not to
set lazyredraw

"Highlight matching [{()}]
set showmatch

"SEARCHING

"Search as characters are entered
set incsearch

"Highlight search matches
set hlsearch

"FOLDING

"Enable folding
"set foldenable

"Let syntax handle folding
"set foldmethod=syntax

"Space open/closes folds
nnoremap <space> za

"MOVEMENT

"So if there's a very long line that gets visually wrapped to two lines, j won't skip over the "fake" part of the visual line in favor of the next "real" line.
nnoremap j gj
nnoremap k gk
nnoremap <up> gk
nnoremap <down> gj 

"Highlight last inserted text
nnoremap gV `[v`]

"GUNDO
nnoremap <leader>u :GundoToggle<CR>

"CSCOPE
source $HOME/.vim/cscope_maps.vim

"Path to directory where library can be found
"let g:clang_library_path='/usr/lib/llvm-3.8/lib'

"Use YCM with python3
let g:ycm_python_binary_path = '/usr/bin/python3'

filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Per-filetype settings
autocmd FileType java		setlocal tw=78 cin foldmethod=marker
autocmd FileType c,cpp		setlocal tw=72 cindent noexpandtab
autocmd FileType python		setlocal autoindent expandtab sts=4 sw=4 tw=78
autocmd FileType sh		setlocal sts=4 sw=4 si et

"display the status line always
set laststatus=2
" More tabs -- we have enough memory.
set tabpagemax=20


" Mark tabs and spaces
set list listchars=tab:»\ ,trail:·,extends:»,precedes:«
" Open new vertical splits to the right of current one.
set splitright
set smartcase
set ignorecase
nnoremap <Tab> <C-W>w
nnoremap <F1> 1gt
nnoremap <F2> 2gt
nnoremap <F3> 3gt
nnoremap <F4> 4gt

" Align subsequent lines to open parantheses in C sources.  Via andradaq.
set cinoptions=(0,W4

" Restore position inside previously opened file.  From vim.wikia.
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

"Cursor starts in main window
autocmd VimEnter * wincmd p

"Activate GitGutter on vim start

"Set vim update time
set updatetime=250

"GitGutter supress itself if it has more dan <number> changes
let g:gitgutter_max_signs = 500  " default value
