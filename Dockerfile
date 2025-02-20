FROM ubuntu:focal

# Focal needs this to avoid timezone configuration
ENV DEBIAN_FRONTEND=noninteractive

# Install Asterisk and dependencies
RUN apt update && \
    apt full-upgrade --yes && \
    apt install --yes asterisk

WORKDIR /app
COPY . .

# Copy configuration files into installation directory
RUN cp sip.conf extensions.conf /etc/asterisk/ 

CMD (asterisk -fp &) && \
    sleep 1 && \
    rasterisk
