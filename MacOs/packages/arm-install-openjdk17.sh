# Install AdoptOpenJDK 17
arch -arm64 brew install --cask adoptopenjdk/openjdk/adoptopenjdk17

# Set JAVA_HOME environment variable
ENV_HOME=$HOME/.myprofile
echo "export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-17.jdk/Contents/Home" >> $ENV_HOME
source $ENV_HOME

# Verify JAVA_HOME
echo "JAVA_HOME is set to: $JAVA_HOME"

# Verify the installation
java -version