#!/bin/bash - 
#===============================================================================
#
#          FILE:  gitolite_setup.sh
# 
#         USAGE:  ./gitolite_setup.sh 
# 
#   DESCRIPTION:  setup gitolite environment
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR: YOUR NAME (), 
#       COMPANY: 
#       CREATED: 11/14/2014 01:06:55 PM CST
#      REVISION:  ---
#===============================================================================

#########################################################################
# File Name: gitolite_setup.sh
# Author: yuanlu
# mail: ylyuanlu@sina.cn
# Created Time: Fri 14 Nov 2014 01:06:55 PM CST
#########################################################################
#!/bin/bash

function usage
{
	echo "**************************************************"
	echo " usage:                                           "
	echo " $ setup_gitolite.sh server admin                 "
	echo " server: git server ip address                    "
	echo " admin : admin account, such as 'xiaoming'        "
	echo "**************************************************"
}

function main
{
	server=${1}
	admin=${2}

	if [ -z ${1} ] || [ -z ${2} ];
	then
		usage
		exit
	fi

	echo "server ip : ${server}"
	echo "amdin user: ${admin}"

	# Add git account
	echo "start to add git account"
	sudo adduser --system --shell /bin/bash --group git 
	sudo adduser git ssh
	sudo passwd git

	# Generate ssh pair key and copy into git account
	echo "start to generate ssh pair keys"
	ssh-keygen -f ${admin}
	chmod 600 ~/.ssh/${amdin}.pub
	ssh-copy-id git@${server}

	# Set gitolite alias hostname
	echo "start to config host alias name"
	echo "host server" 					>> ~/.ssh/config
	echo "	user git" 					>> ~/.ssh/config
	echo "	hostname ${server}" 		>> ~/.ssh/config
	echo "	port 22" 					>> ~/.ssh/config
	echo "	identityfile ~/.ssh/${admin}" 	>> ~/.ssh/config

	# su git user account
	echo "start to switch git user account"
	su git
	cd ~

	# Obtain gitolite repository from internet
	echo "start to obtain gitolite source code from internet"
	git clone git://github.com/ossxp-com/gitolite.git

	# Source install gitolite in remote git account
	echo "start install gitolite"
	cd gitolite/src
	sudo ./gl-install /usr/local/bin /usr/share/gitolite/conf /usr/share/gitolite/hooks
	./gl-setup /tmp/${admin}.pub

	# exit git user account
	echo "all things done, exit"
	exit
}

main ${1} ${2}
