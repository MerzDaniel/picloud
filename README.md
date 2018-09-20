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
- run `./dup-local`
- run `./cp-volumes`
- run `./dbash`
- now your are in the owncloud container
-- `source volumes.env`
-- `source add_external_volumes.sh`
- now the volumes will be mounted in owncloud. Only available for the "admin" user. In docker UI you can make them available for other users
