FROM alpine

#update apk
RUN apk update

#generate wordpress
RUN apk add wget tar mysql-client
RUN mkdir -p /usr/share/webapps/;\
	cd /usr/share/webapps/;\
	wget http://wordpress.org/latest.tar.gz;\
	tar -xzvf latest.tar.gz;\
	rm latest.tar.gz
ADD wp-config.php /usr/share/webapps/wordpress/.
ADD init_db.sh .
ADD wordpress.sql .

#install nginx
RUN apk add nginx php7-fpm php7-mysqli php7-json
RUN ln -s /usr/share/webapps/wordpress/ /var/www/wordpress
RUN rm -f /etc/nginx/conf.d/default.conf
ADD wordpress.conf /etc/nginx/conf.d/.

#install openrc
RUN apk add openrc
RUN openrc
RUN touch /run/openrc/softlevel

EXPOSE 80
CMD  sed -i -e "s/<ip>/$IP/g" wordpress.sql && sh init_db.sh; rc-service php-fpm7 start && rc-service nginx start; tail -f /dev/null