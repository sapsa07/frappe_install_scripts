#!/bin/bash

# Step 1: Update Your System
echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Step 2: Install Required Packages
echo "Installing required packages..."
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

# Step 3: Add Docker’s Official GPG Key
echo "Adding Docker’s official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Step 4: Add Docker Repository to APT Sources
echo "Adding Docker repository to APT sources..."
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Step 5: Install Docker Engine
echo "Installing Docker Engine..."
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io -y

# Step 6: Verify Docker Installation
echo "Verifying Docker installation..."
sudo systemctl status docker

# Step 7: Running Docker as a Non-root User
echo "Adding current user to the Docker group..."
sudo usermod -aG docker ${USER}

# Apply the new group membership
echo "Applying group membership changes..."
newgrp docker

# Step 8: Test Docker Installation
echo "Testing Docker installation..."
docker run hello-world

# Step 9: (Optional) Install Docker Compose
echo "Installing Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Verify Docker Compose installation
echo "Verifying Docker Compose installation..."
docker-compose --version

echo "Docker and Docker Compose installation completed successfully."
