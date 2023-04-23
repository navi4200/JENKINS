FROM centos:latest
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN  sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd zip unzip -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page290/maria-ferrero.zip /var/wwww/html
WORKDIR /var/www/html
RUN unzip maria-ferrero.zip.ZIP /var/www/html
RUN rm -rf maria-ferrero.zip &&\
    cp -rf maria-ferrero/* . &&\
    rm -rf maria-ferrero 
EXPOSE 80
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
