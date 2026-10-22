# System Monitoring and Alerting Script

## Project Overview

This project is a Bash-based system monitoring script developed as part of a DevOps capstone project. It monitors disk usage, estimates memory usage, identifies resource-intensive processes, and records monitoring results in a log file.

## Features

- Monitors disk usage.
- Estimates RAM usage.
- Displays warnings when disk or memory usage reaches the configured threshold.
- Lists the top five CPU-consuming processes.
- Lists the top five memory-consuming processes.
- Records timestamped monitoring results in a log file.

## Technologies Used

- Ubuntu Linux
- Bash scripting
- Git and GitHub
- Linux commands: `df`, `free`, `awk`, and `ps`

## Prerequisites

- A Linux environment such as Ubuntu or WSL.
- Bash shell.
- Standard Linux system utilities.

## Installation

Clone the repository:

git clone https://github.com/samyogeshtandel7890-dotcom/system-monitoring-script.git`

Navigate to the project directory:

cd system-monitoring


Make the script executable:


chmod +x system_monitor.sh


## Usage

Run the monitoring script:

./system_monitor.sh

The script displays disk and memory usage, reports their status against the configured thresholds, and lists the top five resource-consuming processes.

## Configuration

The default thresholds are:

- Disk usage: 80%
- Memory usage: 80%

You can change these values in the script.

## Log File

The script generates `system_monitor.log` with timestamps and monitoring status messages. This generated file is excluded from Git tracking through `.gitignore`.

## Learning Outcomes

- Practiced Bash scripting.
- Learned Linux system monitoring commands.
- Used conditional statements and variables.
- Implemented basic threshold-based alerts.
- Practiced Git version control and GitHub repository management.

## Author

DevOps Capstone Project

