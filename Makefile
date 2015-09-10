.PHONY: build push

build:
	docker build -t brimstone/static .

push:
	docker login -e="$DOCKER_EMAIL" -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
	docker push brimstone/static
