# Makefile for Docker Compose commands

# Variables
COMPOSE_FILE = docker-compose.dev.yaml

# Targets
.PHONY: ps up down restart rm-orphans rm-volumes rm-images

ps:
	@echo "Processes:"
	docker compose -f $(COMPOSE_FILE) ps -a

up:
	@echo "Starting Docker Compose services..."
	docker compose -f $(COMPOSE_FILE) up -d

down:
	@echo "Stopping Docker Compose services..."
	docker compose -f $(COMPOSE_FILE) down

restart:
	@echo "Restarting Docker Compose services..."
	docker compose -f $(COMPOSE_FILE) down
	docker compose -f $(COMPOSE_FILE) up -d

rm-orphans:
	@echo "Removing orphan containers..."
	docker compose -f $(COMPOSE_FILE) down --remove-orphans

rm-volumes:
	@echo "Removing volumes..."
	docker compose -f $(COMPOSE_FILE) down -v

rm-images:
	@echo "Removing images..."
	docker compose -f $(COMPOSE_FILE) down --rmi all

help:
	@echo "Usage:"
	@echo "  make ps            - Show all containers"
	@echo "  make up            - Start Docker Compose services"
	@echo "  make down          - Stop Docker Compose services"
	@echo "  make restart       - Restart Docker Compose services"
	@echo "  make rm-orphans    - Remove orphan containers"
	@echo "  make rm-volumes    - Remove volumes"
	@echo "  make rm-images     - Remove images"
	@echo "  make help          - Display this help message"
