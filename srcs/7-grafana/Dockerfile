FROM alpine

#update apk
RUN apk update

#install grafana
RUN apk add wget tar libc6-compat
RUN wget https://dl.grafana.com/oss/release/grafana-7.3.7.linux-amd64.tar.gz
RUN tar -zxvf grafana-*.linux-amd64.tar.gz
RUN rm -f grafana-*.linux-amd64.tar.gz
RUN mv grafana-* grafana
ADD home /grafana

EXPOSE 3000
CMD /grafana/bin/grafana-server -homepath /grafana