FROM alpine

#update apk
RUN apk update

#install mysql
RUN apk add mysql mysql-client

#install openrc
RUN apk add openrc
RUN openrc
RUN touch /run/openrc/softlevel

#setup mariadb
RUN echo "port = 3306" >> /etc/my.cnf
RUN echo "bind-address = 0.0.0.0" >> /etc/my.cnf
RUN echo "socket=/run/mysqld/mysqld.sock" >> /etc/my.cnf
RUN echo "skip-networking=false" >> /etc/my.cnf
RUN /etc/init.d/mariadb setup
ADD init_db.sh .

EXPOSE 3306
CMD /etc/init.d/mariadb start && sh init_db.sh ; tail -f /dev/null