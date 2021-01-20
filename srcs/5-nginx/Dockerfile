FROM alpine

#update apk
RUN apk update

#generate cert
RUN apk add openssl
RUN openssl req -new -x509 -days 365 -nodes -out /etc/ssl/private/nginx.cert.pem -keyout /etc/ssl/private/nginx.key.pem -subj "/C=US/ST=Utah/L=Lehi/O=Your Company, Inc./OU=IT/CN=yourdomain.com"
RUN chown root:root /etc/ssl/private/nginx.cert.*;\
	chmod 600 /etc/ssl/private/nginx.cert.*

#install nginx
RUN apk add nginx
RUN mkdir -p /usr/share/webapps/
ADD react /usr/share/webapps/react
RUN ln -s /usr/share/webapps/react/ /var/www/react
RUN rm -f /etc/nginx/conf.d/default.conf
ADD init_conf.sh .

#install openrc
RUN apk add openrc
RUN openrc
RUN touch /run/openrc/softlevel

EXPOSE 80
EXPOSE 443
CMD sh init_conf.sh && rc-service nginx start ; tail -f /dev/null