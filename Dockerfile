FROM ubuntu:devel

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt full-upgrade --yes && \
    apt install --yes asterisk iproute2

COPY sip.conf /etc/asterisk/
COPY extensions.conf /etc/asterisk/

CMD (asterisk -fp &) && \
    sleep 1 && \
    rasterisk
