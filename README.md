# deanturpin/asterisk

See the [Dockerfile](https://github.com/deanturpin/asterisk/blob/main/Dockerfile).

At __build__ time, example `sip.conf` and `extensions.conf` files are copied into the container; at __run__ time, the secret is replaced with the contents of the `SECRET` file (if not empty) and Asterisk is started. 

## Run from Docker Hub

```bash
docker run --rm -it --network=host deanturpin/asterisk
```

## Show peers

Using the CLI tool `rasterisk`.

```bash
docker exec -it <containerid> rasterisk
```

```bash
> sip show peers

Name/username             Host                                    Dyn Forcerport Comedia    ACL Port     Status      Description                      
101                       (Unspecified)                            D  Auto (No)  No             0        UNKNOWN                                      
102                       (Unspecified)                            D  Auto (No)  No             0        UNKNOWN                                      
103                       (Unspecified)                            D  Auto (No)  No             0        UNKNOWN                                      
104                       (Unspecified)                            D  Auto (No)  No             0        UNKNOWN                                      
4 sip peers [Monitored: 0 online, 4 offline Unmonitored: 0 online, 0 offline]
```

## Dump the config

To reveal the secrets.

```bash
!cat /etc/asterisk/sip.conf
```

## Override the secret

Clearly leaving the password as default is a bit of a security hole so you can override it a run time with something unique to your host.

```bash
docker run --rm -it --network=host -v /etc/machine-id:/app/SECRET asterisk
```

Equally, you could just map in your own `sip.conf` and `extensions.conf` files at run time.

## Develop the container

Clone the [repo](https://github.com/deanturpin/dev), then just type `make` to build and run and container locally.

## Tips and tricks

To assist with your network discovery.

```bash
# Start the container but just run bash
make bash

# Dump the network interfaces of the container without running Asterisk
make ip

# Find your endpoints
docker run -it --rm --network=host deanturpin/shh

# Check your ports are open
ss -an | grep 5060
```
