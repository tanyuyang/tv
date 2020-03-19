""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author:yuyang.tan
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                   " 使用非兼容模式
filetype on                        " 打开文件类型侦测
filetype plugin on                 " 加载基于文件类型的插件
filetype indent on                 " 加载基于文件类型的缩进

set number                         " 显示行号
set showmode                       " 显示模式
set showcmd                        " 显示命令
set ruler                          " 显示光标位置信息
set laststatus=2                   " 总是显示底部状态栏
set tabstop=4                      " 制表符的长度为4
set shiftwidth=4                   " 自动缩进的长度为4
set ignorecase                     " 搜索时忽略大小写
set smartcase                      " 搜索时如果搜索模式含大写字母，就不使用忽略大小写选项
set hlsearch                       " 搜索时高亮显示匹配结果
set incsearch                      " 搜索时输入搜索模式时就高亮显示匹配结果
set nowrapscan                     " 搜索时禁止循环搜索
set hidden                         " 允许在还有修改未保存时离开缓冲区
set nobackup                       " 不产生备份文件
set noswapfile                     " 不产生交换文件
set wildmode=longest,list          " 在命令行中使用Tab键时以Bash shell的方式列出所有的可选项
set tags=./tags;,tags              " 设定tags文件的路径

colorscheme molokai                " 使用配色方案
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin : vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" call plug#begin('~/.vim/plugged')
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin : cscope
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
"    map : change tabs quickly
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
" plugin : NERETree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"    map : NERDTree
nnoremap <silent><leader>t :NERDTreeToggle<CR>
nnoremap <silent><leader>f :NERDTreeFind<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
