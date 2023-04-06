#! /bin/bash

read -p "Please enter the user name to be queried：" name

echo "------------------------------"

n=`cat /etc/passwd | awk -F: '$1~/^'${name}'$/{print}' | wc -l`

if [ $n -eq 0 ];then
echo -e "\e[31mThis user does not exist!\e[0m"
echo "------------------------------"
else
  echo "The user's username：${name}"
  echo "UID of this user：$(cat /etc/passwd | awk -F: '$1~/^'${name}'$/{print}'|awk -F: '{print $3}')"
  echo "The group for this user is：$(id ${name} | awk {'print $3'})"
  echo "The GID of this user is：$(cat /etc/passwd | awk -F: '$1~/^'${name}'$/{print}'|awk -F: '{print $4}')"
  echo "The home directory for this user is：$(cat /etc/passwd | awk -F: '$1~/^'${name}'$/{print}'|awk -F: '{print $6}')"
  Login=$(cat /etc/passwd | awk -F: '$1~/^'${name}'$/{print}'|awk -F: '{print $7}')
  if [ ${Login} == "/bin/bash" ];then
  echo -e "\e[32mThis user has permission to log in to the system\e[0m"
  echo "------------------------------"
  elif [ ${Login} == "/sbin/nologin" ];then
  echo -e "\e[31mThis user does not have permission to log in to the system！\e[0m"
  echo "------------------------------"
  fi
fi
