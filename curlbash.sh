#!/bin/bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg
gpg --dearmor -o /etc/apt/keyrings/docker.gpg
