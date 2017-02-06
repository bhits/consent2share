#!/bin/bash

# Declare methods start
function defaultConfig() {
    # Database details
    export UAA_DB_PASSWORD=admin
    export PCM_DB_PASSWORD=admin
    export PLS_DB_PASSWORD=admin
    export PHR_DB_PASSWORD=admin
    export PATIENT_USER_DB_PASSWORD=admin
    export AUDIT_DB_PASSWORD=admin
    export C2S_BASE_PATH=/usr/local
    export CONFIG_DATA_GIT_DIR=c2s-config-data
    # Edge Server configuraiton
    export C2S_APP_PORT=80
    # SMTP details
    export UAA_SMTP_HOST=your_mail_host
    export UAA_SMTP_PORT=your_mail_port
    export UAA_SMTP_USER=your_mail_username
    export UAA_SMTP_PASSWORD=your_mail_password
    #logback-audit variables
    export AUTO_SCAN=true
    export SCAN_PERIOD="30 seconds"
 }

 function twoServerDbConfig() {
    defaultConfig
 }

twoServerDbConfig