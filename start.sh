#!/bin/sh

# generate ssh key if one does not exist
if [ ! -f "/root/.ssh/id_rsa" ]
then
	ssh-keygen -N '' -f "/root/.ssh/id_rsa"
fi

# set permissions on ssh dir
chown -R root:root "/root/.ssh"
chmod -R 700 "/root/.ssh"

# generate ssh host keys
/usr/bin/ssh-keygen -A

# start ssh service
/usr/sbin/sshd -p 22 -D

