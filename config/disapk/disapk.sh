#########################################################################
# File Name: disapk.sh
# Author: yuanlu
# mail: ylyuanlu@sina.cn
# Created Time: Tue 09 Dec 2014 03:57:40 PM CST
#########################################################################
#!/bin/bash

PACKAGE_NAME=
DEST_DIR=temp


usage ()
{
    echo "------------------------------------------------"
    echo "| discompile apk shell script                  |"
    echo "| usage:                                       |"
    echo "|     disapk.sh dest_dir apk_name              |"
    echo "------------------------------------------------"
}	# ----------  end of function usage  ----------

do_work ()
{
    unzip ${PACKAGE_NAME} -d ${DEST_DIR}
    cd ${DEST_DIR}
    dex2jar.sh classes.dex
    jd-gui classes_dex2jar.jar
}	# ----------  end of function do_work  ----------


main ()
{
    if [ -e ${DEST_DIR} ]; then
        rm -rf ${DEST_DIR}
    fi 

    PACKAGE_NAME=${1}

    if [ "${PACKAGE_NAME}" == "" ]; then
        echo "package name is NULL"
        usage
        exit 0
    fi

    echo "package name is ${PACKAGE_NAME}"

    do_work
}	# ----------  end of function main  ----------

main ${1}
