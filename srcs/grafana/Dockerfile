FROM alpine

#update apk
RUN apk update

#install grafana
RUN apk add grafana wget tar
ADD home /grafana

EXPOSE 3000
CMD grafana-server -homepath /grafana