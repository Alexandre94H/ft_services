adduser -S $FTP_USER
passwd $FTP_USER -d $FTP_PASSWD
echo $FTP_USER >> /etc/vsftpd.userlist