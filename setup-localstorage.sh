cat << EOF > docker-compose.volumes.yml
version: '3.7'

services:
        owncloud:
                volumes:
			- ./testdir1:/mnt/testdir1
                        - ./testdir2:/mnt/testdir2
EOF

cat << EOF > dist/volumes.env
export volume_paths=( /mnt/testdir1 /mnt/testdir2 )
export volume_ids=( 1 2 )
export volume_names=( testdir1 testdir2 )
EOF
