
DOCKER_REPO		:= klutchell/ssh
ARCH			:= armhf
VERSION			:= $$(cat ./VERSION)
BUILD_DATE		:= $$(date -u +"%Y-%m-%dT%H:%M:%SZ")
IMAGE_NAME		:= ${DOCKER_REPO}:${ARCH}-${VERSION}
LATEST_NAME		:= ${DOCKER_REPO}:${ARCH}-latest
DOCKERFILE_PATH	:= ./${ARCH}/Dockerfile

.DEFAULT_GOAL	:= build

bump:
	@docker run --rm -v "${PWD}":/app treeder/bump patch

build:
	@docker build \
	--build-arg "VERSION=${VERSION}" \
	--build-arg "BUILD_DATE=${BUILD_DATE}" \
	--tag ${IMAGE_NAME} \
	--file ${DOCKERFILE_PATH} \
	.
	@docker tag ${IMAGE_NAME} ${LATEST_NAME}

build-nc:
	@docker build --no-cache
	--build-arg "VERSION=${VERSION}" \
	--build-arg "BUILD_DATE=${BUILD_DATE}" \
	--tag ${IMAGE_NAME} \
	--file ${DOCKERFILE_PATH} \
	.
	@docker tag ${IMAGE_NAME} ${LATEST_NAME}

push:
	@docker push ${IMAGE_NAME}

release: bump build push

