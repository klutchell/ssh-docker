FROM resin/raspberrypi3-alpine:3.6

LABEL maintainer="kylemharding@gmail.com"

# allow building on x86
RUN [ "cross-build-start" ]

# install git, openssh, and rsync
RUN apk add --no-cache \
	openssh \
	rsync \
	tzdata

# adjust sshd config
RUN sed -i \
	-e 's/#PasswordAuthentication yes/PasswordAuthentication no/' \
	-e 's/#GatewayPorts no/GatewayPorts yes/' \
	/etc/ssh/sshd_config

# store ssh data in a volume
VOLUME /root/.ssh

# prevent caching known hosts
RUN echo -e "Host *\n\
	StrictHostKeyChecking no\n\
	UserKnownHostsFile /dev/null" \
	> /root/.ssh/config

# copy src files
WORKDIR /usr/src/app
COPY . /usr/src/app/

# run start script on boot
CMD ["/bin/sh", "start.sh"]

# end cross build
RUN [ "cross-build-end" ]

