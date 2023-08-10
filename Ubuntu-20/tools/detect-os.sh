#!/bin/bash

# Detect OS
os_name="$(uname -s)"

# Detect architecture
arch="$(uname -m)"

# Combine results for case comparison
os_arch="${os_name}_${arch}"

case "$os_arch" in
    Linux_x86_64)
        echo "linux amd"
        ;;
    Linux_arm64|Linux_aarch64)
        echo "linux arm"
        ;;
    Darwin_x86_64)
        echo "macos amd"
        ;;
    Darwin_arm64|Darwin_aarch64)
        echo "macos arm"
        ;;
    *)
        echo "Unknown combination"
        exit 1
        ;;
esac
