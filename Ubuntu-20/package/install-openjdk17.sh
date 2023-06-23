#!/bin/bash
sudo apt update
sudo apt install openjdk-17-jdk -y

# Set JAVA_HOME environment variable
ENV_HOME=$HOME/.bashrc
echo 'export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64"' >> ~/.bashrc
echo 'export PATH="$JAVA_HOME/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# Verify JAVA_HOME
echo "JAVA_HOME is set to: $JAVA_HOME"
# Verify the installation
java -version
