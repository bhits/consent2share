#! /bin/bash
cd ../../..;
cd c2s-ui/server;                                   mvn clean package -Pdocker docker:build; cd -;
cd c2s-ui-api/c2s-ui-api;                           mvn clean package docker:build; cd -;
cd context-handler/context-handler;                 mvn clean package docker:build; cd -;
cd dss/dss;                             		mvn clean package docker:build; cd -;
cd edge-server/edge-server;                  		mvn clean package docker:build; cd -;
cd pcm/pcm;                             		    mvn clean package docker:build; cd -;
cd pls/pls;                             	        mvn clean package docker:build; cd -;
cd staff-ui/server;                                 mvn clean package -Pdocker docker:build; cd -;
cd staff-ui-api/staff-ui-api;                       mvn clean package docker:build; cd -;
cd ums/ums;                  	                    mvn clean package docker:build; cd -;
cd vss/vss;                  	                    mvn clean package docker:build; cd -;
cd uaa;											    ./gradlew clean install; cp uaa/build/libs/*.war docker/uaa.war; cp config-template/uaa.yml docker/uaa.yml;cd docker; docker build -t bhits/uaa .; rm uaa.war; rm uaa.yml; cd ../..;
