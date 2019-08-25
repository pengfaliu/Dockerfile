# 工程说明
## 目录说明
### Centos7 
   该目录里包含制作基础镜像的Dockerfile，其原理是利用scratch制作。
### make-tar-xz 
   该目录里包含制作压缩包的shell脚本。
### 执行顺序
	1. 先执行make-tar-xz.sh 
	2. 再到centos7目录下执行docker build 

## 补充：	
### 默认安装的包有
bash coreutils python yum epel-release
你可以根据自己的需要添加。当前制作完后的镜像大小在176MB左右



