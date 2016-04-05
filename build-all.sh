#! /bin/bash

cd admin-portal-ui/server;                          mvn clean package -Pdocker docker:build; cd -; 
cd discovery-server/discovery-server;               mvn clean package docker:build; cd -; 
cd dss-api/dss;                             		mvn clean package docker:build; cd -; 
cd edge-server/edge-server;                  		mvn clean package docker:build; cd -; 
cd patient-portal-ui/server;                        mvn clean package -Pdocker docker:build; cd -; 
cd patient-user-api/patient-user;                   mvn clean package docker:build; cd -; 
cd pcm-api/pcm;                             		mvn clean package docker:build; cd -; 
cd phr-api/phr;                  					mvn clean package docker:build; cd -; 
cd pls-api/pls/web;                             	mvn clean package docker:build; cd -; 
cd registration-api/registration;                  	mvn clean package docker:build; cd -; 
cd try-policy-api/tryPolicy;                        mvn clean package docker:build; cd -; 
cd iexhub/iexhub;                                   mvn clean package docker:build; cd -; 
cd uaa;											    gradlew clean install; cp uaa/build/libs/*.war docker/uaa.war; cd docker; docker build -t uaa .;
