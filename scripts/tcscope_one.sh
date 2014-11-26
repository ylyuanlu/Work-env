#########################################################################
# File Name: tags_cscope.sh
# Author: yuanlu
# mail: ylyuanlu@sina.cn
# Created Time: Mon 03 Nov 2014 02:23:05 PM CST
#########################################################################
#!/bin/bash

DATABASE_CODE=~/database_code
CURRENT_PATH=

function cscope_create
{
	# 如果有其它类型的文件，则可以包含在这里  
	find -L ${CURRENT_PATH} -name "*.h" -o -name "*.c" -o -name "*.java" -o -name "*.cpp" > ${CURRENT_PATH}/cscope.files 

	cscopeParameter="-bqkR"  

	# -k选项是关掉默认的包含头文件/usr/include，如果需要打开，则去掉-k选项。  
	cscope ${cscopeParameter} -i cscope.files

	mv cscope.* ${1}
	echo "cs add ${1}/cscope.out" >> ${DATABASE_CODE}/LIST_CSCOPE
}

function ctags_create
{
	ctags -f ${1}/tags -L ${1}/cscope.files
	echo "set tags+=${1}/tags" >> ${DATABASE_CODE}/LIST_TAGS
}

function main
{
	if [ -z ${1} ];
	then
		echo "Work path is null, so do nothing"
		exit 0
	fi

	CURRENT_DIR=`pwd`
	touch ${DATABASE_CODE}/{LIST_TAGS,LIST_CSCOPE}

	WORK_PATH=${1}
	echo "工作路径   ： ${WORK_PATH}"

	TARGET_PATH=`echo ${WORK_PATH} | sed 's/\//_/g'`
	DATABASE_TARGET_PATH=${DATABASE_CODE}/${TARGET_PATH}

	echo "数据库路径 ： ${DATABASE_TARGET_PATH}"
	mkdir -p ${DATABASE_TARGET_PATH}

	cd ${WORK_PATH}
	CURRENT_PATH=`pwd`  

	echo "数据库建立中......"
	cscope_create ${DATABASE_TARGET_PATH}
	ctags_create ${DATABASE_TARGET_PATH}

	echo "路径数据库建立成功"
	cd ${CURRENT_DIR}
}

main ${1}
