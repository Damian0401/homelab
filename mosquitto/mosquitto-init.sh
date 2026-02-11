#!/bin/sh
set -e

echo "Initializing Mosquitto..."

PASSFILE="/mosquitto/config/passwords"

if [ ! -f "$PASSFILE" ]; then
    mosquitto_passwd -c -b "$PASSFILE" "$MOSQUITTO_USERNAME" "$MOSQUITTO_PASSWORD"
else
    mosquitto_passwd -b "$PASSFILE" "$MOSQUITTO_USERNAME" "$MOSQUITTO_PASSWORD"
fi

echo "Mosquitto initialization complete."

exec mosquitto -c /mosquitto/config/mosquitto.conf