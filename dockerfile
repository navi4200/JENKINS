FROM centos:latest
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN  sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd zip unzip -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page290/restoran.zip /var/wwww/html
WORKDIR /var/www/html
RUN cd /var/www/html
RUN unzip restoran.zip /var/www/html
RUN rm -rf restoran.zip &&\
    cp -rf restoran.zip . &&\ 
    rm -rf restoran.zip 
EXPOSE 80
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
