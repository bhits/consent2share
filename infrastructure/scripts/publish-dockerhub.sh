#! /bin/bash
docker tag bhits/c2s-ui bhits/c2s-ui:0.1.0;
docker tag bhits/c2s-ui-api bhits/c2s-ui-api:0.1.0;
docker tag bhits/config-server bhits/config-server:0.3.0;
docker tag bhits/discovery-server bhits/discovery-server:0.11.0;
docker tag bhits/edge-server bhits/edge-server:0.15.0;
docker tag bhits/pcm bhits/pcm:2.0.0;
docker tag bhits/pls bhits/pls:3.0.0;
docker tag bhits/uaa bhits/uaa:3.4.1-04;
docker tag bhits/vss bhits/vss:0.2.0;

#Push docker images to docker hub
docker push bhits/c2s-ui:0.1.0;
docker push bhits/c2s-ui-api:0.1.0;
docker push bhits/config-server:0.3.0;
docker push bhits/discovery-server:0.11.0;
docker push bhits/edge-server:0.15.0;
docker push bhits/pcm:2.0.0;
docker push bhits/pls:3.0.0;
docker push bhits/uaa:3.4.1-02;
docker push bhits/vss:0.1.0;


docker push bhits/c2s-ui;
docker push bhits/c2s-ui-api;
docker push bhits/config-server;
docker push bhits/discovery-server;
docker push bhits/edge-server;
docker push bhits/pcm;
docker push bhits/pls;
docker push bhits/uaa;
docker push bhits/vss;