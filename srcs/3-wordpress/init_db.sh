echo "CREATE DATABASE $SQL_DB;" | mysql -h$SQL_HOST -u$SQL_USER -p$SQL_PASSWD
mysql -h$SQL_HOST -u$SQL_USER -p$SQL_PASSWD $SQL_DB < wordpress.sql