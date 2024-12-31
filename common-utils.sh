#!/bin/bash

# Function to install wget if not present
install_wget() {
    echo "Installing wget..."
    if [[ -f /etc/debian_version ]]; then
        sudo apt-get install wget -y
    elif [[ -f /etc/redhat-release ]]; then
        sudo yum install wget -y
    else
        echo "Unsupported Linux distribution for wget installation."
        exit 1
    fi
}

# Function to install curl if not present
install_curl() {
    echo "Installing curl..."
    if [[ -f /etc/debian_version ]]; then
        sudo apt-get install curl -y
    elif [[ -f /etc/redhat-release ]]; then
        sudo yum install curl -y
    else
        echo "Unsupported Linux distribution for curl installation."
        exit 1
    fi
}

# Function to check and install necessary tools (wget or curl)
ensure_download_tool() {
    if ! command -v wget &> /dev/null && ! command -v curl &> /dev/null; then
        echo "Neither wget nor curl is installed. Installing wget and curl..."
        install_wget
        install_curl
    elif ! command -v wget &> /dev/null; then
        echo "wget is not installed. Installing wget..."
        install_wget
    elif ! command -v curl &> /dev/null; then
        echo "curl is not installed. Installing curl..."
        install_curl
fi
}
