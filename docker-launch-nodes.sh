#!/bin/bash

for node in 1 2 3; 
do
  docker run -d -name=galera_node${node} capttofu/ubuntu_ssh
done

echo [galera_cluster] > hosts
for node in 1 2 3;
do
  echo `docker inspect galera_node${node}|grep -i ipadd| awk '{print $2}'| sed -e 's/[",]//g'` >> hosts
done

docker run -d -name=haproxy capttofu/ubuntu_ssh
echo "" >> hosts
echo [haproxy] >> hosts
echo `docker inspect haproxy|grep -i ipadd| awk '{print $2}'| sed -e 's/[",]//g'` >> hosts
