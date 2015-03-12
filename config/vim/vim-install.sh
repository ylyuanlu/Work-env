#!/bin/bash

CURR_DIR=`pwd`
PACK_ROOT=$CURR_DIR/install-pack
HOME_CONF=$CURR_DIR/../home

install_dest_dir=~/.vim

function install_vim
{
#################################################################################
#	general common .vimrc settings
#	.vimrc	--->	~/
#################################################################################
	mkdir ${install_dest_dir}/{plugin,doc,syntax} -p
	cp $HOME_CONF/.vimrc ~

#################################################################################
#	chinese help support 
#   Download URL: http://vimcdoc.sf.net
#	vimcdoc-1.9.0.tar.gz	--->	${install_dest_dir}/
#	usage:
#		:help 
#################################################################################
	tar xvzf $PACK_ROOT/vimcdoc-1.9.0.tar.gz -C ${install_dest_dir}
	cd ${install_dest_dir}/vimcdoc-1.9.0
	./vimcdoc.sh -i
	cd -

#################################################################################
#	Taglist plugin add
#	Download URL: http://www.vim.org/scripts/script.php?script_id=273
#	taglist_45.zip	---> ${install_dest_dir}/
#	usage:
#		:Tlist
#		:help taglist.txt
#################################################################################
	unzip $PACK_ROOT/taglist_45.zip -d ${install_dest_dir}

#################################################################################
#	Winmanager plugin add (netrw.vim and taglist.vim)
#	Download URL: http://www.vim.org/scripts/script.php?script_id=95
#	winmanager.zip	---> ${install_dest_dir}/
#	usage:
#		:help winmanager
#		:wm
#################################################################################
	unzip $PACK_ROOT/winmanager.zip -d ${install_dest_dir}

#################################################################################
#	MiniBufExplorer faster scan bufferes
#	Download URL: http://www.vim.org/scripts/script.php?script_id=159
#	minibufexpl.vim	---> ${install_dest_dir}/plugin
#	usage:
#		:help buffer
#		<Tab>	向前循环切换到每个buffer名上
#		<S-Tab>	向后循环切换到每个buffer名上
#		<Enter>	在打开光标所在的buffer
#		d	删除光标所在的buffer
#	let g:miniBufExplMapWindowNavVim = 1
#		<C-h,j,k,l>切换到上下左右的窗口
#################################################################################
	cp $PACK_ROOT/minibufexpl.vim ${install_dest_dir}/plugin

#################################################################################
#	*.h switch to *.c each other
#	Download URL: http://www.vim.org/scripts/script.php?script_id=31
#	a.vim	--->	${install_dest_dir}/plugin
#	usage:
#		:A	在新Buffer中切换到c\h文件
#		:AS	横向分割窗口并打开c\h文件
#		:AV	纵向分割窗口并打开c\h文件
#		:AT	新建一个标签页并打开c\h文件
#################################################################################
	cp $PACK_ROOT/a.vim ${install_dest_dir}/plugin

#################################################################################
#	grep add
#	Download URL: http://www.vim.org/scripts/script.php?script_id=311
#	grep.vim	--->	${install_dest_dir}/plugin
#	usage:
#		:Grep	按照指定的规则在指定的文件中查找
#		:Rgrep	同上, 但是是递归的grep
#		:GrepBuffer	在所有打开的缓冲区中查找
#		:Bgrep	同上
#		:GrepArgs	在vim的argument filenames(:args)中查找
#		:Fgrep	运行fgrep
#		:Rfgrep	运行递归的fgrep
#		:Egrep	运行egrep
#		:Regrep	运行递归的egrep
#		:Agrep	运行agrep
#		:Ragrep	运行递归的agrep
#################################################################################
	cp $PACK_ROOT/grep.vim ${install_dest_dir}/plugin

#################################################################################
#	auto-completed
#	Download URL: http://www.vim.org/scripts/script.php?script_id=1764
#	code-complete.vim	--->	${install_dest_dir}/plugin
#	usage:
#		tab
#################################################################################
	cp $PACK_ROOT/code-complete.vim ~/vim/plugin

#################################################################################
#	supertab
#	Download URL: 
#	supertab	--->	${install_dest_dir}/plugin
#	usage:
#		tab
#################################################################################
	cp $PACK_ROOT/supertab.vim ~/vim/plugin

#################################################################################
#	code fast edit and make
#	Download URL: http://www.vim.org/scripts/script.php?script_id=213
#	c-support.zip	--->	${install_dest_dir}/
#	usage:
#		c-support-usage.txt
#################################################################################
	unzip $PACK_ROOT/c-support.zip -d ${install_dest_dir}

#################################################################################
#	code fast edit and make
#	Download URL: http://www.vim.org/scripts/download_script.php?%20src_id=9890
#	bash-support.zip	--->	~.vim/
#	usage:
#		bash-support-usage.txt
#################################################################################
	unzip $PACK_ROOT/bash-support.zip -d ${install_dest_dir}

#################################################################################
#	neocomplcache
#	Download URL: http://www.vim.org/scripts/script.php?script_id=2620
#	neocomplcache	--->	~.vim/
#	usage:
#################################################################################
	unzip $PACK_ROOT/neocomplcache-8.0.zip -d ${install_dest_dir}

#################################################################################
#	omnicppcomplete
#	Download URL: http://www.vim.org/scripts/script.php?script_id=1520
#	omnicppcomplete	--->	~.vim/
#	usage:
#################################################################################
	unzip $PACK_ROOT/omnicppcomplete-0.41.zip -d ${install_dest_dir}

#################################################################################
#	comments
#	Download URL: http://www.vim.org/scripts/script.php?script_id=2082
#	ocomments	--->	~.vim/
#	usage:
#################################################################################
	cp $PACK_ROOT/comments.vim ${install_dest_dir}/plugin

#################################################################################
#	nerdtree
#	Download URL: http://www.vim.org/scripts/script.php?script_id=1658 
#	nerdtree.zip --->	~.vim/
#	usage:
#		<F3>  		files list
#################################################################################
	unzip $PACK_ROOT/nerdtree.zip -d ${install_dest_dir}
}


function main
{
	echo "vim config starting..."
	if [ ${install_dest_dir} != "" ]; then
		install_dest_dir=${1}
	fi

	install_vim 
	echo "vim config end"
}

main ${1}
