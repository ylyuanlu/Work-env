#########################################################################
# File Name: tags_cscope.sh
# Author: yuanlu
# mail: ylyuanlu@sina.cn
# Created Time: Mon 03 Nov 2014 02:23:05 PM CST
#########################################################################
#!/bin/bash

DEFAULT_PATH=/home/yuanlu/mrd8-ww43
DATA_PORTS="hardware/libhardware_legacy linux external/wpa_supplicant_8 frameworks/base external/bluetooth bionic hardware/broadcom"

function usage
{
	echo "*************************************************"
	echo " usage: tscope.sh root_dir                       "
	echo " explain: root_dir is your code root directory   "
	echo " such as: /home/yuanlu/mrd8-ww43                 "
	echo "*************************************************"
}

function main
{
	if [ -z ${1} ]; 
	then
		usage
		echo "Will generate trace data in ${DEFAULT_PATH}"

		read -p " yes or no[y/Y|n/N]; " n
		if [ "$n" = "y" ] || [ "$n" = "Y" ];
		then
			PROJECT_ROOT=${DEFAULT_PATH}
		else	
			exit
		fi

	else
		PROJECT_ROOT=`echo ${1} | sed 's/\/$//'`
	fi

	echo "工程路径    : ${PROJECT_ROOT}"
	echo

	for var in ${DATA_PORTS}
	do
		TARGET_DIR=${PROJECT_ROOT}/${var}
		tcscope_one.sh ${TARGET_DIR}
		echo
	done

	echo "工程数据库建立完成"
}

main ${1}
