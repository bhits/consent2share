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
  
  * Copy all [IExHub resource](https://github.com/bhits/iexhub/tree/master/iexhub/src/main/resources) folder files to `iexhub/temp` sub folder
  
  * Copy the [uaa.yml](https://github.com/bhits/uaa/blob/master/config-template/uaa.yml) to `uaa` sub folder
  
  * Copy all pls-api [config-temlate](https://github.com/bhits/pls-api/tree/master/config-template) files to `pls-api/config-template` sub folder
  
  * Copy the [sample provider data sql](https://github.com/bhits/pls-api/tree/master/npi-db-sample) file to `pls-api/init-db' sub folder
  
  * Copy the logback-audit [config-template](https://github.com/bhits/logback-audit/tree/master/config-template) file to `logback-audit/config-template` sub folder  
  
  * Copy the [database schema sql](https://github.com/bhits/logback-audit/tree/master/audit-db) file to `logback-audit/init-db` sub folder

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

+ Run `docker ps -a` to verify all the containers is up running except data-only containers.

### Two Servers Setup

This option is to run Consent2Share services, UIs on an application server and databases on a separated database server. 

-	Copy docker-compose-db-server.yml to database server.
-	run `docker-compose up -d` after rename to docker-compose.yml

-	Copy docker-compose-app-server.yml to application server.
-	run `docker-compose up -d` after rename to docker-compose.yml

## Development

This docker compose file is designed to run Consent2Share application on developer machine. 	

Compared to the deployment one-server option, this one doesn't set any memory constraints on Docker containers because developer's machine may has limited memory on docker-machine. 

## Scripts

### build-all.sh
This script is used to build all consent2share APIs' docker images on local machine.
After clone the c2s-runner repository under the same workspace with other consent2share APIs repositories. Run `build-all.sh` in `git bash` or `terminal/command line` after navigate to `scripts` folder.
Run `docker images` to check all created docker images.

### publish-dockerhub.sh

This script is used to tag docker images and publish to the dockerhub. Image tag is same as pom.xml version number in each APIs.

## Reference 
For more detail, please refer to `README.md` file in each repository for Consent2Share.


