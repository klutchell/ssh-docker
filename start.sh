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

# start sshd service
if [ "${INITSYSTEM}" != "on" ]
then
	# start sshd service in foreground
	/usr/sbin/sshd -p 22 -D
else
	# start sshd with openrc
	rc-service sshd start
fi
