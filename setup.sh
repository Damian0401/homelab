#!/bin/sh
set -e

# Grafana
mkdir -p ./grafana_data
sudo chown 472:472 ./grafana_data

# InfluxDB
mkdir -p ./influxdb_data
sudo chown 1000:1000 ./influxdb_data
chmod +x influxdb-init.sh