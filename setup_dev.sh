#!/usr/bin/bash


### Node ###
if command -v node &>/dev/null;
then
    echo "Node already installed"
else
    echo "installing node ..."
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - &&\
    sudo apt-get install -y nodejs
fi

### Docker ###
if command -v docker &>/dev/null;
then
    echo "docker already installed"   
else
   echo "installing docker ..."
   # Update the apt package index and install packages to allow apt to use a repository over HTTPS
    sudo apt-get update
    sudo apt-get install ca-certificates curl gnupg
    # Add Docker’s official GPG key
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg
    # Use the following command to set up the repository
    echo \
    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    # Update the apt package index
    sudo apt-get update -y
    # Install Docker Engine, containerd, and Docker Compose
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
fi

### Docker-compose ###
if command -v docker-compose &>/dev/null;
then
    echo "docker-compose already installed"   
else
    echo "installing docker-compose"
    sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
fi

### Postgresql ###
if command -v psql &>/dev/null;
then
    echo "postgresql already installed"   
else
    echo "installing postgresql"
    sudo apt update -y 
    sudo apt install postgresql postgresql-contrib -y 
    sudo systemctl start postgresql.service
fi

### mongodb ###
if command -v mongod &>/dev/null;
then
    echo "mongodb already installed"   
else
    echo "installing mongodb"
    # Read more https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/

    # Import the public key used by the package management system
    sudo apt-get install gnupg curl

    # Issue the following command to import the MongoDB public GPG Key from https://pgp.mongodb.com/server-6.0.asc
    curl -fsSL https://pgp.mongodb.com/server-6.0.asc | \
    sudo gpg -o /usr/share/keyrings/mongodb-server-6.0.gpg \
    --dearmor

    # Create a list file for MongoDB. Ubuntu 22.04
    echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

    # Reload local package database
    sudo apt-get update

    # Install the MongoDB packages
    sudo apt-get install -y mongodb-org

    echo "mongodb-org hold" | sudo dpkg --set-selections
    echo "mongodb-org-database hold" | sudo dpkg --set-selections
    echo "mongodb-org-server hold" | sudo dpkg --set-selections
    echo "mongodb-mongosh hold" | sudo dpkg --set-selections
    echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
    echo "mongodb-org-tools hold" | sudo dpkg --set-selections
fi

