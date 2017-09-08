#!/bin/bash

# Declare methods start
function defaultConfig() {
    # Database details
    export ADT_DB_PASSWORD=admin
    export LOG_DB_PASSWORD=admin
    export REPO_DB_PASSWORD=admin
    export REGISTRY_DB_PASSWORD=admin
    
    export C2S_BASE_PATH=/usr/local
   }

# start method
 function hieosServerConfig() {
    defaultConfig
 }
 
hieosServerConfig

