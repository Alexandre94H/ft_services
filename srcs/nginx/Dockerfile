FROM alpine
RUN apk update
RUN apk add openrc nginx
RUN openrc
RUN touch /run/openrc/softlevel
EXPOSE 80
EXPOSE 443
CMD rc-service nginx start ; tail -f /dev/null