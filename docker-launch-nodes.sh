#!/bin/bash

#allow runtime override without need for getopt
[[ -z "$1" ]] && IMAGE=unbuntu:13.04 || IMAGE=$1

for node in 1 2 3; 
do
  docker run -d -name=pxc${node} $IMAGE
done

echo [galera_cluster] > hosts
for node in 1 2 3;
do
  echo `docker inspect galera_node${node}|grep -i ipadd| awk '{print $2}'| sed -e 's/[",]//g'` >> hosts
done

docker run -d -name=haproxy $IMAGE
echo "" >> hosts
echo [haproxy] >> hosts
echo `docker inspect haproxy|grep -i ipadd| awk '{print $2}'| sed -e 's/[",]//g'` >> hosts
