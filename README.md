# deanturpin/asterisk

See the [Dockerfile](https://github.com/deanturpin/asterisk/blob/main/Dockerfile).

## Run from Docker Hub

```bash
docker run --rm -it --network=host deanturpin/asterisk
```

At container build time, the passwords in the SIP config are swapped out with the machine ID of the host. An example of a single peer secret is displayed briefly on startup.

This is quite an unweildy password so there is an assumption you have a web interface to your endpoint!

```text
[101]
type=friend
host=dynamic
secret=c9ffcf9c-f30a-497e-9688-4cb3a6003d22
```

## Specifing your own password

You can run this container on an isolated network, but if it's public then there is a chance a malevolent sprite could guess the password. Therefore, when you launch the container, you can map in your own machine ID file or password of your choice using the -v flag.

```bash
docker run --rm -it --network=host -v /etc/machine-id:/etc/machine-id deanturpin/asterisk
```

## Developing the container

Clone the repo, then just type `make` to build and run and container; but I quite like using `entr` to run the build process whenever a file changes.

```bash
ls * | entr -cr make
```
