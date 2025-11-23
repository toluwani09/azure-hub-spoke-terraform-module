# PowerShell script to configure the self-hosted agent for CI/CD pipelines

$ErrorActionPreference = "Stop"

# Variables
param (
    [string]$AgentName = "myAgent",
    [string]$PoolName = "Default",
    [string]$Url = "https://dev.azure.com/yourorganization",
    [string]$Token = "YOUR_PERSONAL_ACCESS_TOKEN"
)

# Install the agent
$agentPackageUrl = "https://vstsagentpackage.azureedge.net/agent/2.202.0/vsts-agent-win-x64-2.202.0.zip"
$agentPackagePath = "$env:TEMP\agent.zip"

Invoke-WebRequest -Uri $agentPackageUrl -OutFile $agentPackagePath

# Create a directory for the agent
$agentDirectory = "C:\agent"
New-Item -ItemType Directory -Path $agentDirectory -Force

# Unzip the agent package
Expand-Archive -Path $agentPackagePath -DestinationPath $agentDirectory -Force

# Configure the agent
Set-Location -Path $agentDirectory
.\config.cmd --unattended --url $Url --auth pat --token $Token --pool $PoolName --agent $AgentName --acceptTeeEula

# Install the agent as a service
.\svc.sh install
.\svc.sh start

Write-Host "Self-hosted agent configured and running."