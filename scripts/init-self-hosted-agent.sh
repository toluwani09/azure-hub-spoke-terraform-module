#!/bin/bash

# Variables
AGENT_NAME="my-self-hosted-agent"
AGENT_POOL="Default"
REPO_URL="https://github.com/your-org/your-repo"
TOKEN="your-personal-access-token"

# Install required packages
sudo apt-get update
sudo apt-get install -y curl jq

# Create a directory for the agent
mkdir $AGENT_NAME && cd $AGENT_NAME

# Download the agent package
curl -O https://vstsagentpackage.azureedge.net/agent/2.195.0/vsts-agent-linux-x64-2.195.0.tar.gz

# Extract the package
tar zxvf vsts-agent-linux-x64-2.195.0.tar.gz

# Configure the agent
./config.sh --unattended --url $REPO_URL --auth pat --token $TOKEN --pool $AGENT_POOL --agent $AGENT_NAME --acceptTeeEula

# Install the service
sudo ./svc.sh install

# Start the service
sudo ./svc.sh start

echo "Self-hosted agent setup completed."