#!/bin/bash -x
dockerVersion=17.03.1ce-1.50.amzn1
dockerComposeVersion=1.13.0

sudo su << SudoUser
    #Install 1.13.0-1.el7.centos docker version
    function unInstallDocker(){
        yum -y remove docker \
                  docker-common \
                  container-selinux \
                  docker-selinux \
                  docker-engine

        rm -rf /var/lib/docker

        rm /usr/local/bin/docker-compose

        rm -rf /etc/docker
    }
    function installDocker() {

        #Update the installed packages and package cache on your instance
        yum update -y

        #Install Docker

        #Update the yum package index
        yum makecache fast

        #install a specific version of Docker
        sudo yum install -y docker-$dockerVersion

        # Start the Docker service.
        service docker start

        #Add the ec2-user to the docker group so you can execute Docker commands without using sudo.
        sudo usermod -a -G docker ec2-user
     }


    # Install docker compose version
    function installDockerCompose() {
        curl -L https://github.com/docker/compose/releases/download/$dockerComposeVersion/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
        # Apply executable permissions to the binary
        chmod +x /usr/local/bin/docker-compose
     }


    function verifyInstall() {
       # Test Docker Installation
        docker run hello-world
       # Test docker compose installation
       docker-compose --version
     }

    # Start running script
    unInstallDocker
    installDocker
    installDockerCompose
    exit
    verifyInstall

SudoUser

