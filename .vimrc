"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 基本配置
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"line no
set nu
"光标
set mouse=a
" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atl
" 帮助文件使用中文
set helplang=cn
" 设置折叠模式
set foldcolumn=4
" 光标遇到折叠就打开
set foldopen=all
"突出显示当前行
set cursorline
"no bomb
set nobomb
"line number
set nu
" Sets how many lines of history VIM has to remember
set history=10000

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving or quit
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>Q :qa!<cr>
nmap <Leader>WQ :wqa<cr>
" 定义快捷键到行首和行尾
nmap <Leader>lb 0
nmap <Leader>le $

" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>

" When vimrc is edited, reload it
au! bufwritepost vimrc source ~/.vimrc

" Set 7 lines to the curors - when moving vertical..
set so=7

set wildmenu "Turn on WiLd menu

set ruler "Always show current position

set cmdheight=2 "The commandbar height

set hid "Change buffer - without saving

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 将制表符扩展为空格
set expandtab
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 设置编辑时制表符占用空格数
set tabstop=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

set lbr
set tw=500

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
" nmap <M-j> mz:m+<cr>`z
" nmap <M-k> mz:m-2<cr>`z
" vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
" vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z


""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/apple/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction


" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

"设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制
""好处：误删什么的，如果以前屏幕打开，可以找回
set t_ti= t_te=

" 去掉搜索高亮
noremap <silent><leader>/ :nohls<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" advance配置
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " " " " " " " " " "
"
"光标处理
"
" " " " " " " " " " "
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


" " " " " " " " " " "
"
"代码背景色
"
" " " " " " " " " " "
if exists('$TMUX')
    set term=screen-256color
endif

" " " " " " " " " " "
"
"tags 配置
"
" " " " " " " " " " "
set tags+=/Users/MLS/work/mall
set autochdir
set tags=tags;


" " " " " " " " " " " " " " " " " " " " " "
"
"php手册 打开PHP文件后，把光标移动到某个函数下，按大写的K键即可查看函数的文档内容
"利用composer 安装pman,命令
" composer global require gonzaloserrano/pman-php-manual:dev-master
"
" " " " " " " " " " " " " " " " " " " " " "
au FileType php setlocal keywordprg=pman


" " " " " " " " " " " " " " " " " " " " " "
"
" Delete trailing white space, useful for Python ;)
"
" " " " " " " " " " " " " " " " " " " " " "
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
au BufWrite *.py :call DeleteTrailingWS()
au BufWrite *.php :call DeleteTrailingWS()
au BufWrite *.js :call DeleteTrailingWS()

"au InsertEnter * hi Normal ctermbg=234 guibg=#000000
"au InsertLeave * hi Normal ctermbg=232 guibg=#1b1d1e



" " " " " " " " " " " " " " " "
"
" language section
"
" " " " " " " " " " " " " " " "

""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>
"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" => Vundle插件管理
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" All of your Plugins must be added before the following line
call vundle#end()

filetype plugin indent on
filetype plugin on

""""""""""""""""""""""""
" Vundle: 插件管理
""""""""""""""""""""""""
Plugin 'gmarik/Vundle.vim'


""""""""""""""""""""""""
" Fugitive: Git 集成，强烈推荐！
""""""""""""""""""""""""
Plugin 'tpope/vim-fugitive'


""""""""""""""""""""""""
" 目录树 配置
""""""""""""""""""""""""
Plugin 'scrooloose/nerdtree'

"启动vim后输入:NERDTree<Enter>, 我们还可以绑定一个快捷键
nmap <F3> :NERDTree  <CR>
let NERDTreeWinSize = 24
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'


""""""""""""""""""""""""
" 多光标操作 配置
""""""""""""""""""""""""
Plugin 'terryma/vim-multiple-cursors'

" 开启多光标
let g:multi_cursor_start_key='<C-n>'
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'


""""""""""""""""""""""""
" 文件search 配置
""""""""""""""""""""""""
Plugin 'kien/ctrlp.vim'

let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:15,results:15'
let g:ctrlp_max_depth = 40
let g:ctrlp_max_files = 20000
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }


""""""""""""""""""""""""
" 内容search 配置
""""""""""""""""""""""""
Plugin 'mileszs/ack.vim'

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

""""""""""""""""""""""""
" 小巧美观的状态栏 配置
""""""""""""""""""""""""
Plugin 'bling/vim-airline'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='solarized'

let g:airline_extensions = ['branch', 'tabline', 'ctrlp', 'tagbar']
let g:airline#extensions#default#section_truncate_width = {
    \ 'b': 79,
    \ 'x': 60,
    \ 'y': 88,
    \ 'z': 45,
    \ }
let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN:%{bufnr("%")}'

let g:airline#extensions#tagbar#enabled = 1

let g:airline#extensions#ctrlp#color_template = 'insert' 
let g:airline#extensions#ctrlp#color_template = 'normal'
let g:airline#extensions#ctrlp#color_template = 'visual'
let g:airline#extensions#ctrlp#color_template = 'replace'

let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing' ]


""""""""""""""""""""""""
" Solarized: 非常流行的配色。
""""""""""""""""""""""""
Plugin 'altercation/vim-colors-solarized'

syntax enable
if has('gui_running')
	set background=light
else
	set background=dark
endif

colorscheme solarized
let g:solarized_termcolors=256
"call togglebg#map("<F5>")

"when difference mode, colors becomes!
"au InsertEnter * hi Normal term=reverse ctermbg=darkgrey guibg=yellow
"au InsertLeave * hi Normal term=None ctermbg=black guibg=white


Plugin 'edsono/vim-matchit'

""""""""""""""""""""""""
" tagbar
""""""""""""""""""""""""
Plugin 'majutsushi/tagbar'
nmap <F4> :TagbarToggle<CR>
let g:Tb_MaxSize = 2


"provides insert mode auto-completion for quotes, parens, brackets, etc
Plugin 'Raimondi/delimitMate'

Plugin 'scrooloose/syntastic'

""""""""""""""""""""""""
" easymotion
""""""""""""""""""""""""
Plugin 'easymotion/vim-easymotion'

let g:EasyMotion_leader_key = '<Leader><Leader>'
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
let g:EasyMotion_smartcase = 1
map <Leader><Leader>l <Plug>(easymotion-lineforward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><Leader>h <Plug>(easymotion-linebackward)


Plugin 'ldx/vim-manage-classpath'
"Plugin 'tomasr/molokai'

Plugin 'leshill/vim-json'
let g:vim_json_syntax_conceal = 1

Plugin 'sjl/gundo.vim'
Plugin 'tyru/open-browser.vim'

Plugin 'anyakichi/vim-surround'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'ShowTrailingWhitespace'
Plugin 'terryma/vim-expand-region'
Plugin 'drmingdrmer/xptemplate'


""""""""""""""""""""""""
"gitgutter
""""""""""""""""""""""""
Plugin 'airblade/vim-gitgutter'

let g:gitgutter_diff_args = '-w'
let g:gitgutter_avoid_cmd_prompt_on_windows = 0
let g:gitgutter_sign_column_always = 1
" default value
let g:gitgutter_max_signs = 500
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterRevertHunk
nmap <Leader>hv <Plug>GitGutterPreviewHunk
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_highlight_lines = 1

""""""""""""""""""""""""
" Gist-vim
""""""""""""""""""""""""
Plugin 'mattn/Gist-vim'


Plugin 'Yggdroot/indentLine'

""""""""""""""""""""""""
" php-cs-fixer
""""""""""""""""""""""""
Plugin 'stephpy/vim-php-cs-fixer'

" If php-cs-fixer is in $PATH, you don't need to define line below
"let g:php_cs_fixer_level = "all"                  " which level ?
"let g:php_cs_fixer_config = "default"             " configuration
"let g:php_cs_fixer_php_path = "/usr/local/bin/php"               " Path to PHP
"" If you want to define specific fixers:
let g:php_cs_fixer_fixers_list = "linefeed,short_tag,indentation"
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
"let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
"let g:php_cs_fixer_verbose = 0


""""""""""""""""""""""""
" YouCompleteMe
""""""""""""""""""""""""
Plugin 'Valloric/YouCompleteMe'

let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>>'
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1
      \}
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'



""""""""""""""""""""""""
" emmet
""""""""""""""""""""""""
Plugin 'mattn/emmet-vim'

"emmet settings
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_install_global = 0
au FileType html,css,php,xml EmmetInstall
let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_settings = {
  \  'php' : {
  \    'extends' : 'html',
  \    'filters' : 'c',
  \  },
  \  'xml' : {
  \    'extends' : 'html',
  \  },
  \  'haml' : {
  \    'extends' : 'html',
  \  },
  \}


Plugin 'mattn/webapi-vim'
Plugin 'dyng/ctrlsf.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" snipmate 配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'msanders/snipmate.vim'

" snipmate插件add author name in snips_author
let g:snips_author = "liujingyu"

" 折行
Plugin 'djoshea/vim-matlab'
Plugin 'djoshea/vim-matlab-fold'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" UltiSnips
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Track the engine.
"Plugin 'SirVer/ultisnips'
"
"" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
"let g:UltiSnipsSnippetDirectories = ['~/.vim/bundle/vim-snippets/UltiSnips']
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" assuming you want to use snipmate snippet engine
"ActivateAddons vim-snippets snipmate
let g:UltiSnipsUsePythonVersion = 2

"Plugin 'MarcWeber/vim-addon-manager'

"let g:UltiSnipsSnippetsDir = '~/.vim/bundle/vim-snippets/UltiSnips'
"let g:UltiSnipsSnippetDirectories = ['~/.vim/bundle/vim-snippets/UltiSnips']

Plugin 'tomtom/tlib_vim'

Plugin 'Shougo/vimshell.vim'

Plugin 'Shougo/vimproc.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 自动对齐
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'junegunn/vim-easy-align'

vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
    let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 括号高亮
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'kien/rainbow_parentheses.vim'

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" 不加入这行, 防止黑色括号出现, 很难识别
" \ ['black',       'SeaGreen3'],

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 快速注释/解开注释
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'scrooloose/nerdcommenter'
" 注释的时候自动加个空格, 强迫症必配
let g:NERDSpaceDelims=1

"冲突
"Plugin 'kshenoy/vim-signature'
