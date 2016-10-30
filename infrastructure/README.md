# Infrastructure as Code
We treat Infrastructure as Code. Here code is used to deploy Consent2Share application in Docker containers.

## Prerequisites

-	[Docker](https://docs.docker.com/engine/installation/)
-	[Docker Compose](https://docs.docker.com/compose/install/)

## Deployment	

Two deployment options are provided to run Consent2Share application on Linux. Here we use CentOS 7.X as an example to describe the setups. 
	
### One Server Setup

This option is designed to run all Consent2Share services, UIs and databases on a single server.

#### Configure

+ Create a new directory `/usr/local/java/C2S_PROPS`

    `mkdir /usr/local/java/`  
    `mkdir /usr/local/java/C2S_PROPS`  

+ If SELinux is enabled, run the following command to assign the relevant SELinux policy type as a workaround to prevent issues while mounting volumes to the containers from `/usr/local/java`

    `chcon -Rt svirt_sandbox_file_t /usr/local/java`

+ Get the [c2s_docker.sh](../scripts/c2s_docker.sh) file and place it in the `/etc/profile.d/` folder

  * Modify the `C2S_APP_HOST` and `SMTP` variables according to the server environment

  * Re-login to the server in order for the file `c2s_docker.sh` to run automatically during the login

  * Verify by checking any variable mentioned in the file  
  Example: `echo ${C2S_BASE_PATH}` should show the value set in the file

+ Create the following sub folders under `/usr/local/java/C2S_PROPS` folder:

  * `uaa`

  * `pls-api/config-template`

  * `pls-api/init-db`

  * `logback-audit/config-template`

  * `logback-audit/init-db`

  * `iexhub/temp`

  * `iexhub/test`

+ Copy the following configuration files and place them under  the `/usr/local/java/ C2S_PROPS`:  
  
  * Copy the [uaa.yml](https://github.com/bhits/uaa/blob/master/config-template/uaa.yml) to `uaa` sub folder
  
  * Copy all pls-api [config-temlate](https://github.com/bhits/pls-api/tree/master/config-template) files to `pls-api/config-template` sub folder
  
  * Copy the [sample provider data sql](https://github.com/bhits/pls-api/tree/master/npi-db-sample) file to `pls-api/init-db' sub folder
  
  * Copy the logback-audit [config-template](https://github.com/bhits/logback-audit/tree/master/config-template) file to `logback-audit/config-template` sub folder  
  
  * Copy the [database schema sql](https://github.com/bhits/logback-audit/tree/master/audit-db) file to `logback-audit/init-db` sub folder

  * Copy all [IExHub resource](https://github.com/bhits/iexhub/tree/master/iexhub/src/main/resources) folder files to `iexhub/temp` sub folder

+ Get the [docker-compose.yml](../deployment/one-server/docker-compose.yml) file and place it in the `/usr/local/java` folder
  
+ Modify the following configuration files

  * In `/usr/local/java/C2S_PROPS/pls-api/config-template/pls-config.properties` file, replace `localhost` with `pls-db.c2s.com` in the variable `database.url`
  
  * In `/usr/local/java/C2S_PROPS/uaa/uaa.yml` file, replace `localhost` with `uaa-db.c2s.com` in the variable `database.url`
  
+ Edge-server security:

  * Create a new directory named `keystore` under `/usr/local/java` folder
  
  * Create/Obtain a valid SSL certificate
  
  * Export the public and private keys from the SSL certificate to a JKS formatted keystore file named `edge-server.keystore`
  
  * Put the `edge-server.keystore` file into `/usr/local/java/keystore` folder
  
  * Modify the value of the `server.ssl.key-store-password` property in the `docker-compose.yml` file located in the `/usr/local/java` folder to match the password used when exporting/creating the SSL certificate
  
#### Compose Containers
+ Run `docker-compose up -d` from the ‘`usr/local/java` folder to start up all Consent2Share services, UIs and databases

+ Run `docker ps -a` to verify all the containers are up running except data-only containers.

### Two Servers Setup

This option is to run Consent2Share services, UIs on an application server and databases on a separated database server. 

#### Configure Database Server
+ Create a new directory `/usr/local/java/C2S_PROPS`

+ If SELinux is enabled, run the following command below to assign the relevant SELinux policy type as a workaround to prevent issues while mounting volumes to the containers from `/usr/local/java`

    `chcon -Rt svirt_sandbox_file_t /usr/local/java`

+ Get the [c2s_docker.sh](../scripts/c2s_docker.sh) file and place it in the `/etc/profile.d/` folder

  * Uncomment the `C2S_DB_HOST` variable and modify the `C2S_APP_HOST`, `C2S_DB_HOST` and `SMTP` variables according to the server environment
  
  * Re-login to the server in order for the file `c2s_docker.sh` to run automatically during the login
  
  * Verify by checking any variable mentioned in the file  
  Example: `echo ${C2S_BASE_PATH}` should show the value set in the file  

+ Create the following sub folders under `/usr/local/java/C2S_PROPS` folder
  
  * `pls-api/init-db`
  
  * `logback-audit/init-db`
  
+ Get the following configuration files under the `/usr/local/java/C2S_PROPS`

  * Copy the [initial database](https://github.com/bhits/pls-api/tree/master/npi-db-sample) file to `pls-api/init-db`

  * Copy the [database schema sql](https://github.com/bhits/logback-audit/tree/master/audit-db) file to `logback-audit/init-db` sub folder

+ Get the [docker-compose-db-server.yml](../deployment/two-servers/docker-compose-db-server.yml) file as `docker-compose.yml` under the `/usr/local/java` folder

#### Configure Application Server

+ Create a new directory `/usr/local/java/C2S_PROPS`

    `mkdir /usr/local/java/`  
    `mkdir /usr/local/java/C2S_PROPS`  

+ If SELinux is enabled, run the following command to assign the relevant SELinux policy type as a workaround to prevent issues while mounting volumes to the containers from `/usr/local/java`

    `chcon -Rt svirt_sandbox_file_t /usr/local/java`

+ Get the [c2s_docker.sh](../scripts/c2s_docker.sh) file and place it in the `/etc/profile.d/` folder

  * Uncomment the `C2S_DB_HOST` variable

  * Modify the `C2S_APP_HOST` and `SMTP` variables according to the server environment

  * Re-login to the server in order for the file `c2s_docker.sh` to run automatically during the login

  * Verify by checking any variable mentioned in the file  
  Example: `echo ${C2S_BASE_PATH}` should show the value set in the file

+ Create the following sub folders under `/usr/local/java/C2S_PROPS` folder:

  * `uaa`

  * `pls-api/config-template`

  * `logback-audit/config-template`

  * `iexhub/temp`

  * `iexhub/test`

+ Copy the following configuration files and place them under  the `/usr/local/java/ C2S_PROPS`:  
  
  * Copy the [uaa.yml](https://github.com/bhits/uaa/blob/master/config-template/uaa.yml) to `uaa` sub folder
  
  * Copy all pls-api [config-temlate](https://github.com/bhits/pls-api/tree/master/config-template) files to `pls-api/config-template` sub folder
  
  * Copy the logback-audit [config-template](https://github.com/bhits/logback-audit/tree/master/config-template) file to `logback-audit/config-template` sub folder  

  * Copy all [IExHub resource](https://github.com/bhits/iexhub/tree/master/iexhub/src/main/resources) folder files to `iexhub/temp` sub folder

+ Get the [docker-compose.yml](../deployment/one-server/docker-compose.yml) file and place it in the `/usr/local/java` folder
  
+ Modify the following configuration files

  * In `/usr/local/java/C2S_PROPS/pls-api/config-template/pls-config.properties` file, replace `localhost` with `C2S_DB_HOST` in the variable `database.url`
  
  * In `/usr/local/java/C2S_PROPS/uaa/uaa.yml` file, replace `localhost` with `C2S_DB_HOST` in the variable `database.url`

+ Get the [docker-compose-app-server.yml](../deployment/two-servers/docker-compose-app-server.yml) file as `docker-compose.yml` under the `/usr/local/java` folder

+ Edge-server security:

  * Create a new directory named `keystore` under `/usr/local/java` folder
  
  * Create/Obtain a valid SSL certificate
  
  * Export the public and private keys from the SSL certificate to a JKS formatted keystore file named `edge-server.keystore`
  
  * Put the `edge-server.keystore` file into `/usr/local/java/keystore` folder
  
  * Modify the value of the `server.ssl.key-store-password` property in the `docker-compose.yml` file located in the `/usr/local/java` folder to match the password used when exporting/creating the SSL certificate
  
#### Compose Containers on Database Server
+ Run `docker-compose up -d` from the ‘`usr/local/java` folder to start up all databases

+ Run `docker ps -a` to verify all the containers are up running except data-only containers

#### Compose Containers on Application Server
+ Run `docker-compose up -d` from the ‘`usr/local/java` folder to start up all Consent2Share services, UIs

+ Run `docker ps -a` to verify all the containers are up running

## Development

This docker compose file in Development fodler is designed to run Consent2Share application on developer machine. 	
Compared to the deployment one-server option, this one doesn't set any memory constraints on Docker containers because developer's machine may has limited memory on docker-machine. 

## UI Urls

+ Consent2Share Admin UI: `https://<application_server>/admin-ui`

  * By default, Consent2Share comes with a provider staff admin user

  * Login to Consent2Share Admin UI as an admin using username `consent2share@gmail.com` and password `admin` to create a patient account

+ Consent2Share Patient Portal UI: `https://<application_server>/pp-ui`

## Scripts

### build-all.sh
This script is used to build all consent2share APIs' docker images on local machine.

After clone the this repository under the same parent folder as other Consent2Share project repositories. Run `build-all.sh` in `git bash` or `terminal/command line` after navigate to `scripts` folder.

Run `docker images` to check all created docker images.

### publish-dockerhub.sh

This script is used to tag Docker images and publish to the Dockerhub. Docker image tag is same as the version number of the corresponding Consent2Share project.

## Reference 
For more detail, please refer to `README.md` file in each repository for Consent2Share.

## Report Issues
Please use [GitHub Issues](https://github.com/bhits/consent2share/issues) page to report issues.


