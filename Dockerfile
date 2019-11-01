# base image
FROM centos:7.6.1810

MAINTAINER fangfei

#设置一个时区的环境变量
ENV TZ "Asia/Shanghai"

#虚拟终端
ENV TERM xterm


RUN yum -y update \
    && yum -y install epel-release \
    && yum -y install gcc gcc-c++ make gd-devel libxml2-devel libcurl-devel libjpeg-devel libpng-devel openssl-devel bison \
    && yum -y install git wget

COPY ./soft /soft

WORKDIR /soft

RUN tar xzf oneinstack-full.tar.gz \
    && ./oneinstack/install.sh --nginx_option 1 --php_option 6 --phpcache_option 1 --php_extensions imagick,imap,redis,mongodb ; exit 0


EXPOSE 80 443

VOLUME ["/data/wwwroot/default"]

ENTRYPOINT ["/soft/entrypoint.sh"]







