FROM alpine

#update apk
RUN apk update

#install nginx
RUN apk add nginx

#install openrc
RUN apk add openrc
RUN openrc
RUN touch /run/openrc/softlevel

EXPOSE 80
EXPOSE 443
CMD rc-service nginx start ; tail -f /dev/null