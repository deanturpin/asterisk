all:
	docker build -t asterisk .
	docker run --rm -it --network=host asterisk
