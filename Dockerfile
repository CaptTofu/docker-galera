# ubuntu_ssh
#
# VERSION    0.0.1

#use the ubuntu 13.04 base image
FROM ubuntu:13.04 
MAINTAINER Patrick aka CaptTofu Galbraith , patg@patg.net

# Update distribution
RUN apt-get update \
      && apt-get upgrade -y \
      && apt-get clean

RUN apt-get install -y ssh vim

RUN mkdir /var/run/sshd
RUN mkdir /root/.ssh
RUN chmod 700 /root/.ssh

# upstart and sshd don't play well on docker
Add start_services.sh /usr/local/sbin/start_services.sh

ADD docker-galera-insecure-key.pub /root/.ssh/authorized_keys
RUN chown -R root:root /root/.ssh
RUN chmod 0700 /root/.ssh
RUN chmod 0600 /root/.ssh/authorized_keys

# Fix upstart (at least for mysqld) 
RUN dpkg-divert --local --rename --add /sbin/initctl

# mysql upstart service requires this
RUN ln -s /proc/mounts /etc/mtab

# Expose ssh, mysql, galera replication and SST
EXPOSE 22 3306 4444 4567 4568 9200

ENTRYPOINT ["/usr/local/sbin/start_services.sh"]
