FROM alpine:3.6

ARG BUILD_DATE
ARG BUILD_VERSION

LABEL build_version="${BUILD_VERSION}"
LABEL build_date="${BUILD_DATE}"
LABEL maintainer="kylemharding@gmail.com"

# install openssh and tzdata
RUN apk add --no-cache openssh tzdata curl

# persist ssh data
VOLUME /root/.ssh

# disable password auth
RUN sed -i \
	-e 's/#PasswordAuthentication yes/PasswordAuthentication no/' \
	/etc/ssh/sshd_config

# prevent caching known hosts
RUN echo -e "Host *\n\
	StrictHostKeyChecking no\n\
	UserKnownHostsFile /dev/null" \
	> /root/.ssh/config

# work in app dir
WORKDIR /usr/src/app

# copy src files
COPY start.sh ./

# run start script on boot
CMD ["/bin/sh", "start.sh"]
