#! /bin/bash

read -p "Please enter the name of the process to be queried：" NAME

N=`ps -aux | grep $NAME | grep -v grep | wc -l` ## Count the total number of processes

if [ $N -le 0 ];then
  echo "The process name is not running！"
fi
i=1
while [ $N -gt 0 ]
do
  echo -e "\e[32m***************************************************************\e[0m"
  echo "Process PID: $(ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}'| awk '{print $2}')"
  echo "Process Commands：$(ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}'| awk '{for (j=11;j<=NF;j++) printf("%s ",$j)}')"
  echo "The user to which the process belongs: $(ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}'| awk '{print $1}')"
  echo "CPU Occupancy：$(ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}'| awk '{print $3}')%"
  echo "Memory Occupancy：$(ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}'| awk '{print $4}')%"
  echo "The time when the process started running：$(ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}'| awk '{print $9}')"
  echo "Process run time：$(ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}'| awk '{print $10}')"
  echo "Process Status：$(ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}'| awk '{print $8}')"
  echo "Process Virtual Memory：$(ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}'| awk '{print $5}')"
  echo "Process Shared Memory：$(ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}'| awk '{print $6}')"
  echo -e "\e[32m***************************************************************\e[0m"
  let N-- i++
done