#!/bin/bash
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
METRICS_FILE="/root/metrics-data/metrics_$TIMESTAMP.txt"
NODE_EXPORTER_URL="http://node-exporter-prometheus-node-exporter.monitoring:9100/metrics"  # Replace with your actual service name and port
echo "Writing metrics to file $METRICS_FILE"
curl -s $NODE_EXPORTER_URL | grep -E 'node_memory_MemTotal_bytes|node_memory_MemFree_bytes|node_cpu_seconds_total|node_filesystem_avail_bytes' > $METRICS_FILE