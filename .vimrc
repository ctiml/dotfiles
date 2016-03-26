" General Settings
" For pathogen.vim: auto load all plugins in .vim/bundle

set nocompatible    	" not compatible with the old-fashion vi mode
set bs=2 		" allow backspacing over everything in insert mode
set history=100 	" keep 50 lines of command line history
set ruler 		" show the cursor position all the time
set autoread 		" auto read when file is changed from outside
set noerrorbells
set hidden              " Allow "hidden" buffers.
set nobomb              " remove UTF-8 bomb
set cursorline

" vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
"Bundle 'Townk/vim-autoclose'
Bundle 'Raimondi/delimitMate'
Bundle 'othree/html5.vim'
"Bundle 'vim-scripts/OmniCppComplete'
Bundle 'easymotion/vim-easymotion'
Bundle 'scrooloose/nerdtree'
" Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'bling/vim-airline'
" Bundle 'ervandew/supertab'
Bundle 'majutsushi/tagbar'
" Bundle 'vim-scripts/VisIncr'
" Bundle 'wincent/Command-T'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'
Bundle 'pangloss/vim-javascript'
" Bundle 'vim-scripts/nginx.vim'
Bundle 'guns/xterm-color-table.vim'
"Bundle 'tpope/vim-fugitive'
Bundle 'kchmck/vim-coffee-script'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'mattn/emmet-vim'
Bundle 'groenewege/vim-less'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'kien/ctrlp.vim'
" Bundle 'honza/snipmate-snippets'
Bundle 'vim-scripts/javacomplete'
" origin repos on vim scripts
" Bundle 'showcolor'

filetype plugin indent on

"Some nice mapping to switch syntax (useful if one mixes different languages
"in one file)
"map <leader>$ :syntax sync fromstart<cr>
"autocmd BufEnter * :syntax sync fromstart

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

syntax on		" syntax highlight
set hlsearch		" search highlighting
set foldmethod=marker


set background=dark 
" 256 color
set t_Co=256
set t_AB=[48;5;%dm
set t_AF=[38;5;%dm
if has("gui_running")	" GUI color and font settings
  set guifont=Osaka-Mono:h20
  "set cursorline        " highlight current line
  colors moria
  "highlight CursorLine          guibg=#003853 ctermbg=24  gui=none cterm=none
else
" terminal color settings
  colors desert256 
endif

set clipboard=unnamed	" yank to the system register (*) by default
set showmatch		" Cursor shows matching ) and }
set showmode		" Show current mode
set wildchar=<TAB>	" start wild expansion in the command line using <TAB>
set wildmenu            " wild char completion menu

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

set autoindent		" auto indentation ' set ai
set incsearch		" incremental search
set nobackup		" no *~ backup files
set copyindent		" copy the previous indentation on autoindenting
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab		" insert tabs on the start of a line according to context

" disable sound on errors
set noerrorbells
set novisualbell
" set t_vb=
set tm=500

"set switchbuf=usetab
"nmap <C-n> :tabn<CR>
"nmap <C-p> :tabp<CR>
"nmap <C-t> :tabnew<CR>

" TAB setting{
   set expandtab        "replace <TAB> with spaces
   set softtabstop=4 
   set shiftwidth=4 

   au Filetype Makefile set noexpandtab
   au Filetype tsv set noexpandtab ts=8 sts=8 sw=8
   autocmd Filetype ruby,eruby setlocal ts=2 sts=2 sw=2
   autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
   autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
   autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
   autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
   autocmd Filetype php setlocal ts=4 sts=4 sw=4
   "au FileType ruby setlocal softtabstop=2 set shiftwidth=4
"}      							

au FileType php set dictionary+=~/.vim/dict/php.txt
set complete-=k complete+=k

" status line {
set laststatus=2
" set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \
" set statusline+=\ \ \ [%{&ff}/%Y]
" set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\
" set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction
 
function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction

"}


" C/C++ specific settings
autocmd FileType c,cpp,cc  set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

set wmw=0                     " set the min width of a window to 0 so we can maximize others 
set wmh=0                     " set the min height of a window to 0 so we can maximize others

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

" \p toggles paste mode
nmap <leader>p :set paste!<BAR>set paste?<CR>

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

"--------------------------------------------------------------------------- 
" PROGRAMMING SHORTCUTS
"--------------------------------------------------------------------------- 

"" Enable omni completion. (Ctrl-X Ctrl-O)
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType c set omnifunc=ccomplete#Complete
"autocmd FileType java set omnifunc=javacomplete#Complete
"
"" use syntax complete if nothing else available
"if has("autocmd") && exists("+omnifunc")
"  autocmd Filetype *
"              \	if &omnifunc == "" |
"              \		setlocal omnifunc=syntaxcomplete#Complete |
"              \	endif
"endif
"
"set cot-=preview "disable doc preview in omnicomplete

" set .phtml -> php syntax
au BufRead,BufNewFile *.phtml set filetype=php
au BufRead,BufNewFile *.html set filetype=php
au BufRead,BufNewFile *.as set filetype=actionscript

" set nginx
au BufRead,BufNewFile /usr/local/etc/nginx/* set ft=nginx
au BufRead,BufNewFile /etc/nginx/* set ft=nginx

" set phpini
au BufRead,BufNewFile /etc/php5/* set ft=dosini

au BufRead,BufNewFile *.tsv set filetype=tsv
au BufRead,BufNewFile *.gradle set filetype=groovy

" -----------------------------------
" HTML related 
" -----------------------------------
" HTML entities - used by xml edit plugin
let xml_use_xhtml = 1
" to HTML
let html_use_css = 1
let html_number_lines = 0
let use_xhtml = 1

" HTML
au FileType html set ft=xml
au FileType html set syntax=html


"--------------------------------------------------------------------------- 
" ENCODING SETTINGS
"--------------------------------------------------------------------------- 
set encoding=utf-8                                  
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

"nmap <C-u> :set encoding=utf8<CR>
"nmap <C-b> :set encoding=big5<CR>
"nmap <C-t> :set fileencoding=utf8<CR>
"nmap <C-i> :set fileencoding=big5<CR>

fun! ViewUTF8()
	set encoding=utf-8                                  
	set termencoding=big5
endfun

fun! UTF8()
	set encoding=utf-8                                  
	set termencoding=big5
	set fileencoding=utf-8
	set fileencodings=ucs-bom,big5,utf-8,latin1
endfun

fun! Big5()
	set encoding=big5
	set fileencoding=big5
endfun


"--------------------------------------------------------------------------- 
" PLUGIN SETTINGS
"--------------------------------------------------------------------------- 

" --- AutoClose - Inserts matching bracket, paren, brace or quote 
" fixed the arrow key problems caused by AutoClose


" Press Enter Auto Indent
inoremap {<CR>  {<CR>}<ESC>O
inoremap (<CR>   (<CR>)<ESC>O
inoremap [<CR>   [<CR>]<ESC>O
" Erb
inoremap <%      <% %><Left><Left><Left>
inoremap <%<CR>  <%<CR>%><ESC>O
" Liquid
inoremap {%      {% %}<Left><Left><Left>
inoremap {%<CR>  {%<CR>%}<ESC>O

" --- EasyMotion
"let g:EasyMotion_leader_key = '<Leader>m' " default is <Leader>w
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" --- Powerline
let g:Powerline_symbols = 'fancy'

set term=screen-256color

" number on
set nu

" emmet-vim
let g:user_emmet_leader_key='<C-e>'

highlight PmenuSel ctermfg=15 ctermbg=12

" javacomplete and gradle
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java inoremap <buffer> . .<C-X><C-O><C-P>
autocmd FileType java
    \   let path_pattern = '\(.\+\)\/\([A-Za-z0-9-]\+\)\/src\/\(main\|test\)\/java\/\(.\+\)' |
    \   let m = matchlist(expand('%:p:h'), path_pattern) |
    \   if len(m) > 1 |
    \       let b:classpath = m[1] . '/' . m[2] . '/Build/jars/*' |
    \   endif
