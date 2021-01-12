echo "create user '$SQL_USER'@'%' identified by '$SQL_PASSWD'" | mysql
echo "create database $SQL_DB" | mysql
echo "grant all privileges on *.* to '$SQL_USER'@'%'" | mysql
echo "flush privileges" | mysql