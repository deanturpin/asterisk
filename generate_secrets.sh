#!/bin/bash

# Generate unique SIP secrets based on machine ID and hostname

get_machine_id() {
    case "$(uname -s)" in
        Darwin)
            # macOS - use hardware UUID
            system_profiler SPHardwareDataType | grep "Hardware UUID" | awk '{print $3}'
            ;;
        Linux)
            # Linux - use machine-id
            cat /etc/machine-id 2>/dev/null || cat /var/lib/dbus/machine-id 2>/dev/null
            ;;
        *)
            echo "Unsupported OS" >&2
            exit 1
            ;;
    esac
}

HOSTNAME=$(hostname)
MACHINE_ID=$(get_machine_id)

if [ -z "$MACHINE_ID" ]; then
    echo "Could not determine machine ID" >&2
    exit 1
fi

echo "Hostname: $HOSTNAME"
echo "Machine ID: $MACHINE_ID"
echo

# Generate secrets for SIP peers 101-104
for peer in 101 102 103 104; do
    # Combine hostname, machine ID, and peer number, then hash with SHA-256
    secret=$(echo "${HOSTNAME}:${MACHINE_ID}:${peer}" | shasum -a 256 | cut -d' ' -f1)
    echo "Peer $peer secret: $secret"
done