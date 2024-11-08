# Makefile to build and deploy Docker for GitHub Pages

# Variables
docker_image_name := github-pages-local
docker_container_name := github-pages-container
port := 4000

# Build the Docker image
build:
	docker build -t $(docker_image_name) .

# Run the Docker container
run:
	docker run -d -p $(port):$(port) -v $(shell pwd):/usr/src/app --name $(docker_container_name) $(docker_image_name)

# Stop the Docker container
stop:
	docker stop $(docker_container_name) || true

# Deploy (build and run)
deploy: build run

# Clean up Docker resources (images and containers)
clean:
	docker rm $(docker_container_name) || true
	docker rmi $(docker_image_name) || true

# Delete (stop and clean)
delete: stop clean

# Interactive shell into the running container
interactive:
	docker exec -it $(docker_container_name) /bin/sh

.PHONY: build run stop deploy clean interactive
