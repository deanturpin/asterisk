FROM ubuntu:devel

# Install Asterisk and dependencies
RUN apt update && \
    apt full-upgrade --yes && \
    apt install --yes asterisk iproute2 uuid-runtime

WORKDIR /app
COPY . .

# Copy configuration files into installation directory
RUN cp sip.conf extensions.conf /etc/asterisk/ && \
    bash swap_machine_id.sh

CMD cat /etc/os-release && \
    grep -m 1 -B 3 "secret=" /etc/asterisk/sip.conf && \
    sleep 10 && \
    (asterisk -fp &) && \
    sleep 1 && \
    rasterisk
