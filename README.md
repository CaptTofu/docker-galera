Role Name
========

docker-galera -- Tools to help you run a docker container and provision it with ansible using the ansible-galera role (ansible galaxy) and the cluster-install ansible repository  

Requirements
------------

* Docker
* Ansible
* ansible-galera
* ansible-galera-haproxy
* cluster-install

Role Variables
--------------

percona 

Dependencies
------------

None

License
-------

Apache 2.0

Connecting to SSH 
-----------------

ssh -i docker-galera-insecure-key 172.17.0.X -l root 

Author Information
------------------

Patrick "CaptTofu" Galbraith <patg@hp.com> <patg@patg.net>

How do I use this?
------------------

1. If you are working in cluster-install repo:

    ../docker-galera/docker-launch-nodes.sh

2. At this point you now have 4 containers running:
  - 3 percona xtradb cluster nodes
  - 1 haproxy node

3. You have a hosts file that you will specify when you run ansible. See the README in the cluster-install repo
