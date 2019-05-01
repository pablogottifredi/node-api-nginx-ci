.EXPORT_ALL_VARIABLES:
.PHONY: build watch down clean 

MAKEPATH := $(abspath $(lastword $(MAKEFILE_LIST)))
PWD := $(dir $(MAKEPATH))
INFO := '\033[0;34m' # Blue
NC :='\033[0m' # No Color
include .env

build:
	@echo -e ${INFO} ------------- Running build flow${NC}
	yarn install
	yarn build
	docker-compose -f docker-compose.yml up --build 

watch:
	@echo -e ${INFO} ------------- Running docker-compose ${NC} 
	docker-compose -f docker-compose.yml -f docker-compose-dev.yml up

down:
	docker-compose down

clean:
	#todo
	@echo TODO

