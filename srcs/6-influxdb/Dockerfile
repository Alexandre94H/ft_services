FROM alpine

#update apk
RUN apk update

#install influxdb
RUN apk add wget tar
RUN wget https://dl.influxdata.com/influxdb/releases/influxdb2-2.0.3_linux_amd64.tar.gz
RUN tar -zxvf influxdb*_linux_amd64.tar.gz
RUN rm influxdb*_linux_amd64.tar.gz
RUN mv influxdb*_linux_amd64 influxdb

EXPOSE 8086
CMD /influxdb/influxd & while ! nc -z localhost 8086 </dev/null; do sleep 0.1; done && /influxdb/influx setup -f -u $INFLUX_USER -p $INFLUX_PASSWD -o example-org -b $INFLUX_DB ; tail -f /dev/null