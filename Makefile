.EXPORT_ALL_VARIABLES:
.PHONY: setup up down

MAKEPATH := $(abspath $(lastword $(MAKEFILE_LIST)))
PWD := $(dir $(MAKEPATH))
INFO := '\033[0;34m' # Blue
NC :='\033[0m' # No Color


setup:
	@echo -e ${INFO} ------------- Running setup flow${NC}
	make setup-env

setup-env:
	@echo -e ${INFO} ------------- Setting up default enviroment values ${NC}
	$(PWD).bashrc/set-env.sh
	@echo -e ${INFO} ------------- Was created the .env file with default values to use your development enviroment ${NC}
	@cat .env
	
up:
	@echo -e ${INFO} ------------- Running docker-compose ${NC} 
	docker-compose up

down:
	docker-compose down

	
