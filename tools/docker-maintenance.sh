#!/bin/bash

# for vm-agents
# crontab -e
# 0 0 * * * /home/ubuntu/devops/scripts/jenkins-maintenance.sh

echo 'y' | docker image prune -a
echo 'y' | docker system prune -f
