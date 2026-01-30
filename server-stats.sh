#!/bin/bash

echo "=============================="
echo "   SERVER PERFORMANCE STATS"
echo "=============================="
echo ""

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

echo "CPU Usage: $CPU_USAGE %"
echo ""

MEM_TOTAL=$(free -m | awk 'NR==2{print$2}')
MEM_USED=$(free -m | awk 'NR==2 {print$3}')
MEM_FREE=$(free -m | awk 'NR==2 {print$4}')
MEM_PERCENT=$(awk "BEGIN {printf \"%.2f\", ($MEM_USED/$MEM_TOTAL)*100}")

echo "Memory Usage: "
echo "   Total: ${MEM_TOTAL}MB"
echo "   Used : ${MEM_USED}MB"
echo "   Free : ${MEM_FREE}MB"
echo "   Usage: ${MEM_PERCENT}%"
echo ""

DISK_USED=$(df -h / | awk 'NR==2{print $3}')
DISK_FREE=$(df -h / | awk 'NR==2{print $4}')
DISK_PERCENTAGE=$(df -h / | awk 'NR ==2{print $5}')

echo "Disk Usage (/): "
echo "   Used : $DISK_USED"
echo "   Free : $DISK_FREE"
echo "   Usage: $DISK_PERCENTAGE"
echo ""

echo "Top 5 Processes by Memory Usage: "
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
echo"" 

echo "Extra system info: "
echo "OS Version: " 
uname -a
echo ""
echo "Uptime: "
uptime
echo""
echo "Logged in users: "
who
