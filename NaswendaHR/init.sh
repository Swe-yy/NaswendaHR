#!/bin/bash

sudo docker stop hr-container
sudo docker rm hr-container
sudo docker build --no-cache -t naswendahr .
sudo docker run -d -p 4200:80 --name hr-container naswendahr