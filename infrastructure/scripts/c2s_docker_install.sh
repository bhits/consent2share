#!/bin/bash -x
dockerVersion=docker-engine-1.13.0-1.el7.centos
dockerComposeVersion=1.10.1

sudo su << SudoUser
    #Install 1.13.0-1.el7.centos docker version
    #https://docs.docker.com/engine/installation/linux/centos/

    function installDocker() {
        # Remove old package name docker if exists
        yum -y remove docker

        # Set up the repository
        #Install yum-utils, which provides the yum-config-manager utility:
        yum install -y yum-utils
        #set up the stable repository
        yum-config-manager \
        --add-repo \
        https://docs.docker.com/engine/installation/linux/repo_files/centos/docker.repo

        #Install Docker
        #Update the yum package index
        yum makecache fast
        #install a specific version of Docker
        yum -y install $dockerVersion

        # Start Docker
        service docker start
     }


    # Install 1.10.1 docker compose version
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
    installDocker
    installDockerCompose
    exit
    verifyInstall
SudoUser

