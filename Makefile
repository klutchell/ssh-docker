NS		:= klutchell
REPO	:= ssh
TAG		:= $$(git rev-parse --short HEAD)
IMG		:= ${NS}/${REPO}

build:
	@docker build -t ${IMG}:${TAG} .

build-rpi3:
	@docker build -t ${IMG}:rpi3-${TAG} -f Dockerfile.rpi3 .

build-nc:
	@docker build --no-cache -t ${IMG} .

build-rpi3-nc:
	@docker build --no-cache -t ${IMG}:rpi3-${TAG} -f Dockerfile.rpi3 .

push:
	@docker push ${IMG}:${TAG}

push-rpi3:
	@docker push ${IMG}:rpi3-${TAG}

release: build
	make push

release-rpi3: build-rpi3
	make push-rpi3

default: build

