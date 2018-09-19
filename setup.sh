mkdir -p dist
echo creating default config in ./dist/local.env...
cat > dist/local.env << EOF 
# owncloud config
OWNCLOUD_PASSWORDSALT=abcdef1234567890abcdef18273645
OWNCLOUD_CREATELOCAL=true
# db related
MYSQL_ROOT_PASSWORD=mysql-root-pass
MYSQL_DATABASE=owncloud
MYSQL_USER=owncloud
MYSQL_PASSWORD=owncloud
EOF

echo download owncloud...
wget "https://download.owncloud.org/community/owncloud-10.0.9.tar.bz2" -O dist/owncloud.tar.bz2
echo done.
echo You can now run docker-compose up -d
