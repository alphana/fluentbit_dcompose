.PHONY: help build up start down destroy stop restart logs logs-api ps login-timescale login-api db-shell
#help:
#	make -pRrq  -f $(THIS_FILE) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

up-all:
	docker-compose -f ./kafka/docker-compose.yml up -d &&\
	docker-compose -f ./fluentbit/docker-compose.yml up -d &&\
	docker-compose -f ./LogGen/docker-compose.yml up -d
#up-one:
#	docker-compose -f ./$(c)/docker-compose.yml up -d

down-all:
	docker-compose -f ./kafka/docker-compose.yml down  &&\
	docker-compose -f ./fluentbit/docker-compose.yml down  &&\
	docker-compose -f ./LogGen/docker-compose.yml down

#down-all:
#	docker-compose -f docker-compose.yml down $(c)
#destroy:
#	docker-compose -f docker-compose.yml down -v $(c)