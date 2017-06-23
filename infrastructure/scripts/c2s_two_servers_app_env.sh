#!/bin/bash

# Declare methods start
function defaultConfig() {
    # Database details
    export UAA_DB_PASSWORD=admin
    export PCM_DB_PASSWORD=admin
    export PLS_DB_PASSWORD=admin
    export VSS_DB_PASSWORD=admin
    export UMS_DB_PASSWORD=admin
    export HAPI_FHIR_DB_PASSWORD=admin
    export HAPI_FHIR_DB_PORT=3311

    export C2S_BASE_PATH=/usr/local
    export CONFIG_DATA_GIT_DIR=c2s-config-data
    # Edge Server configuraiton
    export C2S_APP_PORT=80

    # SMTP details
    export UAA_SMTP_HOST=your_mail_host
    export UAA_SMTP_PORT=your_mail_port
    export UAA_SMTP_USER=your_mail_username
    export UAA_SMTP_PASSWORD=your_mail_password
   }

function c2sRl3.2.0Versions(){
    export C2S_UI_VERSION=0.4.0
    export C2S_UI_API_VERSION=0.4.0
    export CONFIG_SERVER_VERSION=0.3.0
    export CONTEXT_HANDLER_VERSION=2.1.0
    export DISCOVERY_SERVER_VERSION=0.11.0
    export DOCUMENT_VALIDATOR_VERSION=1.0.0
    export DSS_VERSION=2.2.0
    export EDGE_SERVER_VERSION=0.18.0
    export GUVNOR_VERSION=5.5.0
    export HAPI_FHIR_VERSION=2.3-01
    export PCM_VERSION=2.2.0
    export PEP_VERSION=2.0.0
    export PEP_API_VERSION=2.0.0
    export PHR_VERSION=2.0.0
    export PLS_VERSION=3.1.0
    export PROVIDER_UI_VERSION=0.1.0
    export PROVIDER_UI_API_VERSION=0.1.0
    export STAFF_UI_VERSION=0.2.0
    export STAFF_UI_API_VERSION=0.2.0
    export TRY_POLICY_VERSION=2.0.0
    export UAA_VERSION=3.4.1-07
    export UMS_VERSION=0.2.0
    export VSS_VERSION=0.4.0
}

function twoServerAppConfig() {
    defaultConfig
    c2sRl3.2.0Versions
    # This variable is only required in 'two-servers' deployment scenario, so it MUST be uncommented and configured accordingly in 'two-servers' deployment.
    export C2S_DB_HOST=your_db_server_host

    # Edge Server configuraiton
    export C2S_APP_HOST=your_app_server_host

    # Config Server Configuration
    export BASIC_AUTH_USER=your_basic_auth_user
    export BASIC_AUTH_PASSWORD=your_basic_auth_password

    # This variable is only required to give server environment specific profile
    # data added in config-data repository
    # export ENV_APP_PROFILE=your_app_Server_specific_profile

    # This variable is only required if encrypted values are available in the server environment specific profile
    # conofig data variables
    #export CONFIG_DATA_ENCRYPT_KEY=your_config_data_encrypt
 }

twoServerAppConfig


