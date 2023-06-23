#!/bin/bash

old_version=${version}
((version++))

if docker logs lbg-sample > /dev/null; then
	if docker exec lbg-sample ls > /dev/null; then
		docker stop lbg-sample
	else
		sleep 1
	fi
	docker rm lbg-sample 
else
	sleep 1
fi

if docker image history lbg-sample:v${old_version} > /dev/null; then
	docker rmi lbg-sample:v${old_version}
else
	sleep 1
fi

docker build -t lbg-sample:v${version} .
docker run -d -p 80:${PORT} -e PORT=${PORT} --name lbg-sample lbg-sample:v${version}
