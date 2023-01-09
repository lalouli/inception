#!bin/sh
rm /var/www/wp-config.php
touch /var/www/wp-config.php

echo '<?php' >> /var/www/wp-config.php;
echo 'define( 'Data_name', '${Data_name}' );' >> /var/www/wp-config.php;
echo 'define( 'Data_User', '${Data_User}' );' >> /var/www/wp-config.php;
echo 'define( 'Data_pass', '${Data_pass}' );' >> /var/www/wp-config.php;
echo 'define( 'DB_HOST', 'mariadb' );' >> /var/www/wp-config.php;
#echo 'if ( ! defined( 'ABSPATH' ) ) {' >> /var/www/wp-config.php;
#echo 'define( 'WP_REDIS_HOST', 'redis' );}' >> /var/www/wp-config.php;
echo 'define( 'WP_REDIS_PORT', 6379 );' >> /var/www/wp-config.php;
echo 'define( 'WP_REDIS_TIMEOUT', 1 );' >> /var/www/wp-config.php;
echo 'define( 'WP_REDIS_READ_TIMEOUT', 1 );' >> /var/www/wp-config.php;
echo 'define( 'WP_REDIS_DATABASE', 0 );' >> /var/www/wp-config.php;