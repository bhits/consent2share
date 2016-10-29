# Infrastructure as Code
We treat Infrastructure as Code. Here code is used to deploy Consent2Share application in Docker containers.

## Prerequisites

-	[Docker](https://docs.docker.com/engine/installation/)
-	[Docker Compose](https://docs.docker.com/compose/install/)

## Environment Variables 
The following environment variables are required.

On LINUX server, you can create c2s-docker.sh under /etc/profile.d and set it executable using `chmod 755 c2s-docker.sh`.

Add the following lines in `c2s-docker.sh` by replacing `***` with customized passwords and path.

`export UAA_DB_PASSWORD=***`	
`export PCM_DB_PASSWORD=***`	
`export PLS_DB_PASSWORD=***`	
`export PHR_DB_PASSWORD=***`	
`export PATIENT_USER_DB_PASSWORD=***`		
`export AUDIT_DB_PASSWORD=***`		
`export C2S_BASE_PATH=/usr/local`
`export C2S_APP_HOST=***`
`export C2S_APP_PORT=80`
`export UAA_SMTP_HOST=mail.feisystems.com`
`export UAA_SMTP_PORT=***`
`export UAA_SMTP_USER=***`
`export UAA_SMTP_PASSWORD=***`
`export UAA_PUBLIC_KEY=***`
`export HIE_CONNECTION_ENABLE=false`
`export AUTO_SCAN=false`
`export SCAN_PERIOD="30 seconds"`

Update pls and audit-service APIs database properties using customized password.

## Deployment	

There are two options to run Consent2Share application on a CentOS 7.X server. 
	
### One Server Setup

This option is designed to run all Consent2Share services, UIs and databases on a single server.

-	Copy docker-compose.yml to server.
-	run `docker-compose up -d`

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


