#!/bin/bash
docker stop $(docker ps -q) && docker rm $(docker ps -aq)
docker rmi $(docker images -aq)
docker system prune -af
echo "------ checking all is cleaned up ------"
docker ps -a
docker images -a
docker network ls
