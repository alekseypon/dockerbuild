#!/bin/bash

sed -i "/Deny from All/d" /etc/httpd/conf.d/wordpress.conf \
&& sed -i "s/Require local/Require all granted/" /etc/httpd/conf.d/wordpress.conf \
&& sed -i s/database_name_here/$WP_DATABASE/ /etc/wordpress/wp-config.php \
&& sed -i s/username_here/$WP_DB_USER/ /etc/wordpress/wp-config.php \
&& sed -i s/password_here/$WP_DB_PASSWD/ /etc/wordpress/wp-config.php \
&& sed -i s/localhost/$WP_DB_HOST/ /etc/wordpress/wp-config.php

/usr/sbin/httpd -DFOREGROUND 
