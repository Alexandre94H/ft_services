FROM alpine

#update apk
RUN apk update

#generate phpmyadmin
RUN apk add wget zip
RUN wget $(wget https://www.phpmyadmin.net/home_page/version.txt -q -O- | tail -1)
RUN unzip phpMyAdmin-*-all-languages.zip
RUN rm phpMyAdmin-*-all-languages.zip
RUN mv phpMyAdmin-*-all-languages /phpmyadmin
ADD config.inc.php /phpmyadmin/.

#install nginx
RUN apk add nginx php7-fpm php7-mysqli php7-json php7-mbstring php7-session
RUN ln -s /phpmyadmin/ /var/www/phpmyadmin
RUN rm -f /etc/nginx/conf.d/default.conf
ADD phpmyadmin.conf /etc/nginx/conf.d/.

#install openrc
RUN apk add openrc
RUN openrc
RUN touch /run/openrc/softlevel

EXPOSE 80
CMD rc-service php-fpm7 start && rc-service nginx start; tail -f /dev/null