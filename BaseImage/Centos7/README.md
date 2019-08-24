
# 安装的包有
bash 
iproute 
coreutils 
python 
util-linux 
hostnamectl 
procps-ng 
net-tools 
yum iputils 
tar 
wget 
git 
vim 
epel-release 
python2-pip

# 更改了下面的变更
echo 7 > appliance.d/etc/yum/vars/releasever

echo `uuidgen` >  appliance.d/etc/hostname

