FROM alpine

#update apk
RUN apk update

#generate phpmyadmin
RUN apk add wget zip
RUN mkdir -p /usr/share/webapps/;\
cd /usr/share/webapps/;\
wget $(wget https://www.phpmyadmin.net/home_page/version.txt -q -O- | tail -1);\
unzip phpMyAdmin-*-all-languages.zip;\
rm phpMyAdmin-*-all-languages.zip;\
mv phpMyAdmin-*-all-languages phpmyadmin
ADD config.inc.php /usr/share/webapps/phpmyadmin/.

#install nginx
RUN apk add nginx php7-fpm php7-mysqli php7-json php7-mbstring php7-session
RUN ln -s /usr/share/webapps/phpmyadmin/ /var/www/phpmyadmin
RUN rm -f /etc/nginx/conf.d/default.conf
ADD phpmyadmin.conf /etc/nginx/conf.d/.

#install openrc
RUN apk add openrc
RUN openrc
RUN touch /run/openrc/softlevel

EXPOSE 80
CMD rc-service php-fpm7 start && rc-service nginx start; tail -f /dev/null