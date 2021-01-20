FROM alpine

#update apk
RUN apk update

#generate cert
RUN apk add openssl
RUN openssl req -new -x509 -days 365 -nodes -out /etc/ssl/private/vsftpd.cert.pem -keyout /etc/ssl/private/vsftpd.key.pem -subj "/C=US/ST=Utah/L=Lehi/O=Your Company, Inc./OU=IT/CN=yourdomain.com"
RUN chown root:root /etc/ssl/private/vsftpd.cert.*;\
	chmod 600 /etc/ssl/private/vsftpd.cert.*

#install ftps
RUN apk add vsftpd
ADD vsftpd_footer.conf .
RUN cat vsftpd_footer.conf >> /etc/vsftpd/vsftpd.conf
RUN rm -f vsftpd_footer.conf
ADD init_user.sh .

#install openrc
RUN apk add openrc
RUN openrc
RUN touch /run/openrc/softlevel

EXPOSE 21
CMD sh init_user.sh && rc-update add vsftpd default && rc-service vsftpd restart; tail -f /dev/null