FROM alpine

#update apk
RUN apk update

#generate wordpress
RUN apk add wget tar mysql-client
RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN latest.tar.gz
RUN mkdir -p /usr/share/webapps
ADD wp-config.php /wordpress/.
ADD init_db.sh .
ADD wordpress.sql .

#install nginx
RUN apk add nginx php7-fpm php7-mysqli php7-json
RUN ln -s /wordpress/ /var/www/wordpress
RUN rm -f /etc/nginx/conf.d/default.conf
ADD wordpress.conf /etc/nginx/conf.d/.

#install openrc
RUN apk add openrc
RUN openrc
RUN touch /run/openrc/softlevel

EXPOSE 80
CMD  sed -i -e "s/<ip>/$IP/g" wordpress.sql && sh init_db.sh; rc-service php-fpm7 start && rc-service nginx start; tail -f /dev/null