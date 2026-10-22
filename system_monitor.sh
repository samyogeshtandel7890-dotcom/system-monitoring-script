#!/bin/bash

# System Monitoring and Alerting Script

DISK_LIMIT=80
MEMORY_LIMIT=80
LOG_FILE="system_monitor.log"

# Display report heading
echo "======================================"
echo "       SYSTEM MONITORING REPORT"
echo "======================================"

# Log messages with timestamps
log_message() {
    local MESSAGE="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $MESSAGE" | tee -a "$LOG_FILE"
}

log_message "System monitoring started"

# Check disk usage
DISK=$(df -P / | awk 'NR==2 {gsub("%","",$5); print $5}')

echo ""
echo "Disk Usage: ${DISK}%"

if [ "$DISK" -ge "$DISK_LIMIT" ]; then
    log_message "WARNING: Disk usage is high at ${DISK}%"
else
    log_message "OK: Disk usage is normal at ${DISK}%"
fi

# Check memory usage
MEMORY=$(free -b | awk '/^Mem:/ {
    if ($2 > 0)
        printf "%.0f", (($2 - $7) / $2) * 100;
    else
        print 0
}')

echo ""
echo "Memory Usage: ${MEMORY}%"

if [ "$MEMORY" -ge "$MEMORY_LIMIT" ]; then
    log_message "WARNING: Memory usage is high at ${MEMORY}%"
else
    log_message "OK: Memory usage is normal at ${MEMORY}%"
fi

# Display top five CPU-consuming processes
echo ""
echo "Top 5 CPU-Consuming Processes:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

# Display top five memory-consuming processes
echo ""
echo "Top 5 Memory-Consuming Processes:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

# Finish monitoring
echo ""
log_message "System monitoring completed"

echo "======================================"
echo "Monitoring report completed."
echo "Log file: $LOG_FILE"
echo "======================================"
