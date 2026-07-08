#!/bin/bash

LOGFILE="health_report_$(date +%F_%H-%M-%S).log"

{
echo "======================================="
echo "      SYSTEM HEALTH REPORT"
echo "======================================="
echo "Hostname : $(hostname)"
echo "Date     : $(date)"
echo "Uptime   : $(uptime -p)"
echo ""

echo "========== CPU Load =========="
uptime

echo ""
echo "========== Memory Usage =========="
free -h

echo ""
echo "========== Disk Usage =========="
df -h

echo ""
echo "========== Top 5 Memory Processes =========="
ps -eo pid,comm,%mem,%cpu --sort=-%mem | head -6

echo ""
echo "========== Logged In Users =========="
who

echo ""
echo "========== Network Interfaces =========="
ip -brief addr

echo ""
echo "========== Report Complete =========="
} | tee "$LOGFILE"

echo ""
echo "Report saved as: $LOGFILE"