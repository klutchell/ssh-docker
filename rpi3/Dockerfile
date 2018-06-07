FROM resin/raspberrypi3-alpine:3.6

ARG SOURCE_BRANCH
ARG SOURCE_COMMIT
ARG SOURCE_TAG
ARG COMMIT_MSG
ARG DOCKER_REPO
ARG DOCKERFILE_PATH
ARG CACHE_TAG
ARG IMAGE_NAME
ARG BUILD_DATE
ARG VERSION

LABEL build_version="version: ${VERSION} build-date: ${BUILD_DATE}"
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
COPY start.sh VERSION ./

# run start script on boot
CMD ["/bin/sh", "start.sh"]

# end cross build
RUN [ "cross-build-end" ]

