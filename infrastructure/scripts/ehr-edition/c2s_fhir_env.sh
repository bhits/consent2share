#!/bin/bash

# Declare methods start
function fhirServerConfig() {
    # Database details
    export HAPI_FHIR_DB_PASSWORD=admin

    export C2S_BASE_PATH=/usr/local
    
   }

fhirServerConfig


