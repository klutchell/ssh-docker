
.DEFAULT_GOAL := build

bump:
	@docker run --rm -v "${PWD}":/app treeder/bump patch

build:
	./hooks/build

build-nc:
	./hooks/build --no-cache

tag:
	./hooks/tag

push:
	./hooks/push

release: bump build push

