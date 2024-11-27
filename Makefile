all:
	docker build -t deanturpin/asterisk .
	docker run --rm -it -p 5060:5060/udp -p 5060:5060/tcp deanturpin/asterisk
