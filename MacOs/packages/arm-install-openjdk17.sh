#!/bin/bash
brew install openjdk@17

# Set JAVA_HOME environment variable
ENV_HOME=$HOME/.myprofile
echo 'export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"' >> $ENV_HOME
# source $ENV_HOME

# Verify JAVA_HOME
echo "JAVA_HOME is set to: $JAVA_HOME"
# Verify the installation
java -version


# PATH
# For the system Java wrappers to find this JDK, symlink it with
#   sudo ln -sfn /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk

# openjdk@17 is keg-only, which means it was not symlinked into /opt/homebrew,
# because this is an alternate version of another formula.

# If you need to have openjdk@17 first in your PATH, run:
#   echo 'export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"' >> ~/.zshrc
