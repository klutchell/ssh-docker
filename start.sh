#!/bin/sh

# generate ssh key if one does not exist
if [ ! -f "/root/.ssh/id_rsa" ]
then
	ssh-keygen -q -N '' -f "/root/.ssh/id_rsa"
fi

# generate ssh host keys
/usr/bin/ssh-keygen -A

# if a github username was provided and authorized_keys does not exist
if [ -n "${GITHUB_USER}" ] && [ ! -e "/root/.ssh/authorized_keys" ]
then
	curl "https://github.com/${GITHUB_USER}.keys" > "/root/.ssh/authorized_keys"
fi

# set permissions on ssh dir
chown -R root:root "/root/.ssh"
chmod -R 700 "/root/.ssh"

# start sshd service
if [ "${INITSYSTEM}" != "on" ]
then
	# start sshd service in foreground
	/usr/sbin/sshd -p 22 -D
else
	# start sshd with openrc
	rc-service sshd start
fi
