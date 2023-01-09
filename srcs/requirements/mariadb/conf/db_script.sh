#!bin/sh

if [ ! -d /var/lib/mysql/$Data_name ] ; then 
    service mysql start
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS $Data_name"
    mysql -u root -e "CREATE USER '$Data_User'@'%' IDENTIFIED BY '$Data_pass'"
    mysql -u root -e "GRANT ALL PRIVILEGES ON $Data_name.* TO '$Data_User'@'%'"
    mysql -u root -e "FLUSH PRIVILEGES"
    mysql -u root -e "ALTER USER '$Data_RootT'@'localhost' IDENTIFIED BY '$Data_pass'"
    mysql -u root -e "FLUSH PRIVILEGES"
    kill `cat /var/run/mysqld/mysqld.pid`
fi
