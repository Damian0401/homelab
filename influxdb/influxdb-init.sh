#!/bin/sh
set -e

echo "Initializing InfluxDB..."

influx bucket create \
    --name "$DOCKER_INFLUXDB_SYSTEM_METRICS_BUCKET" \
    --retention 30d \
    --org "$DOCKER_INFLUXDB_INIT_ORG" \
    --token "$DOCKER_INFLUXDB_INIT_ADMIN_TOKEN"

echo "InfluxDB initialization complete."