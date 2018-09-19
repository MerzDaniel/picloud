cat > /var/www/html/owncloud/config/autoconfig.php << EOF
# sudo chown www-data:www-data /mnt/data

<?php
\$AUTOCONFIG = array(
  "dbtype" => "$OWNCLOUD_DB_TYPE",
  "dbname" => "$OWNCLOUD_DB_NAME",
  "dbuser" => "$OWNCLOUD_DB_USERNAME",
  "dbpass" => "$OWNCLOUD_DB_PASSWORD",
  "dbhost" => "db",
# "datadirectory" doesn't seem to work? 
#  "datadirectory" => "/mnt/data",
  "mysql.utf8mb4" => true,
  "passwordsalt" => "$OWNCLOUD_PASSWORDSALT",
  "memcache.distributed" => "\\OC\\Memcache\\Redis",
  "redis" => [
    "host" => "redis",
    "port" => 6379,
    "timeout" => 0.0,
  ],
  "files_external_allow_create_new_local" => "true",
);
EOF

/usr/sbin/apache2ctl -D FOREGROUND
