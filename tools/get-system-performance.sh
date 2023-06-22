#!/bin/bash

# Physical Memory Usage
mem_used=$(free -m | grep Mem | awk '{print$3}')

# Total physical memory
mem_total=$(free -m | grep Mem | awk '{print$2}')

# cpu cores
cpu_num=$(lscpu  | grep 'CPU(s)' | awk 'NR==1 {print$2}')

# Average load
load_average=$(uptime  | awk -F : '{print$5}')

# CPU utilization of user state
cpu_us=$(top -d 1 -n 1 | grep Cpu | awk -F',' '{print $1}' | awk '{print $(NF-1)}')

# CPU utilization of kernel state
cpu_sys=$(top -d 1 -n 1 | grep Cpu | awk -F',' '{print $2}' | awk '{print $(NF-1)}')

# CPU usage for waiting I/O
cpu_wa=$(top -d 1 -n 1 | grep Cpu | awk -F',' '{print $5}' | awk '{print $(NF-1)}')

# CPU usage for handling hard interrupts
cpu_hi=$(top -d 1 -n 1 | grep Cpu | awk -F',' '{print $6}' | awk '{print $(NF-1)}')

# CPU usage for handling soft interrupts
cpu_si=$(top -d 1 -n 1 | grep Cpu | awk -F',' '{print $7}'| awk '{print $(NF-1)}')

echo -e "The physical memory usage (M) is：${mem_used}"
echo -e "The total amount of physical memory (M) is：${mem_total}"
echo -e "The number of cpu cores is：${cpu_num}"
echo -e "The average load is：${load_average}"
echo -e "The CPU usage of the user state is：${cpu_us}"
echo -e "The CPU utilization of the kernel state is：${cpu_sys}"
echo -e "The CPU usage for waiting I/O is：${cpu_wa}"
echo -e "The CPU usage for handling hard interrupts is：${cpu_hi}"
echo -e "The CPU usage for handling soft interrupts is：${cpu_si}"
