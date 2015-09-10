.PHONY: all build docker-image docker-push

all: build docker-image docker-push

build:
	go get -v -d
	CGO_ENABLED=0 go build -a -installsuffix cgo -ldflags '-s' -o main

docker-image:
	docker build -t brimstone/static .

docker-push:
	docker login -e="$DOCKER_EMAIL" -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
	docker push brimstone/static
