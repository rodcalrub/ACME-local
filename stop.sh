BASE_SITE=do2021-grupal.com

docker stop nginx-proxy

# #Development
export NODE_ENV=development
export PORT=8001
export DBPORT=27017
export VIRTUAL_HOST=${BASE_SITE}
docker-compose -p ${VIRTUAL_HOST} down

#Production
export NODE_ENV=production
export PORT=8081
export DBPORT=27018
export VIRTUAL_HOST=prod.${BASE_SITE}
docker-compose -p ${VIRTUAL_HOST} down

#Teardown
docker stop nginx-proxy
docker rm nginx-proxy
docker volume rm logsvol
docker network rm service-tier
docker volume prune -f

# docker rm busybox