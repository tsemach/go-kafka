#!/bin/bash

export MY_IP=$(ifconfig | grep -C 2 enp  | grep 10.100 | awk '{print $2}')
echo "found MY_IOT=$MY_IP"

docker compose up -d
