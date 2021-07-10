set nocompatible | filetype indent plugin on

set t_Co=256

" esc in insert mode and command mode
imap kj <esc>
cmap kj <C-C>

" nvim true color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1


let g:ediyalam_themes = [ 'martin', 'koehler', 'peachpuff' ]
let g:ediyalam_airline_themes = [ 'light', 'murmur', 'raven', 'silver', 'ubaryd', 'wombat' ]




"set runtimepath "~/.vim/"
syntax on

set number

set nopaste

"Disable Intro Screen
set shortmess=I
"set shortmess=a

set nowrap

set encoding=utf-8


set backspace=indent,eol,start

"open new buffer bellow new one
set splitbelow

" show status even if there is one window
set laststatus=2

set hlsearch
set incsearch
if has('nvim') | set inccommand=nosplit | endif

set scrolloff=1


let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'

set wildmode=longest,list,full
set wildmenu

set list
set listchars=eol:↲,tab:▎\ ,extends:…,precedes:…

set mouse=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 'classic' ( Windows,KDE,...) Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" CTRL-BackSpace delete previous word
imap <C-BS> <C-W>

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X>		"+x
vnoremap <S-Del>	"+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C>		"+y
vnoremap <C-Insert>	"+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>		"+gP
map <S-Insert>	"+gP

cmap <C-V>		<C-R>+
cmap <S-Insert>	<C-R>+


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Be smart when using tabs ;)
set smarttab

" 1 tab == n spaces
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

" Linebreak on 500 characters
set lbr
set tw=500

"set ai "Auto indent
"set si "Smart indent
"set wrap "Wrap lines



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Find out user directory
let s:user_vim_directory = ''
if !empty(&rtp)
	let s:user_vim_directory = split(&rtp, ',')[0]
endif
if '' == s:user_vim_directory
	echoerr 'Could not find out location of user Vim directory'
endif

" Make vim behave as a pager
function! s:actAsPager()
	if has('nvim')
		set shada=
	endif
	set bt=nowrite
	set nomodifiable
	set laststatus=0
	sign unplace *
	set nonumber nolist
	set mouse=a
	nnoremap q :qa<CR>
	vnoremap q :qa<CR>
endfunction
command ActAsPager call s:actAsPager()



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Manager
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:ui_select_one(title,options,default)
	return confirm(a:title,a:options,a:default)
endfunction

function! s:shellExecute(commmand)
	silent execute '!'.a:commmand
	let result = v:shell_error
	return result
endfunction
function! s:shellExecuteOrDie(commmand)
	let result = s:shellExecute(a:commmand)
	if result == 0 | return | endif
	throw 'Execution of '.a:commmand.' failed with return code '.result
endfunction

function! s:declarePlugins()
		call plug#begin(s:user_vim_directory.'/bundle')
		 
		" Make sure you use single quotes

		" Plug 'https://bitbucket.com/martin-der/ediyalam.git'
		Plug '~/dev/prog/vim.d/ediyalam'
 
		" Plug 'junegunn/goyo.vim'
		" Plug 'com/junegunn/limelight.vim'

 
		Plug 'tpope/vim-commentary'

		Plug 'mhinz/vim-startify'

		" Plug 'vim-scripts/vim-misc', { 'type': 'git', 'url': 'https://github.com/xolox/vim-misc.git' }


		Plug 'skywind3000/vim-quickui'
	

		Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

		"Plug 'kien/ctrlp.vim'

		"Plug 'https://github.com/megaannum/self'
		"Plug 'vim-scripts/forms', { 'type': 'git', 'url': 'https://github.com/megaannum/forms.git' }

		Plug 'vim-scripts/gitv', { 'type': 'git', 'url': 'https://github.com/gregsexton/gitv.git' }
		Plug 'https://github.com/airblade/vim-gitgutter.git'
		Plug 'https://github.com/tpope/vim-fugitive.git'

		"Plug 'https://github.com/lornix/vim-scrollbar.git'
		"Plug 'lornix/vim-scrollbar' "desativé pour l instant

		"Plug 'https://github.com/Valloric/YouCompleteMe.git', { 'do' : './install.py --clang-completer' }
		Plug 'neoclide/coc.nvim', {'branch': 'release'}

		"Plug 'https://github.com/majutsushi/tagbar.git'
		"Plug 'https://github.com/xolox/vim-easytags.git'
		Plug 'liuchengxu/vista.vim'

		Plug 'bling/vim-airline'
		" Plug 'itchyny/lightline'
		" Takes Snapshot of the prompt
		"Plug 'https://github.com/edkolev/promptline.vim.git' 
		
		" Shows indentation, tabs et spaces
		"Plug 'https://github.com/Yggdroot/indentLine.git'
		
		"Plug 'tpope/vim-dispatch'

		Plug 'https://github.com/scrooloose/syntastic.git'

		""" aaarg, require python support compiled
		Plug 'https://github.com/vim-scripts/Conque-Shell.git'

		"Required 'vim compatible with python 2.5'
		"Plug 'https://github.com/sjl/threesome.vim.git'
		Plug 'sjl/splice.vim'
		"Plug 'http://ftp.stust.edu.tw/vim/runtime/menu.vim', { 'dir', '~/.vim/bundle-manual' }

		Plug 'scrooloose/nerdtree'
		Plug 'jistr/vim-nerdtree-tabs'
		Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin.git'

		Plug 'https://github.com/t9md/vim-choosewin.git'
		Plug 'https://github.com/wesQ3/vim-windowswap.git'

		Plug 'ericbn/vim-relativize'

		" Plugin outside ~/.vim/plugged with post-update hook
		Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

		" Plug 'martin-der/hih'
		Plug '~/dev/prog/vim.d/hih'

		Plug 'vim-scripts/ParseJSON'


		Plug 'posva/vim-vue'

		"Plug 'huawenyu/neogdb.vim'

		Plug 'Shougo/vimproc.vim', {'do' : 'make'}
		
		call ManagerExtrasVimPlug()

		Plug 'https://github.com/powerline/fonts.git', { 'do': './install.sh' }

		Plug 'fholgado/minibufexpl.vim'
		call plug#end()
endfunction

function! ManagerExtrasVimPlug()
	Plug 'idanarye/vim-vebugger'
"	Plug 'cpiger/NeoDebug'
	" Plug 'puremourning/vimspector'
	Plug 'junegunn/vader.vim' ,{ 'on': ['Grepper', '<plug>(GrepperOperator)'] }

endfunction

function! MDUFirstInitVim()
	let pluginManagerName = 'Vim Plug'
	let pluginManagerFilename = 'plug.vim'
	let source  = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

	let name = pluginManagerName
	let main_file_name = pluginManagerFilename
	let source_url = source
	let directory = s:user_vim_directory

	if directory == ''
		echo 'Cannot fetch Plugins Manager since Vim user directory is not known.'
		return 0
	endif

	let autoload_dir = directory . '/autoload'
	let disabling_file = directory . '/no-manager'

	if ! empty(glob(autoload_dir.'/'.main_file_name))
		call s:declarePlugins()
		return 1
	endif

	if ! empty(glob(disabling_file))
		"echo 'User don't want plugin manager'
		return 0
	endif

	let choice=confirm('Install Plugins Manager '.name.' into "'.directory.'" ? ',"&Yes\n&No\n&Don't ask",2)

	if 1 == choice
		let choice_install_plugins=s:ui_select_one("Also install plugins ?", "&Yes\n&No", 1)
		try
			call s:shellExecuteOrDie ( 'mkdir -p '.fnameescape(autoload_dir) )
			if executable("curl")
				call s:shellExecuteOrDie ( 'curl -fLo '.fnameescape(autoload_dir.'/'.main_file_name).' '.source_url )
			elseif executable("wget")
				call s:shellExecuteOrDie ( 'wget -O "'.fnameescape(autoload_dir.'/'.main_file_name).'" '.source_url )
			else
				throw "No executable found to download Plugins Manager. Please install one of : curl, wget"
			endif
			call s:declarePlugins()
			if 1 == choice_install_plugins
				PlugInstall
				windo redraw!
			endif
		catch
			echohl  error | echom 'Failed to install plugin manager : '.v:exception | echohl normal
			return 0
		endtry
		return 1
	endif

	if 3 == choice
		try
			call s:shellExecuteOrDie ( 'mkdir -p '.fnameescape(directory) )
			call s:shellExecuteOrDie ( 'touch '.fnameescape(disabling_file) )
			" let write_disabling_file_command = 'echo "'.strftime('%d/%m/%y %H:%M:%S').'" .w! >> '.disabling_file
		catch
			echohl  error | echom 'Failed to touch "'.disabling_file.'"' | echohl normal
		endtry
		:redraw
		echom 'Disabled proposal of Plugins Manager installation ; Remove "'.disabling_file.'" if you ever want to be asked again'
		return 0
	endif

	" choice == 2(No)
	return 0

endfunction

au VimEnter * call MDUFirstInitVim()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Splash Screen
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


let g:startify_custom_header = [
\'____   ____.__             ._______ ___                         .-''''''''''-.    ',
\'\   \ /   /|__| _____    __| _/    |   \                      .''         `.  ',
\' \   Y   / |  |/     \  / __ ||    |   /                     :             : ',
\'  \     /  |  |  Y Y  \/ /_/ ||    |  /                     :               :',
\'   \___/   |__|__|_|  /\____ ||______/                      :      _/|      :',
\'                    \/      \/                               :   =/_/      : ',
\'/-------------------------------------------------\           `._/ |     .''  ',
\'|IF you can keep your head when all about you     |        (   /  ,|...-''    ',
\'|Are losing theirs and blaming it on you,         |         \_/^\/||__       ',
\'|If you can trust yourself when all men doubt you,|      _/~  `""~`"` \_     ',
\'|But make allowance for their doubting too;       |   __/  -''/  `-._ `\_\__  ',
\'\-------------------------------------------------/ /jgs  /-''`  `\   \  \-.\ ',
\'',
\]

let g:startify_custom_header_center = 1

autocmd User Startified setlocal cursorline nonumber

hi StartifyBracket ctermfg=240
hi StartifyFooter  ctermfg=111
hi StartifyHeader  ctermfg=lightgreen
" ctermbg=darkgrey
hi StartifyNumber  ctermfg=215
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=green


let g:startify_skiplist = [
	\ 'COMMIT_EDITMSG',
	\ $VIMRUNTIME .'/doc',
	\ 'bundle-vundle/.*/doc'
	\ ]

:nnoremap J ddp
:nnoremap K ddkP



""" ******************
""" * Plugins Config *
""" ******************

let g:choosewin_overlay_enable          = 1


"set statusline+=%{fugitive#statusline()}
"
let g:airline_exclude_filetypes = ['qf','netrw','diff','undotree','gundo','nerdtree','tagbar', 'vim-plug', 'processes' ]

let g:airline_section_a = "%#__accent_bold#%{airline#util#wrap(ediyalam#tiers#airline#main#mode(),0)}%#__restore__#%{airline#util#append(airline#parts#crypt(),0)}%{airline#util#append(airline#parts#paste(),0)}%{airline#util#append(airline#extensions#keymap#status(),0)}%{airline#util#append(airline#parts#spell(),0)}%{airline#util#append('',0)}%{airline#util#append('',0)}%{airline#util#append(airline#parts#iminsert(),0)}---%{airline#util#wrap(airline#parts#mode(),0)}"
let g:airline_section_z = "%{g:airline_symbols.linenr}%#__accent_bold#%l%#__restore__#/%L%{g:airline_symbols.maxlinenr}%#__accent_bold#%v%#__restore__#"
let g:airline_section_y = "%{airline#util#wrap(ediyalam#tiers#airline#main#ffenc(),0)}"
let g:airline_section_x = "%#__accent_bold#%{airline#util#prepend(airline#extensions#coc#get_current_function(),0)}%#__restore__#"
let g:airline_section_x = "%#__accent_bold#%{airline#util#prepend(airline#extensions#coc#get_current_function(),0)}%#__restore__#"
let g:zairline_section_x = g:airline_section_x . "%{airline#util#prepend('',0)}%{airline#util#prepend(airline#extensions#vista#currenttag(),0)}%{airline#util#prepend('',0)}%{airline#util#prepend('',0)}%{airline#util#prepend('',0)}%{airline#util#prepend('',0)}%{airline#util#wrap(airline#parts#filetype(),0)}"

let g:quickui_border_style = 6
let g:quickui_color_scheme = 'solarized'

let g:gitgutter_map_keys = 0
"let g:gitgutter_diff_args = '-w'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|class|o)$'
  \ }

let g:ycm_confirm_extra_conf=1
let g:ycm_extra_conf_globlist = ['~/dev/prog/*','!~/*']

let NERDTreeRespectWildIgnore=1

"let g:vimspector_enable_mappings = 'HUMAN'

""" *******************
""" *     Ediyalam    *
""" *******************


let g:ediyalam_projets_default_root = "~/prog"
"let g:ediyalam_on_enter_load_workspace = 0
let g:ediyalam_on_exit_save_workspace = 1

let g:ediyalam_message_prefix='MduiDE | '
let g:ediyalam_visual_text_marker_level=1
let g:ediyalam_visual_tab_width=4

let g:ediyalam_configure_plugins = [ 'airline', 'nerdTree', 'fzf' ]

set wildignore+=.ediyalam/

nnoremap <silent> <F4> :Tagbar<CR>


"nnoremap <silent> <F9> :echo "Build…"<CR>

nnoremap <silent><F1>m :EdiyalamShowKeymap<CR>

inoremap <silent><F2>s :EdiyalamToggleMouse<CR>
nnoremap <silent><F2>m :EdiyalamToggleTextMarkers<CR>
nnoremap <silent><F2>l :EdiyalamToggleLineNumbers<CR>
nnoremap <silent><F2>g :EdiyalamToggleGutter<CR>
nnoremap <silent><F2>ct :EdiyalamToggleColorTheme<CR> 
nnoremap <silent><F2>cf :EdiyalamToggleColorFlavor<CR>
nnoremap <silent><F2>ca :EdiyalamToggleColorThemeAirline<CR>
nnoremap <silent><F2>t :EdiyalamToggleTabWidth<CR>
nnoremap <silent><F2>w :EdiyalamToggleLineWrap<CR>
inoremap <silent><F2>m <ESC>:EdiyalamToggleTextMarkers<CR>i
inoremap <silent><F2>l <ESC>:EdiyalamToggleLineNumbers<CR>i
inoremap <silent><F2>g <ESC>:EdiyalamToggleGutter<CR>i
inoremap <silent><F2>ct <ESC>:EdiyalamToggleColorTheme<CR>i
inoremap <silent><F2>cf <ESC>:EdiyalamToggleColorFlavor<CR>i
inoremap <silent><F2>ca <ESC>:EdiyalamToggleColorThemeAirline<CR>i
inoremap <silent><F2>t <ESC>:EdiyalamToggleTabWidth<CR>i
inoremap <silent><F2>w <ESC>:EdiyalamToggleLineWrap<CR>i

nnoremap <silent> <F3> :EdiyalamNERDTreeTabsGoInOrClose<CR>

noremap <F5> :EdiyalamDebugStepIn<cr>
noremap <F6> :EdiyalamDebugStepOver<cr>
noremap <F7> :EdiyalamDebugStepOut<cr>
noremap <F8> :EdiyalamDebugStepContinue<cr>

noremap <silent><C-B> :call ediyalam#debug#debug#ToggleBreakpointThisLine()<cr>

nmap <silent><C-D> gcc
vmap <silent><C-D> gcc

" ----------------------------------------------------------------
if &diff
	set readonly
endif


" ---- Misc handy ----

" Save the file using sudo
cmap w!! %!sudo tee > /dev/null %

" Print diff between current content and save file
command CurrentDiff w !diff % -

" ----------------------------------------------------------------
	
":au FocusLost * :set number
":au FocusGained * :set relativenumber

autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" automaticaly set filetype as shell where shebang is found
au BufWritePost * if getline(1) =~ "^#!" | if &filetype = '' | silent set filetype=sh | endif | endif

au VimEnter * colorscheme martin
au VimEnter * EdiyalamInit

let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'

"Connaitre le type de buffer :
"set filetype?

" Affiche les catégories de syntaxe
map ,hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

" Séléctionne le mot pour recherche au double click de la souris
noremap <2-LeftMouse> *


