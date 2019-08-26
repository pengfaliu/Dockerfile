#!/bin/bash
#author: pengfaliu@163.com
#make base image of docker for centos7
set -e

INSTALLED=0
USER="root"
PACKAGE=`rpm -qa supermin5`
CHECK_U=`whoami`
WORKDIR="/root/BaseImage"

#Is or not root user
if [ "$CHECK_U" == $USER ];then 
	echo "You are $CHECK_U user, can go on .. "
else
	echo "You should be use $USER user,exit~"
	exit 0
fi
# IS or not installed 
if [ -z "$PACKAGE" ];then
    echo "installing  superming5"
    yum install -y supermin5
fi

#workdir is right?
if [ ! -d "$WORKDIR" ]; then
  mkdir $WORKDIR
fi
#beginning..
cd $WORKDIR
supermin5 -v --prepare bash coreutils python yum epel-release yum-plugin-ovl -o supermin.d/
supermin5 -v --build --format chroot supermin.d -o appliance.d/
echo 7 > appliance.d/etc/yum/vars/releasever
echo `uuidgen` >  appliance.d/etc/hostname
echo "centos" > appliance.d/etc/yum/vars/contentdir
echo "container" > appliance.d/etc/yum/vars/infra
echo -e "[main]\nenabled=1" > appliance.d/etc/yum/pluginconf.d/ovl.conf
echo -e "[main]\nenabled=1" > appliance.d/etc/yum/pluginconf.d/langpacks.conf
echo 'LANG="en_US.UTF-8"'> appliance.d/etc/locale.conf
cp -p /root/{.bash_logout,.bash_profile,.bashrc,.cshrc,.lesshst,.tcshrc} appliance.d/root/
tar --numeric-owner -cpf centos7.6.tar -C appliance.d .
xz -z -9 centos7.6.tar 
#cat centos7.6.tar.xz | docker import - fapeng/centos:20190823
