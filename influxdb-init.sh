#!/bin/sh
set -e

echo "Initializing InfluxDB database..."

influx bucket create \
    --name system_metrics \
    --retention 30d \
    --org "$DOCKER_INFLUXDB_INIT_ORG" \
    --token "$DOCKER_INFLUXDB_INIT_ADMIN_TOKEN"