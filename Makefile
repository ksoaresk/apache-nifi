serve:
	@docker-compose -f ./docker-compose.yaml up

build-and-serve:
	@docker-compose -f ./docker-compose.yaml up --build

shell:
	@docker-compose -f ./docker-compose.yaml exec apache-nifi bash

copy-to-nifi:
	@if [ -z "$(strip $(filter-out $@, $(MAKECMDGOALS)))" ]; then \
		echo "❌ Você precisa passar o caminho do arquivo: make copy-to-nifi ./caminho/arquivo.txt"; \
		exit 1; \
	fi && \
	docker cp $(filter-out $@, $(MAKECMDGOALS)) $$(docker-compose -f ./docker-compose.yaml ps -q apache-nifi):/data/nifi-dados/

%:
	@true
