/etc/init.d/mariadb setup
/etc/init.d/mariadb start
echo "CREATE USER '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWD';
GRANT ALL PRIVILEGES ON *.* TO '$SQL_USER'@'%';
FLUSH PRIVILEGES" | mysql