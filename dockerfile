FROM centos:latest
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN  sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd vim unzip -y
add https://www.free-css.com/assets/files/free-css-templates/download/page290/cryptop.zip
WORKDIR /var/www/html
RUN  unzip cryptop.zip
RUN  rm -rf cryptop.zip
RUN  mv cryptop-html/* .
EXPOSE 80
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
