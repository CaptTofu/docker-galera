#!/bin/bash

# this is a convenience script to start various services on 
# the Percona XtraDB Cluster (Galera) container
# this starts mysqld and sshd. 
# NOTE: upstart doesn't work with ssh on this container
# hence why manual evocation is used
if test -d /etc/mysql;
then
    /etc/init.d/mysql start  
fi
/usr/sbin/sshd -D $@
