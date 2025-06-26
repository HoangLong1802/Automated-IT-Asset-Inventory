#!/usr/bin/env bash
# Chạy script Python và đẩy log
LOGFILE="logs/linux_inventory.log"
mkdir -p logs

echo "$(date -Iseconds) Starting inventory" >> "$LOGFILE"
python3 inventory_linux.py 2>&1 | tee -a "$LOGFILE"
echo "$(date -Iseconds) Done" >> "$LOGFILE"
