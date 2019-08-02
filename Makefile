VERSION_FILE = VERSION

VERSION = $(shell cat version.go | grep "const VERSION" | awk '{print "v" $$NF}' | sed 's/"//g')

ifeq ($(VERSION),)
$(error VERSION is not set)
endif


DOCKER_REPOSITORY = inspectorio
CONTAINER_NAME = oauth2-proxy

.PHONY: build push

build:
	docker build -f Dockerfile -t $(DOCKER_REPOSITORY)/$(CONTAINER_NAME):$(VERSION) .

push:
	docker push $(DOCKER_REPOSITORY)/$(CONTAINER_NAME):$(VERSION)
