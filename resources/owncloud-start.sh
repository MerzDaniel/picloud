sudo chown -R www-data:www-data /var/www/html/owncloud

# "datadirectory" doesn't seem to work? 
#  "datadirectory" => "/mnt/data",

cat > /var/www/html/owncloud/config/autoconfig.php << EOF
<?php
\$AUTOCONFIG = array(
  "dbtype" => "mysql",
  "dbname" => "$MYSQL_DATABASE",
  "dbuser" => "$MYSQL_USER",
  "dbpass" => "$MYSQL_PASSWORD",
  "dbhost" => "db",
  "dbtableprefix" => "",
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
