A docker based owncloud for raspberry. 

For arm32v7. 

# Container
Starts ups 3 container:
- owncloud
- mariadb (mysql db)
- redis (in memory key value storage)

# Setup
- run the `setup.sh`
- modify `./dist/local.env` to set passwords
- `dokcer-compose up -d`

# Mounting local directories into owncloud
- execute `setup_localstorage.sh`
- modify `./dist/volumes.env` and `docker-compose.volumes.yml` as needed
- run `docker-compose -f docker-compose.yml -f docker-compose.volumes.yml up -d`
