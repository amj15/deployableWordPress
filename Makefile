# Variables
DOCKER_COMPOSE = docker-compose
APP_CONTAINER = wordpress
DB_CONTAINER = db
UID=$(shell id -u)
GID=$(shell id -g)

# Levantar los servicios (compila las imágenes si es necesario)
start:
	$(DOCKER_COMPOSE) up -d --remove-orphans

# Detener los servicios
down:
	$(DOCKER_COMPOSE) down

# Ver los logs de los servicios
logs:
	$(DOCKER_COMPOSE) logs -f

# Reconstruir las imágenes
build:
	$(DOCKER_COMPOSE) build

bash:
	$(DOCKER_COMPOSE) exec -u ${UID}:${GID} $(APP_CONTAINER) sh

docker-clean:
	docker-compose down --volumes --remove-orphans

# Mostrar ayuda
help:
	@echo "Comandos disponibles:"
	@echo "  make up                Levantar los servicios en segundo plano."
	@echo "  make down              Detener los servicios."
	@echo "  make logs              Ver logs de los servicios."
	@echo "  make build             Reconstruir las imágenes."
	@echo "  make bash  			Abre la consola del contenedor de Wordpress."