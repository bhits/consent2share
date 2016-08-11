#! /bin/bash
docker tag bhits/try-policy bhits/try-policy:1.8.0;
docker tag bhits/discovery-server bhits/discovery-server:0.3.0;
docker tag bhits/dss bhits/dss:1.8.0;
docker tag bhits/edge-server bhits/edge-server:0.6.0;
docker tag bhits/iexhub-fork bhits/iexhub-fork:0.2.0;
docker tag bhits/patient-user bhits/patient-user:0.7.0;
docker tag bhits/pcm bhits/pcm:1.13.0;
docker tag bhits/phr bhits/phr:1.13.0;
docker tag bhits/patient-registration bhits/patient-registration:1.9.0;
docker tag bhits/pp-ui bhits/pp-ui:0.15.0;
docker tag bhits/admin-portal-ui bhits/admin-portal-ui:0.8.0;
docker tag bhits/uaa bhits/uaa:3.4.1;
docker tag bhits/pls bhits/pls:1.6.0;
docker tag bhits/pep bhits/pep:1.2.0;
docker tag bhits/context-handler bhits/context-handler:1.2.0;
docker tag bhits/document-validator-ccda-r1 bhits/document-validator-ccda-r1:0.4.0;
docker tag bhits/document-validator-ccda-r2 bhits/document-validator-ccda-r2:0.4.0;


docker push bhits/try-policy:1.8.0;
docker push bhits/discovery-server:0.3.0;
docker push bhits/dss:1.8.0;
docker push bhits/edge-server:0.6.0;
docker push bhits/iexhub-fork:0.2.0;
docker push bhits/patient-user:0.7.0;
docker push bhits/pcm:1.13.0;
docker push bhits/phr:1.13.0;
docker push bhits/patient-registration:1.9.0;
docker push bhits/pp-ui:0.15.0;
docker push bhits/admin-portal-ui:0.8.0;
docker push bhits/uaa:3.4.1;
docker push bhits/pls:1.6.0;
docker push bhits/pep:1.2.0;
docker push bhits/context-handler:1.2.0;
docker push bhits/document-validator-ccda-r1:0.4.0;
docker push bhits/document-validator-ccda-r2:0.4.0;



docker push bhits/try-policy;
docker push bhits/discovery-server;
docker push bhits/dss;
docker push bhits/edge-server;
docker push bhits/iexhub-fork;
docker push bhits/patient-user;
docker push bhits/pcm;
docker push bhits/phr;
docker push bhits/patient-registration;
docker push bhits/pp-ui;
docker push bhits/admin-portal-ui;
docker push bhits/uaa;
docker push bhits/pls;
docker push bhits/pep;
docker push bhits/context-handler;
docker push bhits/document-validator/document-validator-ccda-r1;
docker push bhits/document-validator/document-validator-ccda-r2;
