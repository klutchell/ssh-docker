NS		:= klutchell
REPO	:= ssh
TAG		:= $$(git rev-parse --short HEAD)
IMG		:= ${NS}/${REPO}

build:
	@docker build -t ${IMG}:${TAG} .
	@docker tag ${IMG}:${TAG} ${IMG}:latest

build-rpi3:
	@docker build -t ${IMG}:rpi3-${TAG} -f Dockerfile.rpi3 .
	@docker tag ${IMG}:rpi3-${TAG} ${IMG}:rpi3-latest

build-nc:
	@docker build --no-cache -t ${IMG} .
	@docker tag ${IMG}:${TAG} ${IMG}:latest

build-rpi3-nc:
	@docker build --no-cache -t ${IMG}:rpi3-${TAG} -f Dockerfile.rpi3 .
	@docker tag ${IMG}:rpi3-${TAG} ${IMG}:rpi3-latest

push:
	@docker push ${IMG}:${TAG}
	@docker push ${IMG}:latest

push-rpi3:
	@docker push ${IMG}:rpi3-${TAG}
	@docker push ${IMG}:rpi3-latest

release: build tag push

release-rpi3: build-rpi3 push-rpi3

rpi3: build-rpi3

default: build

