create user 'username'@'localhost' identified by 'password';
create database wordpress;
grant all privileges on wordpress.* to 'username'@'localhost';
flush privileges;