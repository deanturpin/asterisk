all:
	docker build -t deanturpin/asterisk .
	# docker run --rm -it -p 5060:5060/udp -p 5060:5060/tcp -p 10000-20000:10000-20000/udp --net=my-custom-network --ip=10.9.160.60 deanturpin/asterisk
	# docker run --rm -it -p 5060:5060/udp -p 5060:5060/tcp --net=my-custom-network --ip=10.9.160.57 deanturpin/asterisk
	# docker run --rm -it --network=host deanturpin/asterisk
	docker run --rm -it --net=my-custom-network --ip=10.9.160.58 deanturpin/asterisk
