NAME	:= $$(git config --get remote.origin.url | sed -r 's/.*:(.+)\.git/\1/')
TAG		:= $$(git rev-parse --short HEAD)
IMG		:= ${NAME}:${TAG}
LATEST	:= ${NAME}:latest

build:
	@docker build -t ${IMG} .
	@docker tag ${IMG} ${LATEST}

build-nc:
	@docker build --no-cache -t ${IMG} .
	@docker tag ${IMG} ${LATEST}

push:
	@docker push ${NAME}
