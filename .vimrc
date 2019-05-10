" vundle location
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Plugin和Bundle的区别 -> Plugin可以并行下载
Plugin 'gmarik/vundle'
" Bundle 'Valloric/YouCompleteMe'
Plugin 'scooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/syntastic'
" 按照规范检查Python代码
Plugin 'nvie/vim-flake8'
" 括号、逗号自动补全
Plugin 'jiangmiao/auto-pairs'
" 自动注释插件
" 使用 ,cs 为魔术一键注释 ,cu 为一键取消注释
Plugin 'scrooloose/nerdcommenter'
let mapleader=","


" 全局设置vim
" Linux使用时打开 colorsheme 按钮
"colorscheme desert
" 使用solarized主题
"set t_Co=256
"let g:solarized_termcolors=256
set background=dark
colorscheme solarized
" 开启文件类型自动检测功能
filetype plugin indent on 
" 解决Mac退格键不能删除字符
set backspace=2
" 设置编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
" 开启语法高亮和行号
syntax on
set nu
" 设置缩进
set tabstop=4 
set softtabstop=4 
set shiftwidth=4
" 突出显示当前行"
set cursorline
" 突出显示当前列"
set cursorcolumn
" 设置突出的颜色
"highlight CursorLine cterm=none ctermbg=236
"highlight CursorColumn cterm=none ctermbg=236
" 搜索忽略大小写"
set ignorecase
" 高亮搜索项"     
set hlsearch
" 随着键入即时搜索  
set incsearch
" 自动折叠功能，使用空格折叠
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
" 使系统剪切板和vim公用
set clipboard=unnamed


" 设置f5运行Python脚本
map <F5> :w<CR> :call RunPython()<CR> :redraw!
function RunPython()
    let mp = &makeprg
    let ef = &errorformat
    let exeFile = expand("%:t")
    setlocal makeprg=python\ -u
    set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    silent make %
    copen
    let &makeprg = mp
    let &errorformat = ef
endfunction


" pydiction plugin setting
" 自动补全Python语法插件
filetype plugin on
let g:pydiction_location = '~/.vim/tools/pydiction/complete-dict'
let g:pydiction_menu_height = 3


" NERDTree config
" 使用F2键快速调出和隐藏它；
" 使用NERDTree的方法 -> 
" ctrl + w ctrl + w 前进
" ctrl + w ctrl + b 后退
" ctrl + w ctrl + hjkl 执行上下左右的跳转
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
"显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"窗口大小"
let NERDTreeWinSize=25

" 适用于HTML
:set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags


" emmet
"let g:user_emmet_install_global = 0
"autocmd FileType html,css EmmetInstall
let g:user_emmet_expandabbr_key = '<F3>'
