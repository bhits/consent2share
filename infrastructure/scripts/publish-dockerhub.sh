#! /bin/bash
docker tag bhits/c2s-ui bhitsdev/c2s-ui:${C2S_UI_VERSION};
docker tag bhits/c2s-ui-api bhitsdev/c2s-ui-api:${C2S_UI_API_VERSION};
docker tag bhits/config-server bhitsdev/config-server:${CONFIG_SERVER_VERSION};
docker tag bhits/context-handler bhitsdev/context-handler:${CONTEXT_HANDLER_VERSION};
docker tag bhits/discovery-server bhitsdev/discovery-server:${DISCOVERY_SERVER_VERSION};
docker tag bhits/document-validator bhitsdev/document-validator:${DOCUMENT_VALIDATOR_VERSION}
docker tag bhits/dss bhitsdev/dss:${DSS_VERSION};
docker tag bhits/edge-server bhitsdev/edge-server:${EDGE_SERVER_VERSION};
docker tag bhits/iexhub-pix-pdq bhitsdev/iexhub-pix-pdq:${IEXHUB_PIX_PDQ_VERSION};
docker tag bhits/iexhub-xdsb bhitsdev/iexhub-xdsb:${IEXHUB_XDSB_VERSION};
docker tag bhits/master-ui bhitsdev/master-ui:${MASTER_UI_VERSION};
docker tag bhits/master-ui-api bhitsdev/master-ui-api:${MASTER_UI_API_VERSION};
docker tag bhits/pcm bhitsdev/pcm:${PCM_VERSION};
#docker tag bhits/pep-api bhitsdev/pep-api:${PEP_API_VERSION};
docker tag bhits/pep bhitsdev/pep:${PEP_VERSION};
docker tag bhits/phr bhitsdev/phr:${PHR_VERSION};
docker tag bhits/pls bhitsdev/pls:${PLS_VERSION};
docker tag bhits/provider-ui bhitsdev/provider-ui:${PROVIDER_UI_VERSION}
docker tag bhits/provider-ui-api bhitsdev/provider-ui-api:${PROVIDER_UI_API_VERSION}
docker tag bhits/staff-ui bhitsdev/staff-ui:${STAFF_UI_VERSION};
docker tag bhits/staff-ui-api bhitsdev/staff-ui-api:${STAFF_UI_API_VERSION};
docker tag bhits/try-policy  bhitsdev/try-policy:${TRY_POLICY_VERSION}
#docker tag bhits/uaa bhitsdev/uaa:${UAA_VERSION};
docker tag bhits/ums bhitsdev/ums:${UMS_VERSION};
docker tag bhits/vss bhitsdev/vss:${VSS_VERSION};

#Push docker images to docker hub
docker push bhitsdev/c2s-ui:${C2S_UI_VERSION};
docker push bhitsdev/c2s-ui-api:${C2S_UI_API_VERSION};
docker push bhitsdev/config-server:${CONFIG_SERVER_VERSION};
docker push bhitsdev/context-handler:${CONTEXT_HANDLER_VERSION};
docker push bhitsdev/discovery-server:${DISCOVERY_SERVER_VERSION};
docker push bhitsdev/document-validator:${DOCUMENT_VALIDATOR_VERSION}
docker push bhitsdev/dss:${DSS_VERSION};
docker push bhitsdev/edge-server:${EDGE_SERVER_VERSION};
docker push bhitsdev/iexhub-pix-pdq:${IEXHUB_PIX_PDQ_VERSION};
docker push bhitsdev/iexhub-xdsb:${IEXHUB_XDSB_VERSION};
docker push bhitsdev/master-ui:${MASTER_UI_VERSION};
docker push bhitsdev/master-ui-api:${MASTER_UI_API_VERSION};
docker push bhitsdev/pcm:${PCM_VERSION};
#docker push bhitsdev/pep-api:${PEP_API_VERSION};
docker push bhitsdev/pep:${PEP_VERSION};
docker push bhitsdev/phr:${PHR_VERSION};
docker push bhitsdev/pls:${PLS_VERSION};
docker push bhitsdev/provider-ui:${PROVIDER_UI_VERSION};
docker push bhitsdev/provider-ui-api:${PROVIDER_UI_API_VERSION};
docker push bhitsdev/staff-ui:${STAFF_UI_VERSION};
docker push bhitsdev/staff-ui-api:${STAFF_UI_API_VERSION};
docker push bhitsdev/try-policy:${TRY_POLICY_VERSION};
#docker push bhitsdev/uaa:${UAA_VERSION};
docker push bhitsdev/ums:${UMS_VERSION};
docker push bhitsdev/vss:${VSS_VERSION};

#push the latest verions
docker push bhitsdev/c2s-ui;
docker push bhitsdev/c2s-ui-api;
docker push bhitsdev/config-server;
docker push bhitsdev/context-handler;
docker push bhitsdev/discovery-server
docker push bhitsdev/document-validator;
docker push bhitsdev/dss;
docker push bhitsdev/edge-server;
docker push bhitsdev/iexhub-pix-pdq;
docker push bhitsdev/iexhub-xdsb;
docker push bhitsdev/master-ui;
docker push bhitsdev/master-ui-api;
docker push bhitsdev/pcm;
#docker push bhitsdev/pep-api;
docker push bhitsdev/pep;
docker push bhitsdev/phr;
docker push bhitsdev/pls;
docker push bhitsdev/provider-ui;
docker push bhitsdev/provider-ui-api;
docker push bhitsdev/staff-ui;
docker push bhitsdev/staff-ui-api;
docker push bhitsdev/try-policy;
#docker push bhitsdev/uaa;
docker push bhitsdev/ums;
docker push bhitsdev/vss;

