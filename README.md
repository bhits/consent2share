# C2S Runner
C2S runner is used to deploy consent2share application using docker and docker-compose.

## Prerequisites

-	[docker](https://docs.docker.com/engine/installation/)
-	[docker compose](https://docs.docker.com/compose/install/)

## Environment variable 
Following environment variable are required.

On LINUX server, you can create c2s-docker.sh under /etc/profile.d and set it executable using `chmod 755 c2s-docker.sh`.

Add the following lines in `c2s-docker.sh` by replacing `***` with customized passwords and path.

`export UAA_DB_PASSWORD=***`	
`export PCM_DB_PASSWORD=***`	
`export PLS_DB_PASSWORD=***`	
`export PHR_DB_PASSWORD=***`	
`export PATIENT_USER_DB_PASSWORD=***`		
`export AUDIT_DB_PASSWORD=***`		
`export C2S_BASE_PATH=/usr/local`

Update APIs database properties using customized password.

## Deployment	

There are two options to run consent2share application on a CentOS 7.X server. 
	
### one-server

This option is designed to run all consent2share APIs and databases on single server.

-	Copy docker-compose.yml to server.
-	run `docker-compose up -d`

### two-servers

This option is separated APIs on application server and database on database server. 

-	Copy docker-compose-db-server.yml to database server.
-	run `docker-compose up -d` after rename to docker-compose.yml

-	Copy docker-compose-app-server.yml to application server.
-	run `docker-compose up -d` after rename to docker-compose.yml

## Development

This docker compose file is designed to let developer run consent2share application. 	

Compared to the deployment one-server option, this one doesn't set any memory constraints on docker containers because developer's machine may has limited memory on docker-machine. 

## scripts

### build-all.sh
This script is used to build all consent2share APIs' docker images on local machine.
After clone the c2s-runner repository under the same workspace with other consent2share APIs repositories. Run `build-all.sh` in `git bash` or `terminal/command line` after navigate to `scripts` folder.

### publish-dockerhub.sh

This script is used to tag docker images and publish to the dockerhub. Image tag is same as pom.xml version number in each APIs.

## Reference 
For more detail, please refer `C2S deployment guide` and APIs `README.md` file in each repository. 


