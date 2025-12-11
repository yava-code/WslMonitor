#!/bin/bash



# colors(just for fun, i was bored)

RED='\033[0;31m'

GREEN='\033[0;32m'

CYAN='\033[0;36m'

GREY='\033[1;30m'

NC='\033[0m' # No Color



clear

echo -e "${GREY}========================================${NC}"

echo -e "   WSL SYSTEM DIAGNOSTIC   "

echo -e "${GREY}========================================${NC}"

echo ""



# check kernel, and if it wsl or normal linux

echo -e "[*] System Info:"

KERNEL=$(uname -r)

if grep -q "microsoft" /proc/version; then

    ENV_TYPE="WSL (Windows Subsystem for Linux)"

else

    ENV_TYPE="Native Linux"

fi

echo -e "    Kernel: ${CYAN}$KERNEL${NC}"

echo -e "    Environment: ${CYAN}$ENV_TYPE${NC}"

echo ""



# uptime of our subsystem

echo -e "[*] Uptime:"

UPTIME=$(uptime -p)

echo -e "    $UPTIME"

echo ""



# our ram size

echo -e "[*] Memory Status (Allocated to WSL):"

MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')

MEM_USED=$(free -m | grep Mem | awk '{print $3}')

# simple math, just division used memory on total mem

PERCENT=$(( 100 * MEM_USED / MEM_TOTAL ))



echo -e "    Used: ${RED}${MEM_USED}MB${NC} / Total: ${GREEN}${MEM_TOTAL}MB${NC} ($PERCENT%)"

echo ""



# checking drive, wsl has its own

echo -e "[*] Disk Usage (Virtual Drive):"

DISK_USAGE=$(df -h / | grep / | awk '{print $5 " used of " $2}')

echo -e "    ${RED}$DISK_USAGE${NC}"

echo ""



# lets see top 5 processes inside wsl

echo -e "[*] Top Heavy Processes inside WSL:"

echo -e "${GREY}    PID    COMMAND${NC}"

ps -eo pid,comm,%cpu --sort=-%cpu | head -n 4 | awk 'NR>1 {print "    "$1"   "$2}'



echo ""

echo -e "${GREY}========================================${NC}"
