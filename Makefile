serve:
	docker-compose -f ./docker-compose.yaml up

build-and-serve:
	docker-compose -f ./docker-compose.yaml up --build
