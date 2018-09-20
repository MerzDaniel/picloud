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
