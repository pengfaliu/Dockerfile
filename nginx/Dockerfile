#
# Nginx Dockerfile
#
# https://github.com/pengfaliu/Dockerfile/nginx
#

# Pull base image.dockerhub.io
FROM fapeng/centos-basic:latest

# Install Nginx.
RUN \
  yum install nginx && \
  chown -R www-data:www-data /var/lib/nginx

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443
