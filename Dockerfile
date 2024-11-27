FROM ubuntu:devel

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt full-upgrade --yes && \
    apt install --yes asterisk

CMD (asterisk -fp &) && \
    sleep 4 && \
    rasterisk
