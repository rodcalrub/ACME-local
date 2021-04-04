BASE_SITE=acmeexplorer.com

#Setup
docker network create service-tier
docker run -d -p 80:80 --name nginx-proxy -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
docker network connect service-tier nginx-proxy
docker volume create --name=logsvol
docker volume create --name=datavol

#Development
export NODE_ENV=development
export PORT=8001
export DBPORT=27017
export DBSTRING="mongodb://mongo27017:27017/acme-explorer-${NODE_ENV}";
export HOSTNAME=${NODE_ENV}.${BASE_SITE}
source secrets.sh
docker-compose -p ${VIRTUAL_HOST} up -d

# #Production
# export NODE_ENV=production
# export PORT=8081
# export DBPORT=27018
# export HOSTNAME=${NODE_ENV}.${BASE_SITE}
# export DBSTRING="mongodb://mongo27017:27017/acme-explorer-${NODE_ENV}";
# docker-compose -p ${VIRTUAL_HOST} up -d

# docker run --name busybox -v logsvol:/var/log/app -it  busybox sh