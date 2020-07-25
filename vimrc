""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OS : LINUX
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 使用非兼容模式
set nocompatible

" 编码设置
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" 加载文件类型侦测
filetype on
" 加载基于文件类型的插件
filetype plugin on
" 加载基于文件类型的缩进
filetype indent on

" 显示行号
set number
" 显示模式
set showmode
" 显示命令
set showcmd
" 显示光标位置信息
set ruler
" 总是显示底部状态栏
set laststatus=2
" 设置tab键占4个字符长度
set tabstop=4
" 设置缩进占4个字符长度
set shiftwidth=4
" 搜索时忽略大小写
set ignorecase
" 高亮显示搜索匹配结果
set hlsearch
" 输入搜索模式时就高亮显示匹配结果
set incsearch
" 如果搜索模式含有大写字母，就不使用忽略大小写选项
set smartcase
" 重复搜索到达文件两端时，禁止循环搜索
set nowrapscan
" 允许在还有修改未保存时离开缓冲区
set hidden
" 禁止产生备份文件
set nobackup
" 禁止产生交换文件
set noswapfile
" 在命令行模式中使用tab键补全时列出所有的可选项
set wildmode=longest,list
" 使用配色方案
colorscheme molokai

" 设置tags文件的路径
set tags=./tags;,tags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" call plug#begin('~/.vim/plugged')
"
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'majutsushi/tagbar'
"
" Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
" Plug 'junegunn/fzf.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
"
" call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
	    cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
	    cs add $CSCOPE_DB
	endif
	set csverb
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-gutentags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.git', '.svn', '.root', '.project']

" 所生成的数据文件的尾巴，文件名 = tags文件的工程绝对路径 + gutentags_ctags_tagfile
let g:gutentags_ctags_tagfile = 'tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 右边显示
let g:NERDTreeWinPos='right'
nnoremap <C-n> :NERDTreeToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent><F8> :TagbarToggle<CR>
" tagbar 依赖 ctags 程序
let g:tagbar_ctags_bin='ctags'
" 左边显示，默认右边
let g:tagbar_left=1
" 打开 tagbar 时，光标定在 tagbar 窗口内
let g:tagbar_autofocus=1
" 设置不排序，默认排序
let g:tagbar_sort=0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map : change tabs quickly
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent><leader>n :tabn<CR>
nnoremap <silent><leader>p :tabp<CR>
nnoremap <silent><leader>c :tabclose<CR>
nnoremap <silent><leader>1 :tabn 1<CR>
nnoremap <silent><leader>2 :tabn 2<CR>
nnoremap <silent><leader>3 :tabn 3<CR>
nnoremap <silent><leader>4 :tabn 4<CR>
nnoremap <silent><leader>5 :tabn 5<CR>
nnoremap <silent><leader>6 :tabn 6<CR>
nnoremap <silent><leader>7 :tabn 7<CR>
nnoremap <silent><leader>8 :tabn 8<CR>
nnoremap <silent><leader>9 :tabn 9<CR>
nnoremap <silent><leader>0 :tabn 10<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map : change windows quickly
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
