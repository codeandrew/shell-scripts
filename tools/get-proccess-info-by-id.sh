#! /bin/bash

read -p "Please enter the PID to be queried: " P

n=`ps -aux| awk '$2~/^'${P}'$/{print $0}'|wc -l`

if [ $n -eq 0 ];then
 echo "This PID does not exist！！"
 exit
fi
echo -e "\e[32m--------------------------------\e[0m"
echo "Process PID: ${P}"
echo "Process Commands：$(ps -aux| awk '$2~/^'$P'$/{for (i=11;i<=NF;i++) printf("%s ",$i)}')"
echo "The user to which the process belongs: $(ps -aux| awk '$2~/^'$P'$/{print $1}')"
echo "CPU Occupancy：$(ps -aux| awk '$2~/^'$P'$/{print $3}')%"
echo "Memory Occupancy：$(ps -aux| awk '$2~/^'$P'$/{print $4}')%"
echo "The time when the process started running：$(ps -aux| awk '$2~/^'$P'$/{print $9}')"
echo "Process run time：$(ps -aux| awk '$2~/^'$P'$/{print $10}')"
echo "Process Status：$(ps -aux| awk '$2~/^'$P'$/{print $8}')"
echo "Process Virtual Memory：$(ps -aux| awk '$2~/^'$P'$/{print $5}')"
echo "Process Shared Memory：$(ps -aux| awk '$2~/^'$P'$/{print $6}')"
echo -e "\e[32m--------------------------------\e[0m"
