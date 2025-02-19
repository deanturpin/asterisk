all:
	docker build -t deanturpin/asterisk .
	docker run --rm -it --network=host deanturpin/asterisk
