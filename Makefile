all: build
	docker run --rm -it --network=host asterisk

build:
	docker build -t asterisk .

bash: build
	docker run --rm -it --network=host asterisk bash

ip: build
	docker run --rm -it --network=host asterisk ip -brief addr
