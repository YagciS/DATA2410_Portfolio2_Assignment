#bin/bash

#We are going to install Docker Engine 20.10.8 and Docker-compose
#From the offical website.
#First we have to determine what version our VM is running. Command "cat /proc/version" shows us
#that we are running Ubuntu 20.04, therefore we are going to do a ubuntu install

# This is the offical link to Docker Ubuntu install:
# "https://docs.docker.com/engine/install/ubuntu/"

# Updating apt packages and installing packages to allow apt to use a repo over HTTPS:
apt-get update -y
apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

# Adding the offical GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
                 | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Setting up the stable repo
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Installing Docker Engine
# Since the task asked us specifically to download Docker 20.10.8
# We have to add a "=" after the packets to specify that we want that version
apt-get update -y
apt-get install \
    docker-ce=5:20.10.8~3-0~ubuntu-focal \
    docker-ce-cli=5:20.10.8~3-0~ubuntu-focal \
    containerd.io \
    docker-compose-plugin -y

# Lastly we want to download docker-compose
apt-get update -y
apt install docker-compose -y

echo 'Docker v20.10.8 and Docker-Compose for Ubuntu 20.04 is installed.'
