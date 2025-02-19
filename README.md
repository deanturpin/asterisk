# deantoni/asterisk

## Build

Use GNU Make to build and run locally.

```bash
make
```

## Run from Docker Hub

```bash
docker run --rm -it --network=host deanturpin/asterisk
```

On startup the passwords in the SIP config are swapped out with the machine ID of the host. An example of a single peer secret is displayed briefly on startup.

```text
[101]
type=friend
host=dynamic
secret=c9ffcf9c-f30a-497e-9688-4cb3a6003d22
```

## Developing the container

Clone the repo, then just type `make` to build and run and container; but I quite like using `entr` to run the build process whenever a file changes.

```bash
ls * | entr -cr make
```
