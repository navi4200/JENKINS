FROM centos:latest
RUN yum install httpd zip unzip -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page290/maria-ferrero.zip /var/wwww/html
WORKDIR /var/www/html
RUN unzip maria-ferrero.zip
RUN rm -rf maria-ferrero.zip &&\
    cp -rf maria-ferrero/* .&&\
    rm -rf maria-ferrero &&\
EXPOSE 80
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
