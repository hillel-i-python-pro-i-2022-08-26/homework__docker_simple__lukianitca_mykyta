.PHONY: homework-i-run
# Just run homework
homework-i-run:
	@python show_message.py

.PHONY: d-homework-i-run
# Run homework with docker
d-homework-i-run:
	@make d-run

.PHONY: d-homework-i-purge
# Run homework with docker
d-homework-i-purge:
	@make d-purge

.PHONY: init-dev
# Install dependencies
init-dev:
	@pip install --upgrade pip && \
	pip install --requirement requirements.txt && \
	pre-commit install

.PHONY: pre-commit-run
# Run tools for files from commit.
pre-commit-run:
	@pre-commit run

.PHONY: pre-commit-run-all
# Run tools for all files.
pre-commit-run-all:
	@pre-commit run --all-files

.PHONY: d-run
# Build and run app
d-run:
	@COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 \
		docker-compose \
			up --build

.PHONY: d-purge
# Purge all related data
d-purge:
	@COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 \
		docker-compose \
			down --volumes --remove-orphans --rmi local --timeout 0