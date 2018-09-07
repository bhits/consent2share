# Infrastructure as Code
We treat Infrastructure as Code. Here code is used to deploy Consent2Share application in Docker containers.

## Prerequisites

-	[Docker](https://docs.docker.com/engine/installation/)
-	[Docker Compose](https://docs.docker.com/compose/install/)

## Deployment	

Two server deployment options are provided to run Consent2Share application on Linux. Here we use CentOS 7.X as an example to describe the setups. 

Consent2Share Docker images will be downloaded from [Dockerhub BHITS public registry](https://hub.docker.com/r/bhits/).

### Two Servers Setup

This option is to run Consent2Share services, UIs on an application server and databases on a separated database server. 

#### Configure Database Server
+ Get the [c2s_config.sh](./scripts/c2s_config.sh) file and run the file.
    `curl https://raw.githubusercontent.com/bhits/consent2share/master/infrastructure/scripts/c2s_config.sh > c2s_config.sh`
    `sh c2s_config.sh twoServerDbConfig`   

+ If SELinux is enabled, run the command below to assign the relevant SELinux policy type as a workaround to prevent issues while mounting volumes to the containers from `/usr/local/java`

    `chcon -Rt svirt_sandbox_file_t /usr/local/java`

+ Re-login to the server in order for the file `c2s_env.sh` to run automatically during the login
     
  * Verify by checking any variable mentioned in the file  
  Example: `echo ${C2S_BASE_PATH}` should show the value set in the file  

#### Configure Application Server

+ Get the [c2s_config.sh](./scripts/c2s_config.sh) file and run the file.
    `curl https://raw.githubusercontent.com/bhits/consent2share/master/infrastructure/scripts/c2s_config.sh > c2s_config.sh`
    `sh c2s_config.sh twoServerAppConfig`  

+ If SELinux is enabled, run the command below to assign the relevant SELinux policy type as a workaround to prevent issues while mounting volumes to the containers from `/usr/local/java`

    `chcon -Rt svirt_sandbox_file_t /usr/local/java`
+ Edge-server security:

  * Create/Obtain a valid SSL certificate
  
  * Export the public and private keys from the SSL certificate to a JKS formatted keystore file named `edge-server.keystore`
  
  * upload the  `edge-server.keystore` file into `/usr/local/java/keystore` folder
  
  * Add the following in the `/usr/local/java/C2S_PROPS/c2s-config-data/edge-server.yml` file.

      ```yml
      spring.profiles: your_app_Server_specific_profile
      server:
        ssl:
          key-store: /java/keystore/edge-server.keystore
          key-store-password: "keystore password"
      ```

  * Modify the `ENV_APP_PROFILE= your_app_Server_specific_profile` in twoServerAppConfig() function in the `/etc/profile.d/c2s_env.sh` file.


+ Modify the following configuration files

  * Set `edge server`, `config server`, `SMTP variables` to the server specific values in the ` file in ‘/etc/profile.d/c2s_env.sh’ folder. 
  
  * Re-login to the server in order for the file `c2s_env.sh` to run automatically during the login

  * Verify by checking any variable mentioned in the file  
  Example: `echo ${C2S_BASE_PATH}` should show the value set in the file

#### Compose Containers on Database Server
+ Run `docker-compose up -d` from the `usr/local/java` folder to start up all databases

+ Run `docker ps -a` to verify all the containers are up running except data-only containers

#### Compose Containers on Application Server
+ Run `docker-compose up -d` from the `usr/local/java` folder to start up all Consent2Share services, UIs

+ Run `docker ps -a` to verify all the containers are up running

### Populate sample providers
+ Login to docker pls database container
    `docker ps  | grep pls-db`
    `docker exec -it  <<pls-db container id>> bash`


+ Run `pls_db_sample.sql` from container directory `/java/C2S_PROPS/pls`.
    `cd  /java/C2S_PROPS/pls`
    `mysql -p`
    
    enter root pwd(default is admin)
    
    `source pls_db_sample.sql`

## Development

The docker compose file in Development folder is designed to run Consent2Share application on developer machine. 	
Compared to the deployment one-server option, this one doesn't set any memory constraints on Docker containers because developer's machine may has limited memory on docker-machine. Also, this one uses default `c2s-config-data` without any addtional setup. 

## Resolve Deployment Error
If you encounter an error in the deployment:  
`ERROR: for dss.c2s.com  UnixHTTPConnectionPool(host='localhost', port=None): Read timed out. (read timeout=60)

Follow the steps below to resolve the error:

1. Restart the Docker service: `sudo service docker restart`  

2. Check for all Docker containers that are running: `docker ps -a`   
   If you notice any containers that are exited or down except the data-only containers based on `busybox` image, follow the next steps

3. For instance, if mysql containers are not running  
    a. Go to /usr/local/java and then remove all containers : `docker-compose down`  
    b. Go to /usr/local/java and then remove mysql folder : `sudo rm -rf mysql/`

4. Start up all containers: Re-run from `/usr/local/java` folder: `docker-compose up -d` 


## UI Urls

+ Consent2Share Staff Admin UI: `https://<application_server>/staff-ui`

  * By default, Consent2Share comes with a staff admin user

  * Login to Consent2Share Admin UI as an admin using username `c2s-admin@mailinator.com` and password `AAA#aaa1` to create a user patient account

+ Consent2Share Patient Portal UI: `https://<application_server>/c2s-ui`

## Scripts

### build-all.sh
This script is used to build all consent2share APIs' docker images on local machine.

After clone the this repository under the same parent folder as other Consent2Share project repositories. Run `build-all.sh` in `git bash` or `terminal/command line` after navigate to `scripts` folder.

Run `docker images` to check all created docker images.

## Reference 
For more detail, please refer to `README.md` file in each repository for Consent2Share.

## Report Issues
Please use [GitHub Issues](https://github.com/bhits/consent2share/issues) page to report issues.


