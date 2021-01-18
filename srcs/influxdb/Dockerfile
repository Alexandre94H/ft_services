FROM alpine

#update apk
RUN apk update

#install influxdb
RUN apk add influxdb

#install openrc
RUN apk add openrc
RUN openrc
RUN touch /run/openrc/softlevel

EXPOSE 8086
CMD rc-service influxdb start ; tail -f /dev/null