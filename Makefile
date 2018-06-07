
DOCKER_REPO		:= klutchell/ssh
ARCH			:= armhf
VERSION			:= $$(cat ./VERSION)
BUILD_DATE		:= $$(date -u +"%Y-%m-%dT%H:%M:%SZ")
IMAGE_NAME		:= ${DOCKER_REPO}:${TARGET}-${VERSION}
DOCKERFILE_PATH	:= ./${TARGET}/Dockerfile

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

build-nc:
	@docker build --no-cache
	--build-arg "VERSION=${VERSION}" \
	--build-arg "BUILD_DATE=${BUILD_DATE}" \
	--tag ${IMAGE_NAME} \
	--file ${DOCKERFILE_PATH} \
	.

tag:
	@git tag ${VERSION} -m "tagging build ${VERSION}"
	git push --tags

push:
	docker push ${IMAGE_NAME}

release: bump
	make build push

