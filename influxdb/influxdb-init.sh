#!/bin/sh
set -e

echo "Initializing InfluxDB..."

if ! influx bucket list \
    --org "$DOCKER_INFLUXDB_INIT_ORG" \
    --host http://influxdb:8086 \
    --token "$DOCKER_INFLUXDB_INIT_ADMIN_TOKEN" | grep -q "$DOCKER_INFLUXDB_SYSTEM_METRICS_BUCKET"; then
    influx bucket create \
        --name "$DOCKER_INFLUXDB_SYSTEM_METRICS_BUCKET" \
        --retention 30d \
        --org "$DOCKER_INFLUXDB_INIT_ORG" \
        --host http://influxdb:8086 \
        --token "$DOCKER_INFLUXDB_INIT_ADMIN_TOKEN"
fi

if ! influx bucket list \
    --org "$DOCKER_INFLUXDB_INIT_ORG" \
    --host http://influxdb:8086 \
    --token "$DOCKER_INFLUXDB_INIT_ADMIN_TOKEN" | grep -q "$DOCKER_INFLUXDB_SENSORS_BUCKET"; then
    influx bucket create \
        --name "$DOCKER_INFLUXDB_SENSORS_BUCKET" \
        --retention 90d \
        --org "$DOCKER_INFLUXDB_INIT_ORG" \
        --host http://influxdb:8086 \
        --token "$DOCKER_INFLUXDB_INIT_ADMIN_TOKEN"
fi

echo "InfluxDB initialization complete."