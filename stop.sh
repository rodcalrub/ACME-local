BASE_SITE=acmeexplorer.com

docker stop nginx-proxy

# #Development
export NODE_ENV=development
export PORT=8001
export DBPORT=27017
export DBSTRING="mongodb://mongo27017:27017/acme-explorer-${NODE_ENV}";
export HOSTNAME=${NODE_ENV}.${BASE_SITE}
source secrets.sh
docker-compose -p ${VIRTUAL_HOST} down

#Production
# export NODE_ENV=production
# export PORT=8081
# export DBPORT=27018
# export DBSTRING="mongodb://mongo27017:27017/acme-explorer-${NODE_ENV}";
# export VIRTUAL_HOST=${NODE_ENV}.${BASE_SITE}
# source secrets.sh
# docker-compose -p ${VIRTUAL_HOST} down

#Teardown
docker stop nginx-proxy
docker rm nginx-proxy
docker volume rm logsvol
docker network rm service-tier
docker volume prune -f

# docker rm busybox