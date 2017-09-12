#!/bin/bash

# Declare methods start
function defaultConfig() {
    # Database details
    export UAA_DB_PASSWORD=admin
    export PCM_DB_PASSWORD=admin
    export PHR_DB_PASSWORD=admin
    export PLS_DB_PASSWORD=admin
    export VSS_DB_PASSWORD=admin
    export UMS_DB_PASSWORD=admin

    export C2S_BASE_PATH=/usr/local
 }

# start method
 function dbServerConfig() {
    defaultConfig
 }

dbServerConfig