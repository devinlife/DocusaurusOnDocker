# Define Makefile variables for Docker compose commands
DC = docker compose

# Default target executed when no arguments are given to make.
default: up

# Target to start the docusaurus container
up:
	@echo "Starting Docusaurus container..."
	$(DC) up -d

# Target to stop the docusaurus container
down:
	@echo "Stopping Docusaurus container..."
	$(DC) down

# Target to rebuild the docusaurus container
build:
	@echo "Building Docusaurus container..."
	$(DC) build

# Target to view logs of the docusaurus container
logs:
	@echo "Viewing logs..."
	$(DC) logs -f

# Target to remove all containers, networks, and volumes
clean:
	@echo "Removing containers, networks, and volumes..."
	$(DC) down --volumes

# Target to remove the built docker images
clean-images:
	@echo "Removing Docker images..."
	docker rmi $(docker images 'docusaurus_*' -q) --force

# Target to enter the container's shell
shell:
	@echo "Entering the Docusaurus container shell..."
	$(DC) exec docusaurus /bin/sh

.PHONY: default up down build logs clean clean-images shell
