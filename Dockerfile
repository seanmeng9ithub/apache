# base image
FROM httpd:2.4

# apache home dir:/usr/local/apache2
# conf dir: <apache home>/conf/
# httpd.conf
# cert and key files: /conf/
# server.crt 
# server.key
# public htlm: <apache home>/htdocs/
COPY ./conf/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./conf/httpd-ssl.conf /usr/local/apache2/conf/extra/httpd-ssl.conf
COPY ./conf/server.crt /usr/local/apache2/conf/server.crt
COPY ./conf/server.key /usr/local/apache2/conf/server.key
COPY ./public/ /usr/local/apache2/htdocs/

EXPOSE 80 443

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]

# Build the Image:
# docker build -t myapache .
# docker run -d -p 80:80 myapache 