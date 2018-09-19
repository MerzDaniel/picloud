mkdir -p dist
echo creating default config in ./dist/local.env...
cat > dist/local.env << EOF 
OWNCLOUD_DB_TYPE=mysql
OWNCLOUD_DB_NAME=owncloud
OWNCLOUD_DB_USERNAME=owncloud
OWNCLOUD_DB_PASSWORD=owncloud
OWNCLOUD_PASSWORDSALT=abcdef1234567890abcdef18273645
OWNCLOUD_CREATELOCAL=true
EOF

echo download owncloud...
wget "https://download.owncloud.org/community/owncloud-10.0.9.tar.bz2" -O dist/owncloud.tar.bz2
echo done.
echo You can now run docker-compose up -d
