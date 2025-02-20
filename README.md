# deanturpin/asterisk

See the [Dockerfile](https://github.com/deanturpin/asterisk/blob/main/Dockerfile).

## Run from Docker Hub

```bash
docker run --rm -it --network=host deanturpin/asterisk
```

## Checking your ports are open

```bash
$ watch -d -n .5 'ss -an | grep 5060'

Every 0.5s: ss -an | grep 5060                              dev: Thu Feb 20 12:53:31 2025                                                                dev: Thu Feb 20 12:53:27 2025025

udp   UNCONN    0      0
                0.0.0.0:5060                0.0.0.0:*
```

## Finding your endpoints

Use Wireshark or try runnning [deanturpin/shh](https://hub.docker.com/r/deanturpin/shh) for a network summary.

```bash
docker run -it --rm --network=host deanturpin/shh
```

## Show peers in Asterisk

Using the CLI tool `rasterisk`.

```bash
docker-desktop*CLI> sip show peers
Name/username             Host                                    Dyn Forcerport Comedia    ACL Port     Status      Description                      
101                       (Unspecified)                            D  Auto (No)  No             0        UNKNOWN                                      
102                       (Unspecified)                            D  Auto (No)  No             0        UNKNOWN                                      
103                       (Unspecified)                            D  Auto (No)  No             0        UNKNOWN                                      
104                       (Unspecified)                            D  Auto (No)  No             0        UNKNOWN                                      
4 sip peers [Monitored: 0 online, 4 offline Unmonitored: 0 online, 0 offline]
docker-desktop*CLI> 
```

## Overriding the secret

Clearly leaving the password as default is a bit of a security hole so you can override it a run time with something unique to your host.

```bash
docker run --rm -it --network=host -v /etc/machine-id:/app/SECRET asterisk
```

## Developing the container

Clone the repo, then just type `make` to build and run and container; but I quite like using `entr` to run the build process whenever a file changes.

```bash
ls * | entr -cr make
```
