#!/bin/sh
set -e

# Grafana
mkdir -p ./grafana_data
chown -R 472:472 ./grafana_data

# InfluxDB
mkdir -p ./influxdb_data
chown -R 1000:1000 ./influxdb_data
chmod +x ./influxdb/influxdb-init.sh

# Dozzle
mkdir -p ./dozzle_data
if [ -f ./dozzle/dozzle.env ]; then
  export $(grep -v '^#' ./dozzle/dozzle.env | xargs)
fi
docker run -it --rm amir20/dozzle:v9.0.2 generate \
    "$DOZZLE_ADMIN_USERNAME" \
    --password "$DOZZLE_ADMIN_PASSWORD" \
    > ./dozzle_data/users.yaml

# Mosquitto
mkdir -p ./mosquitto_data/data ./mosquitto_data/log ./mosquitto_data/config
chown -R 1883:1883 ./mosquitto_data
chmod +x ./mosquitto/mosquitto-init.sh