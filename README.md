# deanturpin/asterisk

See the [Dockerfile](https://github.com/deanturpin/asterisk/blob/main/Dockerfile).

## Run from Docker Hub

```bash
docker run --rm -it --network=host deanturpin/asterisk
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

## Developing the container

Clone the repo, then just type `make` to build and run and container; but I quite like using `entr` to run the build process whenever a file changes.

```bash
ls * | entr -cr make
```
