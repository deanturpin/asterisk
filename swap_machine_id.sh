#!/bin/bash

echo "Current machine ID: '$(cat /etc/machine-id)'"

if [ ! -s /etc/machine-id ]; then
    echo "Creating a fake machine ID"
    machine_id=$(uuidgen)
    echo $machine_id > /etc/machine-id
fi

echo Using machine ID: $(cat /etc/machine-id)

sip_conf="/etc/asterisk/sip.conf"
machine_id=$(cat /etc/machine-id)

if grep -q "secret=" "$sip_conf"; then
    sed -i "s/secret=.*/secret=$machine_id/" "$sip_conf"
else
    echo "secret=$machine_id" >> "$sip_conf"
fi

echo "Updated SIP configuration with new machine ID as password"
