FROM ubuntu:noble

# Focal needs this to avoid timezone configuration
ENV DEBIAN_FRONTEND=noninteractive

# Install Asterisk and dependencies
RUN apt update && \
    apt full-upgrade --yes && \
    apt install --yes asterisk iproute2 iputils-ping && \
    apt clean distclean autoclean autoremove

# Copy repo into the container
WORKDIR /app
COPY . .

# Copy configuration files into installation directory
RUN cp sip.conf extensions.conf /etc/asterisk/

CMD if [ -s SECRET ]; then \
    sed -i "s/secret=.*/secret=$(cat SECRET)/" /etc/asterisk/sip.conf; \
    fi && \
    (asterisk -fp &) && \
    sleep 1 && \
    rasterisk
