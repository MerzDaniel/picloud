cat > /var/www/html/owncloud/config/autoconfig.php << EOF
<?php
\$AUTOCONFIG = array(
  "dbtype" => "$OWNCLOUD_DB_TYPE",
  "dbname" => "$OWNCLOUD_DB_NAME",
  "dbuser" => "$OWNCLOUD_DB_USERNAME",
  "dbpass" => "$OWNCLOUD_DB_PASSWORD",
  "dbhost" => "$OWNCLOUD_DB_HOST",
  "dbtableprefix" => "",
);
EOF

/usr/sbin/apache2ctl -D FOREGROUND
