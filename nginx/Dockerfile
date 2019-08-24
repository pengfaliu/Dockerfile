#
# Nginx Dockerfile
#
# https://github.com/pengfaliu/Dockerfile/nginx
#

# Pull base image.dockerhub.io
FROM fapeng/centos:test

LABEL maintainer="pengfaliu@163.com"

#set enviroment   locale & timezone
RUN cp -p /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
	cp -p conf/nginx.repo /yum/repo.d/nginx.repo && \
	yum install -y nginx && \
	yum clean all

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

ADD run.sh /run.sh
RUN chmod 775 /run.sh

# Define default command.
CMD ["/run.sh"]

# Expose ports.
EXPOSE 80/tcp
EXPOSE 443/tcp

