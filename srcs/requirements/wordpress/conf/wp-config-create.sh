#!bin/sh
rm /var/www/wp-config.php
touch /var/www/wp-config.php

echo '<?php' >> /var/www/wp-config.php;
echo 'define( 'Data_name', '${Data_name}' );' >> /var/www/wp-config.php;
echo 'define( 'Data_User', '${Data_User}' );' >> /var/www/wp-config.php;
echo 'define( 'Data_pass', '${Data_pass}' );' >> /var/www/wp-config.php;
echo 'define( 'DB_HOST', 'mariadb' );' >> /var/www/wp-config.php;