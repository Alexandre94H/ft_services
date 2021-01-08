FROM alpine

RUN apk update

#install mysql
RUN apk add mysql mysql-client

#install openrc
RUN apk add openrc
RUN openrc
RUN touch /run/openrc/softlevel

#setup mariadb
RUN /etc/init.d/mariadb setup
ADD init_db.sql .

EXPOSE 80
CMD /etc/init.d/mariadb start && mariadb < init_db.sql && tail -f /dev/null