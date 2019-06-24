""""""""
" TODO "
""""""""
" Organize plugins and configurations into separate files
" Add more commands to cheat40.txt - maybe switch to https://github.com/vimwiki/vimwiki instead!
""""""""

"""""""""""""""
" Quick Start "
"""""""""""""""
" See bottom on cheatsheet for summary of custom commands
" <leader>? to open cheatsheet
" <leader>rc to exit cheatsheet
"""""""""""""""

"""""""""""
" Plugins "
"""""""""""

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' } " Used for grep in project, <space>/ for word search, <C-p> for files
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --tern-completer', 'for': 'cpp' } "Autocomplete suggestions
Plug 'Xuyuanp/nerdtree-git-plugin'                  " Git for NerdTree
Plug 'airblade/vim-gitgutter'                       " Git in the gutter
Plug 'bronson/vim-trailing-whitespace'              " Remove trailing whitespace
Plug 'easymotion/vim-easymotion'                    " Cursor navigation
Plug 'gabesoft/vim-ags'                             " Silver Surfer Plugin, use: Ags {pattern}
Plug 'haya14busa/incsearch-fuzzy.vim'               " Fuzzy incsearch
Plug 'haya14busa/incsearch.vim'                     " Highlight all matches incrementally
Plug 'jistr/vim-nerdtree-tabs'                      " NerdTree independent of tabs
Plug 'luochen1990/rainbow'                          " Colour matched brackets
Plug 'junegunn/vim-peekaboo'                        " Previews registers when using (\" or @)
Plug 'kshenoy/vim-signature'                        " Show marks
Plug 'lifepillar/vim-cheat40'                       " Vim cheatsheet (<leader>?)
Plug 'ludovicchabant/vim-gutentags'                 " Automatic background tag generation
Plug 'mkitt/tabline.vim'                            " Cleaner tabs
Plug 'qpkorr/vim-bufkill'                           " Delete file buffer without deleting split (:BD rather then :bd)
Plug 'ryanoasis/vim-devicons'                       " Icons next to filenames
Plug 'scrooloose/nerdcommenter'                     " commenting
Plug 'scrooloose/nerdtree'                          " File tree browser
Plug 'tpope/vim-abolish'                            " Flexible search
Plug 'tpope/vim-fugitive'                           " Git integration
Plug 'tpope/vim-repeat'                             " Repeat plugins
Plug 'tpope/vim-sensible'                           " Sensible defaults
Plug 'tpope/vim-sleuth'                             " Sets tabs/spaces based on file
Plug 'tpope/vim-surround'                           " Operate on surrounding
Plug 'tpope/vim-rhubarb'                            " Open github links
Plug 'vim-airline/vim-airline'                      " Lightweight powerline
Plug 'wellle/targets.vim'                           " Additional text objects
Plug 'roman/golden-ratio'                           " Resize splits automatically
Plug 'christoomey/vim-tmux-navigator'				" Navigate between tmux panes and vim splits
Plug 'sbdchd/neoformat'                             " Formatter that supports many file types
Plug 'djoshea/vim-autoread'                         " Auto-reload files when the change on disk

" C++
Plug 'bfrg/vim-cpp-modern', { 'for': 'cpp' }        " Modern C++ syntax highlighing (replaces vim-cpp-enhanced-highlight)
Plug 'majutsushi/tagbar', { 'for': 'cpp' }          " Displays class tags in sidebar (:TagBar)
Plug 'rhysd/vim-clang-format', { 'for': 'cpp' }     " for .clang-format (:ClangFormat)
Plug 'vim-scripts/a.vim', { 'for': 'cpp' }          " Switch between header/source (:A)
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }

" JS
Plug 'pangloss/vim-javascript', { 'for': ['jsx', 'js'] }    " JS support
Plug 'mxw/vim-jsx', { 'for': ['jsx', 'js'] }                " JSX highlighting
Plug 'w0rp/ale', { 'for': ['jsx', 'js'] }                   " JS syntax

" Misc Languages
Plug 'elzr/vim-json', { 'for': 'json' }                     " JSON highlighting
Plug 'othree/xml.vim', {'for': ['xml', 'xmd', 'xslt'] }     " XML highlighting
Plug 'peterhoeg/vim-qml', { 'for': 'qml' }                  " QML highligting
Plug 'tpope/vim-markdown', { 'for': 'markdown' }            " MD highlighting
Plug 'pboettch/vim-cmake-syntax', { 'for': 'cmake' }        " CMake highlighting

" Colorschemes
"Plug 'ajh17/Spacegray.vim'
"Plug 'altercation/vim-colors-solarized'
"Plug 'andreasvc/vim-256noir'
"Plug 'arcticicestudio/nord-vim'
"Plug 'dikiaap/minimalist'
"Plug 'rakr/vim-two-firewatch'
"Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

" Utilities
" Create tables automatically using '|', TableToggleMode, then || after first column
"Plug 'dhruvasagar/vim-table-mode'

call plug#end()

""""""""""""
" Settings "
""""""""""""
runtime! plugin/sensible.vim " Load sensible now so we can overwrite settings

" Source local settings not stored in repo
try
    source ~/.localvim
catch
  " No such file? No problem; just ignore it.
endtry

""""""""""""""""""""""""""""""""""""""""""""
" Tags                                     "
" see http://vim.wikia.com/wiki/VimTip1608 "
" Updates tags using config file           "
""""""""""""""""""""""""""""""""""""""""""""
" Recurse up to home folder looking for tag files
set tags=./tags,./TAGS,tags;~,TAGS;~
:command! ClangFormatDirectory !find . -iname *.hpp -o -iname *.cpp | xargs clang-format -i

"""""""""""
" General "
"""""""""""
"if has('nvim') || has('termguicolors')
    "set termguicolors
"endif

set background=dark
"colorscheme challenger_deep
colorscheme gruvbox

" Fixes tmux draw issue
set nolazyredraw

nnoremap <leader>rn :edit ~/.config/nvim/init.vim<CR>
nnoremap <leader>rv :edit ~/.vimrc<CR>
nnoremap <leader>rc :edit ~/.config/nvim/cheat40.txt<CR>

" Spell checking
" :set nospell/spell
" z= for corrections
"set spell spelllang=en_ca
"""""""""""""""
" Key Mapping "
"""""""""""""""
" Replaced by christoomey/vim-tmux-navigator
"Map ctrl-movement keys to window switching
"map <C-k> <C-w><Up>
"map <C-j> <C-w><Down>
"map <C-l> <C-w><Right>
"map <C-h> <C-w><Left>
" Switch to alternate file
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>
" Enable 'visual' movement (if a line is wrapped this allows moving to wrapped
" lines)
nnoremap j gj
nnoremap k gk

" All yanking uses system clipboard
set clipboard=unnamed

" Insert line before / after but don't enter insert mode and stay on the same line
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k

" Always show line numbers, but only in current window.
set number
:au winenter * :setlocal number
:au winleave * :setlocal nonumber

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

if exists('$ITERM_PROFILE')
  if exists('$TMUX')
    let &t_SI = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[0 q"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1"
    let &t_EI = "\<Esc>]50;CursorShape=0"
  endif
end

""""""""""""""""""""""""
" Plugin Configuration "
""""""""""""""""""""""""

"""""""""""
" airline "
"""""""""""
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline_powerline_fonts = 1
" Minimal flat edges
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ''
let g:airline_right_alt_sep = '|'

""""""""""""
" NERDTree "
""""""""""""
map <C-n> :NERDTreeTabsToggle<CR>
map <C-f> :NERDTreeFind<CR>
" Close vim if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDChristmasTree=1
let g:NERDTreeChDirMode=2
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let g:NERDTreeMapActivateNode = '<tab>'
set mouse=a

"""""""""""""""""
" NERDCommenter "
"""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 0
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
let g:NERDUsePlaceHolders=1
let g:NERDTreeQuitOnOpen=1

""""""""""
" Denite "
""""""""""
" Switch file_rec to use ag
call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
" Ag command on grep source
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
" Key mappings
nnoremap <C-p> :Denite file_rec<cr>
nnoremap <C-b> :Denite buffer<cr>
nnoremap <space>/ :Denite grep:.<cr>
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')

""""""""""""
" deoplete "
""""""""""""

"let g:deoplete#enable_at_startup=1
"let g:deoplete#sources#clang#libclang_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
""let g:deoplete#sources#clang#libclang_path=system('mdfind -name libclang.dylib')
"let g:deoplete#sources#clang#clang_header='/Library/Developer/CommandLineTools/usr/lib/clang'
"let g:deoplete#sources#clang#clang_complete_database='~/dev/black-coral'


"""""""""""
" rainbow "
"""""""""""
:au VimEnter * RainbowToggleOn
let g:rainbow_active=1

"""""""""""""""""
" YouCompleteMe "
"""""""""""""""""
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf="~/.ycm_extra_conf.py"
let g:ycm_collect_identifiers_from_tags_files = 1
" Jump to errors: ':lne or :lnext' and ':lpe or :lprevious'
let g:ycm_always_populate_location_list = 1
nnoremap <leader>df :YcmCompleter GoToDefinition<CR>
nnoremap <leader>dl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>
let g:ycm_key_list_select_completion=["<tab>"]
let g:ycm_key_list_previous_completion=["<S-tab>"]

"""""""""""""""
" easy-motion "
"""""""""""""""
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"""""""""""""
" Syntastic "
"""""""""""""
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler = 'clang'
let g:syntastic_cpp_compiler_options = '-std=c++17'
let g:syntastic_cpp_cpplint_exec = 'cpplint'
let g:syntastic_cpp_checkers = ['clang', 'cpplint']
let g:syntastic_quiet_messages = { 'regex': 'legal/copyright' }

""""""""""""""""
" clang-format "
""""""""""""""""
" default file is ~/.clang-format
" if dotfiles is installed
""""""""""""""""
let g:clang_format#detect_style_file = 1

""""""""""""""""""
" vim-cpp-modern "
""""""""""""""""""
let c_no_curly_error=1
let g:cpp_concepts_highlight = 1
let g:cpp_class_member_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

"""""""""""""
" incsearch "
"""""""""""""
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"""""""""""""""""""
" incsearch-fuzzy "
"""""""""""""""""""
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

""""""""""""""""""""""""""""""
" vim-cpp-enhanced-highlight "
""""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

"let g:cpp_experimental_simple_template_highlight = 1
"or
let g:cpp_experimental_template_highlight = 1

"""""""""""
" vim-jsx "
"""""""""""
" Enable for .js files as well
let g:jsx_ext_required = 0

""""""""""""""""""""
" Coding Standards "
""""""""""""""""""""
" May already be   "
" set by default   "
""""""""""""""""""""
set expandtab
set tabstop=4
set shiftwidth=4

set smarttab
set smartindent
