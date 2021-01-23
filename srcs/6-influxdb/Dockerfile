FROM alpine

#update apk
RUN apk update

#install influxdb
RUN apk add wget tar
RUN wget https://dl.influxdata.com/influxdb/releases/influxdb2-2.0.3_linux_amd64.tar.gz
RUN tar -zxvf influxdb*_linux_amd64.tar.gz
RUN rm influxdb*_linux_amd64.tar.gz
RUN mv influxdb*_linux_amd64 influxdb

#install telegraf
RUN apk add telegraf

#add start script
ADD start.sh .

EXPOSE 8086
CMD sh start.sh ; tail -f /dev/null