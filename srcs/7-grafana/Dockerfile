FROM alpine

#update apk
RUN apk update

#install grafana
RUN apk add wget tar libc6-compat bash
RUN wget https://dl.grafana.com/oss/release/grafana-7.3.7.linux-amd64.tar.gz
RUN tar -zxvf grafana-*.linux-amd64.tar.gz
RUN rm -f grafana-*.linux-amd64.tar.gz
RUN mv grafana-* grafana
ADD home /grafana
ADD sample.json .
ADD init_dashboards.sh .
RUN bash init_dashboards.sh

EXPOSE 3000
CMD /grafana/bin/grafana-server -homepath /grafana