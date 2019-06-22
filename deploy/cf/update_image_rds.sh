#!/usr/bin/env bash
set +x
opwd=$(pwd)
cd /home/concerto
oid=$(docker images | grep 'selfdirectedlearning/concerto-v5.*master' | awk '{print $3}')
cid=$(docker container ls -a | grep 'selfdirectedlearning/concerto-v5.*master' | awk '{print $1}')
out=$(docker pull selfdirectedlearning/concerto-v5:master)
opwd=$(pwd)
if [[ $out == *"Downloaded newer image"* ]]
then
  echo "Stop and remove container of Concerto, delete old image, restart Concerto from new image. "
  docker stop $cid
  docker container rm $cid
  docker rmi $oid
  /usr/local/bin/docker-compose up -d concerto
elif [[ $out == *"Image is up to date"* ]]
then
  echo "Image is up to date, no action needed. "
  docker inspect --format "{{.Id}}" $oid
else
  echo "Error in code, no action performed. "
fi
cd $opwd
exit 0
