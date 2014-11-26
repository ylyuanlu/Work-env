#########################################################################
# File Name: setupenv.sh
# Author: yuanlu
# mail: ylyuanlu@sina.cn
# Created Time: Tue 18 Nov 2014 10:51:28 PM CST
#########################################################################
#!/bin/bash

# Install some neccessary tools for android compile
	  \
	 
sudo apt-get install git git-core gnupg flex bison gperf build-essential \
	zip curl libc6-dev libc6-dev-i386 libncurses5-dev:i386 x11proto-core-dev \
	libx11-dev:i386 lib32readline-gplv2-dev libreadline6-dev:i386 libgl1-mesa-glx:i386 \
	uboot-mkimage libgl1-mesa-dev g++-4.4-multilib g++-multilib lib32ncurses5-dev \
	plib32z-dev ython-markdown libxml2-utils xsltproc zlib1g-dev:i386 mingw32 tofrodos 

# Create a symbol link
sudo ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/libGL.so

# set high-cache for faster compile
# echo "export USE_CCACHE=1" >> ~/.bashrc
# echo "export CCACHE_DIR=~/.ccache" >> ~/.bashrc
# prebuilts/misc/linux-x86/ccache/ccache -M 50G

# Install jdk1.6
sudo mkdir -p /opt/java
sudo cp ~/Downloads/jdk-6u45-linux-x64.bin /opt/java
cd /opt/java
chmod a+x ./jdk-6u45-linux-x64.bin
sudo ./jdk-6u45-linux-x64.bin
echo "export JAVA_HOME=/opt/java/jdk1.6.0_45" >> /etc/profile
echo "export JRE_HOME=${JAVA_HOME}/jre" >> /etc/profile
echo "export CLASSPATH=${JAVA_HOME}/lib:${JRE_HOME}/lib:${CLASSPATH}" >> /etc/profile
echo "export PATH=${JAVA_HOME}/bin:${JRE_HOME}/bin:${PATH}" >> /etc/profile
java -version
