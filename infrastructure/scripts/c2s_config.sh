#!/bin/bash -x
serverEnv=$1;
if [ "$#" -eq "0" ];
  then
    echo "No arguments supplied. It should be either oneServerConfig or twoServerAppConfig or twoServerDbConfig. "
    exit 1
fi
sudo su << SudoUser
    # Declare methods start

    function defaultConfig() {
        # C2S_PROPS Directories
        mkdir /usr/local/java/
        mkdir /usr/local/java/C2S_PROPS/
        mkdir /usr/local/java/C2S_PROPS/logback-audit
    }

    function defaultAppServerConfig() {
        defaultConfig
        # C2S_PROPS Directories
        mkdir /usr/local/java/C2S_PROPS/uaa
        mkdir /usr/local/java/C2S_PROPS/logback-audit/config-template
        mkdir /usr/local/java/C2S_PROPS/iexhub
        mkdir /usr/local/java/C2S_PROPS/iexhub/config
        mkdir /usr/local/java/C2S_PROPS/iexhub/test
        mkdir /usr/local/java/keystore

        ## Fetch uaa.yml from bhits uaa repo and place it under uaa directory
        curl https://raw.githubusercontent.com/bhits/uaa/master/config-template/uaa.yml > /usr/local/java/C2S_PROPS/uaa/uaa.yml
        ## Copy the logback-audit  config-template file to logback-audit/config-template sub folder
        curl https://raw.githubusercontent.com/bhits/logback-audit/master/config-template/logback-audit-config-logback_included.xml > /usr/local/java/C2S_PROPS/logback-audit/config-template/logback-audit-config-logback_included.xml
        ## Copy all IExHub resource folder files into iexhub/ sub folder
        ## TODO:: Need to replace with directory copy instead of single file copy
        curl https://raw.githubusercontent.com/bhits/iexhub/master/iexhub/src/main/resources/CDA_to_JSON.xsl > /usr/local/java/C2S_PROPS/iexhub/config/CDA_to_JSON.xsl
        curl https://raw.githubusercontent.com/bhits/iexhub/master/iexhub/src/main/resources/IExHub.properties > /usr/local/java/C2S_PROPS/iexhub/config/IExHub.properties
        curl https://raw.githubusercontent.com/bhits/iexhub/master/iexhub/src/main/resources/Sally_Share_b1_Ambulatory_v3.json > /usr/local/java/C2S_PROPS/iexhub/config/Sally_Share_b1_Ambulatory_v3.json
        curl https://raw.githubusercontent.com/bhits/iexhub/master/iexhub/src/main/resources/iexhub-pdq-ATNA_ITI-47.xml > /usr/local/java/C2S_PROPS/iexhub/config/iexhub-pdq-ATNA_ITI-47.xml
        curl https://raw.githubusercontent.com/bhits/iexhub/master/iexhub/src/main/resources/iexhub-pix3u-r-ATNA_ITI-44.xml > /usr/local/java/C2S_PROPS/iexhub/config/iexhub-pix3u-r-ATNA_ITI-44.xml
        curl https://raw.githubusercontent.com/bhits/iexhub/master/iexhub/src/main/resources/iexhub-xds-ATNA_ITI-18.xml > /usr/local/java/C2S_PROPS/iexhub/config/iexhub-xds-ATNA_ITI-18.xml
        curl https://raw.githubusercontent.com/bhits/iexhub/master/iexhub/src/main/resources/iexhub-xds-ATNA_ITI-43.xml > /usr/local/java/C2S_PROPS/iexhub/config/iexhub-xds-ATNA_ITI-43.xml
        curl https://raw.githubusercontent.com/bhits/iexhub/master/iexhub/src/main/resources/iexhub-xdspr-s-ATNA_ITI-41.xml > /usr/local/java/C2S_PROPS/iexhub/config/iexhub-xdspr-s-ATNA_ITI-41.xml
        curl https://raw.githubusercontent.com/bhits/iexhub/master/iexhub/src/main/resources/iexhub_pixq-r-ATNA_ITI-45.xml > /usr/local/java/C2S_PROPS/iexhub/config/iexhub_pixq-r-ATNA_ITI-45.xml
        curl https://raw.githubusercontent.com/bhits/iexhub/master/iexhub/src/main/resources/log4j.properties > /usr/local/java/C2S_PROPS/iexhub/config/log4j.properties

        ## Clone the c2s configuration data rep to '/usr/local/java' sub folder.
        cd /usr/local/java/C2S_PROPS/
        git clone https://github.com/bhits/c2s-config-data.git
     }


    function defaultDbServerConfig() {
        defaultConfig

        # C2S_PROPS Directories
        mkdir /usr/local/java/C2S_PROPS/pls
        mkdir /usr/local/java/C2S_PROPS/logback-audit/init-db

        ## Copy the sample provider data sql file to pls sub folder
        curl https://raw.githubusercontent.com/bhits/pls-api/master/pls-db-sample/pls_db_sample.sql > /usr/local/java/C2S_PROPS/pls/pls_db_sample.sql
        ## Copy the database schema sql file to ‘logback-audit/init-db’ sub folder
        curl https://raw.githubusercontent.com/bhits/logback-audit/master/audit-db/audit_tables-2014-04-07T102006.sql > /usr/local/java/C2S_PROPS/logback-audit/init-db/audit_tables-2014-04-07T102006.sql
     }

    function defaultOneDbServerConfig() {
        # C2S_PROPS Directories
        mkdir /usr/local/java/C2S_PROPS/pls
        mkdir /usr/local/java/C2S_PROPS/logback-audit/init-db

        ## Copy the sample provider data sql file to pls sub folder
        curl https://raw.githubusercontent.com/FEISystems/pls-api/master/pls-db-sample/pls_db_sample.sql > /usr/local/java/C2S_PROPS/pls/pls_db_sample.sql
        ## Copy the database schema sql file to ‘logback-audit/init-db’ sub folder
        curl https://raw.githubusercontent.com/FEISystems/logback-audit/master/audit-db/audit_tables-2014-04-07T102006.sql > /usr/local/java/C2S_PROPS/logback-audit/init-db/audit_tables-2014-04-07T102006.sql
     }

    function oneServerConfig() {
        defaultAppServerConfig
        defaultOneDbServerConfig

        ## Copy the docker compose file to ‘/usr/local/java’ sub folder
        curl https://raw.githubusercontent.com/bhits/consent2share/master/infrastructure/deployment/one-server/docker-compose.yml > /usr/local/java/docker-compose.yml

        ## Copy the environment variables file to ‘/etc/profile.d’ sub folder
        curl https://raw.githubusercontent.com/bhits/consent2share/master/infrastructure/scripts/c2s_one_server_env.sh > /etc/profile.d/c2s_env.sh
     }


    function twoServerAppConfig() {
        defaultAppServerConfig

        ## Copy the docker compose file to ‘/usr/local/java’ sub folder
        curl https://raw.githubusercontent.com/bhits/consent2share/master/infrastructure/deployment/two-servers/docker-compose-app-server.yml > /usr/local/java/docker-compose.yml

        ## Copy the environment variables file to ‘/etc/profile.d’ sub folder
        curl https://raw.githubusercontent.com/bhits/consent2share/master/infrastructure/scripts/c2s_two_servers_app_env.sh > /etc/profile.d/c2s_env.sh

     }

    function twoServerDbConfig() {

        defaultDbServerConfig

        ## Copy the docker compose db file to ‘/usr/local/java’ sub folder
        curl https://raw.githubusercontent.com/bhits/consent2share/master/infrastructure/deployment/two-servers/docker-compose-db-server.yml > /usr/local/java/docker-compose.yml

        ## Copy the environment variables file to ‘/etc/profile.d’ sub folder
        curl https://raw.githubusercontent.com/bhits/consent2share/master/infrastructure/scripts/c2s_two_servers_db_env.sh > /etc/profile.d/c2s_env.sh

     }
    # Declare methods end

    # Start running script
    echo "server env " : $serverEnv
    if [ $serverEnv == "oneServerConfig" ];
    then
       oneServerConfig
    elif [ $serverEnv == "twoServerAppConfig" ];
    then
        twoServerAppConfig
    elif [ $serverEnv == "twoServerDbConfig" ];
    then
        twoServerDbConfig
    fi
SudoUser
