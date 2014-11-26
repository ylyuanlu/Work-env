"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 实用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文文帮助文档
set helplang=cn

" 设置当文件被改动时自动载入
set autoread

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>

" 代码补全 
set completeopt=preview,menu

" 共享剪贴板  
set clipboard+=unnamed 

" 从不备份  
set nobackup

" 自动保存
set autowrite

" 突出显示当前行
set cursorline              

" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l

" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0

" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

" 增强模式中的命令行自动完成操作
set wildmenu

"设定折叠方式为手动 
set foldmethod=manual 

"实现C程序的缩进 
set cin     

"插入<tab>时使用’shiftwidth’ 
set sta     

"指明在插入模式下可以使用<BS>删除光标前面的字符 
set backspace=2 

"设置高亮关键字显示 
syntax enable 
syntax on

"去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限 
set nocompatible 

"显示行号 
set number 

"检测文件的类型 
filetype on 

"记录历史的行数 
set history=1000 

"背景使用黑色 
set background=dark 

"下面两行在进行编写代码时，在格式对起上很有用； 
"第一行，vim使用自动对起，也就是把当前行的对起格式应用到下一行； 
"第二行，依据上面的对起格式，智能的选择对起方式，对于类似C语言编写上很有用 
set autoindent 
set smartindent 

"第一行设置tab键为4个空格，第二行设置当行之间交错时使用4个空格 
set tabstop=4 
set shiftwidth=4 

"设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号 
set showmatch 

"在编辑过程中，在右下角显示光标位置的状态行 
set ruler 

"查询时非常方便，如要查找book单词，当输入到/b时，会自动找到第一 
"个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的单词，依 
"次类推，进行查找时，使用此设置会快速找到答案，当你找要匹配的单词 
"时，别忘记回车。 
"第一行设置搜索显示为高亮
set hlsearch
set incsearch 

"搜索时忽略大小写
set ignorecase

"设置编码为中文 
set enc=utf-8 

"Alt组合键不映射到菜单上 
set winaltkeys=no 

"总是出现状态栏 
set laststatus=2 

"设置状态栏 
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P> 

"设置隐藏已修改buffer 
set hidden 

autocmd FileType python setlocal et sta sw=4 sts=4

"使能插件
filetype plugin on 
filetype plugin indent on

"禁止自动改变当前Vim窗口的大小 
let Tlist_Inc_Winwidth=0 

"把方法列表放在屏幕的右侧 
let Tlist_Use_Right_Window=0 

"让当前不被编辑的文件的方法列表自动折叠起来， 这样可以节约一些屏幕空间 
let Tlist_File_Fold_Auto_Close=1

"映射F3为功能键调出winmanager的文件浏览器 
"映射双击F3调出Taglist的符号浏览器 
"let g:winManagerWindowLayout=’FileExplorer|TagList’ “你要是喜欢这种布局可以注释掉这一行 
map <F3> :WMToggle<cr> 
map <F3><F3> :TlistToggle<cr> 

" 将系统已经生成的tags导入 
set tags+=~/.vim/systags

" 添加ctags列表
source ~/database_code/LIST_TAGS
set autochdir

" 映射F10为添加cscope和ctags 
map <F10> :call Do_CsTag()<CR> 
map <F10><F10> :call Add_CsTag()<CR> 
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>    
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>    
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>    
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>    
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>    
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>    
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR> 
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

function Do_CsTag() 
	silent! execute "!ctags -R '.'" 
	if(executable('cscope') && has("cscope") ) 
		silent! execute "!find -L `pwd` -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' -o     -name '*.cxx' -o -name '*.hxx'> cscope.files -o -name '*.hpp' -o -name '*.py'"    endif 
		silent! execute “!cscope -bq” 
		silent! execute “call Add_CsTag()” 
endf

function Add_CsTag() 
	if filereadable("cscope.out") 
		execute "cs add cscope.out" 
		execute "set tags+=./tags" 
	endif 
endf

silent! execute “call Add_CsTag()”

" 添加cscope列表
source ~/database_code/LIST_CSCOPE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
"定义函数SetTitle，自动插入文件头 
func SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1,"\#########################################################################") 
		call append(line("."), "\# File Name: ".expand("%")) 
		call append(line(".")+1, "\# Author: yuanlu") 
		call append(line(".")+2, "\# mail: ylyuanlu@sina.cn") 
		call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
		call append(line(".")+4, "\#########################################################################") 
		call append(line(".")+5, "\#!/bin/bash") 
		call append(line(".")+6, "") 
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: yuanlu") 
		call append(line(".")+2, "	> Mail: ylyuanlu@sina.cn ") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if &filetype == 'cpp'
		call append(line(".")+6, "#include<iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
	call append(line(".")+6, "#include<stdio.h>")
	call append(line(".")+7, "")
	endif
	if &filetype == 'java'
		call append(line(".")+6,"public class ".expand("%"))
		call append(line(".")+7,"")
	endif
	"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G
endfunc 

" 打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu

" .h switch to .c each other
map <F11> :A<cr>

" echofunc
let g:EchoFuncKeyNext='<C-n>' 
let g:EchoFuncKeyPrev='<C-p>'

" shell脚本自动加上执行权限
function ModeChange() 
	if getline(1) =~ "^#!" 
		if getline(1) =~ "/bin/" 
			silent !chmod a+x <afile> 
		endif 
	endif 
endfunction 
au BufWritePost * call ModeChange()

" 从上次退出时编辑的位置继续编辑
if has("autocmd")
autocmd BufReadPost * 
  \ if line("'\'") > 0 && line ("'\'") <= line("$") | 
  \   exe "normal g'\'" | 
  \ endif
endif

" nerdtree设置
let g:NERDTree_title='NERD Tree'
let g:winManagerWindowLayout='NERDTree|TagList'
function! NERDTree_Start()
	exec 'NERDTree'
endfunction  
function! NERDTree_IsValid()
	return 1
endfunction  
