#########################################################################
# File Name: teamviewerinst.sh
# Author: yuanlu
# mail: ylyuanlu@sina.cn
# Created Time: Wed 19 Nov 2014 10:49:27 PM CST
#########################################################################
#!/bin/bash

cd ~/Downloads
wget http://download.teamviewer.com/download/teamviewer_linux_x64.deb
sudo dpkg -i teamviewer_linux_x64.deb; 
sudo apt-get -f install
