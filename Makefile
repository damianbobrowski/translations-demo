CURR_PATH = $(shell pwd)
APP_NAME = $(shell echo "creoox-translations")

#################################################
###           Development Environment         ###
#################################################
.PHONY: build-dev-env run-dev-env attach-dev-env run-unit-tests run-ut-coverage-html down-dev-env dump-qraphql-schema

# Build dev instance on your local machine
build-dev-env:
	@docker-compose \
 		--project-name $(APP_NAME) \
 		build
	@echo "[DEV-INFO] DEV instance(s) were successfully built!"

# Run DEV instance
run-dev-env:
	@docker-compose up \
		--detach
	@echo "[DEV-INFO] DEV instance(s) were successfully started! Launch may take a while...."
	@echo "[DEV-INFO] You can monitor container(s) by executing: make attach-dev-env"

# Attach DEV instance to follow the logs
attach-dev-env:
	@docker-compose logs \
		--tail 1000 \
		--follow

# Stop and clear DEV instance
down-dev-env:
	@docker-compose down --remove-orphans
	@echo "[DEV-INFO] DEV instance(s) were successfully downed."

