FROM resin/raspberrypi3-alpine

# allow building on x86
RUN [ "cross-build-start" ]

# set timezone
RUN apk add --no-cache tzdata

# install git, openssh, and rsync
RUN apk add --no-cache \
	openssh \
	rsync

# adjust sshd config
RUN sed -i \
	-e 's/#PasswordAuthentication yes/PasswordAuthentication no/' \
	-e 's/#GatewayPorts no/GatewayPorts yes/' \
	/etc/ssh/sshd_config

# store ssh data in a volume
VOLUME /root/.ssh

# install start script
COPY start.sh /usr/bin/start.sh

# run start script to generate keys if required
CMD [ "/usr/bin/start.sh" ]

# end cross build
RUN [ "cross-build-end" ]

