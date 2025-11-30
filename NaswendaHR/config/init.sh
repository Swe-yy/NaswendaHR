#!/bin/bash

cd "$(dirname "$0")"

sudo docker stop hr-container
sudo docker rm hr-container

docker-compose up --build
# sudo docker build --no-cache -f Dockerfile -t naswendahr ..
# sudo docker run -d -p 4200:80 --name hr-container naswendahr