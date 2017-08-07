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
    }

    function defaultAppServerConfig() {
        defaultConfig
        # C2S_PROPS Directories
        mkdir /usr/local/java/C2S_PROPS/uaa
        mkdir /usr/local/java/keystore
        mkdir /usr/local/java/C2S_PROPS/ums

        ## Fetch uaa.yml from bhits-dev uaa repo and place it under uaa directory
        curl https://raw.githubusercontent.com/bhits-dev/uaa/master/config-template/uaa.yml > /usr/local/java/C2S_PROPS/uaa/uaa.yml

        ## Fetch scripts files from bhits-dev uaa repo and place it under uaa directory
        curl https://raw.githubusercontent.com/bhits-dev/ums/master/scripts/activate_user_account.sh > /usr/local/java/C2S_PROPS/ums/activate_user_account.sh
        curl https://raw.githubusercontent.com/bhits-dev/ums/master/scripts/create_activate_provider_user.sh > /usr/local/java/C2S_PROPS/ums/create_activate_provider_user.sh


        ## Clone the c2s configuration data rep to '/usr/local/java' sub folder.
        cd /usr/local/java/C2S_PROPS
        git clone https://github.com/bhits-dev/c2s-config-data.git
     }
    function defaultDbServerConfig() {
        defaultConfig

        # C2S_PROPS Directories
        mkdir /usr/local/java/C2S_PROPS/pcm
        mkdir /usr/local/java/C2S_PROPS/phr
        mkdir /usr/local/java/C2S_PROPS/pls
        mkdir /usr/local/java/C2S_PROPS/ums
        mkdir /usr/local/java/C2S_PROPS/vss


        ## Copy the sample provider data sql file to pcm sub folder
        curl https://raw.githubusercontent.com/bhits-dev/pcm/master/pcm-db-sample/insert_consent_attestation_term.sql > /usr/local/java/C2S_PROPS/pcm/insert_consent_attestation_term.sql
        curl https://raw.githubusercontent.com/bhits-dev/pcm/master/pcm-db-sample/insert_consent_revocation_term.sql > /usr/local/java/C2S_PROPS/pcm/insert_consent_revocation_term.sql
        curl https://raw.githubusercontent.com/bhits-dev/pcm/master/pcm-db-sample/insert_purposes.sql > /usr/local/java/C2S_PROPS/pcm/insert_purposes.sql

        ## Copy the sample provider data sql file to pls sub folder
        curl https://raw.githubusercontent.com/bhits-dev/pls/master/pls-db-sample/pls_db_sample.sql > /usr/local/java/C2S_PROPS/pls/pls_db_sample.sql
        curl https://raw.githubusercontent.com/bhits-dev/pls/master/pls-db-sample/insert_state_code_lookup_data.sql > /usr/local/java/C2S_PROPS/pls/insert_state_code_lookup_data.sql

        ## Copy the sample vss data sql file to vss sub folder
        curl https://raw.githubusercontent.com/bhits-dev/vss/master/vss-db-sample/vss_db_sample.sql > /usr/local/java/C2S_PROPS/vss/vss_db_sample.sql

        ## Copy the sample provider data sql file to ums sub folder
        curl https://raw.githubusercontent.com/bhits-dev/ums/master/ums-db-sample/insert_administrative_gender_code_lookup_data.sql > /usr/local/java/C2S_PROPS/ums/insert_administrative_gender_code_lookup_data.sql
        curl https://raw.githubusercontent.com/bhits-dev/ums/master/ums-db-sample/insert_country_code_lookup_data.sql > /usr/local/java/C2S_PROPS/ums/insert_country_code_lookup_data.sql
        curl https://raw.githubusercontent.com/bhits-dev/ums/master/ums-db-sample/insert_locale_lookup_data.sql > /usr/local/java/C2S_PROPS/ums/insert_locale_lookup_data.sql
        curl https://raw.githubusercontent.com/bhits-dev/ums/master/ums-db-sample/insert_npi_identifier_system.sql > /usr/local/java/C2S_PROPS/ums/insert_npi_identifier_system.sql
        curl https://raw.githubusercontent.com/bhits-dev/ums/master/ums-db-sample/insert_role_scopes_lookup_data.sql > /usr/local/java/C2S_PROPS/ums/insert_role_scopes_lookup_data.sql
        curl https://raw.githubusercontent.com/bhits-dev/ums/master/ums-db-sample/insert_state_code_lookup_data.sql > /usr/local/java/C2S_PROPS/ums/insert_state_code_lookup_data.sql

        ## Copy the sample phr data sql file to phr sub folder
         curl https://raw.githubusercontent.com/bhits-dev/phr/master/phr-db-sample/insert_document_type_codes.sql > /usr/local/java/C2S_PROPS/phr/insert_document_type_codes.sql

      }

    function oneServerConfig() {
        defaultAppServerConfig
        defaultDbServerConfig

        ## Copy the docker compose file to ‘/usr/local/java’ sub folder
        curl https://raw.githubusercontent.com/bhits-dev/consent2share/master/infrastructure/deployment/one-server/docker-compose.yml > /usr/local/java/docker-compose.yml

        ## Copy the environment variables file to ‘/etc/profile.d’ sub folder
        curl https://raw.githubusercontent.com/bhits-dev/consent2share/master/infrastructure/scripts/c2s_one_server_env.sh > /etc/profile.d/c2s_env.sh
     }


    function twoServerAppConfig() {
        defaultAppServerConfig

        ## Copy the docker compose file to ‘/usr/local/java’ sub folder
        curl https://raw.githubusercontent.com/bhits-dev/consent2share/master/infrastructure/deployment/two-servers/docker-compose-app-server.yml > /usr/local/java/docker-compose.yml

        ## Copy the environment variables file to ‘/etc/profile.d’ sub folder
        curl https://raw.githubusercontent.com/bhits-dev/consent2share/master/infrastructure/scripts/c2s_two_servers_app_env.sh > /etc/profile.d/c2s_env.sh

     }

    function twoServerDbConfig() {

        defaultDbServerConfig

        ## Copy the docker compose db file to ‘/usr/local/java’ sub folder
        curl https://raw.githubusercontent.com/bhits-dev/consent2share/master/infrastructure/deployment/two-servers/docker-compose-db-server.yml > /usr/local/java/docker-compose.yml

        ## Copy the environment variables file to ‘/etc/profile.d’ sub folder
        curl https://raw.githubusercontent.com/bhits-dev/consent2share/master/infrastructure/scripts/c2s_two_servers_db_env.sh > /etc/profile.d/c2s_env.sh

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
