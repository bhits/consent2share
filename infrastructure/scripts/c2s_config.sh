#!/bin/bash
echo "This script is used to setup server configuration for Consent2Share."

# server option to setup
serverOption[1]="1. EHR Edition App Server"
serverOption[2]="2. EHR Edition DB Server"
serverOption[3]="3. EHR Edition FHIR Server"
serverOption[4]="4. HIE Edition App Server"
serverOption[5]="5. HIE Edition Db Server"
serverOption[6]="6. HIE Edition Hieos Server"

#function will be executed based on choice
serverConfig[1]=ehrEditionAppServerConfig
serverConfig[2]=ehrEditionDbServerConfig
serverConfig[3]=ehrEditionFhirServerConfig
serverConfig[4]=hieEditionAppServerConfig
serverConfig[5]=hieEditionDbServerConfig
serverConfig[6]=hieEditionHieosServerConfig

for each in "${serverOption[@]}"
do
  echo "$each"
done

echo -n "Please select a server to setup:"
read serverEnv

if [[ -z "$serverEnv" ]]
  then
    echo "No server option selected. "
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

        ## Fetch uaa.yml from bhits uaa repo and place it under uaa directory
        curl https://raw.githubusercontent.com/bhits/uaa/master/config-template/uaa.yml > /usr/local/java/C2S_PROPS/uaa/uaa.yml

        ## Fetch scripts files from bhits uaa repo and place it under uaa directory
        curl https://raw.githubusercontent.com/bhits/ums/master/scripts/activate_user_account.sh > /usr/local/java/C2S_PROPS/ums/activate_user_account.sh
        curl https://raw.githubusercontent.com/bhits/ums/master/scripts/create_activate_provider_user.sh > /usr/local/java/C2S_PROPS/ums/create_activate_provider_user.sh


        ## Clone the c2s configuration data rep to '/usr/local/java' sub folder.
        cd /usr/local/java/C2S_PROPS
        git clone https://github.com/bhits/c2s-config-data.git
     }
    function defaultDbServerConfig() {
        defaultConfig

        # C2S_PROPS Directories
        mkdir /usr/local/java/C2S_PROPS/pcm
        mkdir /usr/local/java/C2S_PROPS/phr
        mkdir /usr/local/java/C2S_PROPS/pls
        mkdir /usr/local/java/C2S_PROPS/ums
        mkdir /usr/local/java/C2S_PROPS/vss


        ## Copy the sample consent config data sql files to pcm sub folder
        curl https://raw.githubusercontent.com/bhits/pcm/master/pcm-db-sample/insert_consent_attestation_term.sql > /usr/local/java/C2S_PROPS/pcm/insert_consent_attestation_term.sql
        curl https://raw.githubusercontent.com/bhits/pcm/master/pcm-db-sample/insert_consent_revocation_term.sql > /usr/local/java/C2S_PROPS/pcm/insert_consent_revocation_term.sql
        curl https://raw.githubusercontent.com/bhits/pcm/master/pcm-db-sample/insert_purposes.sql > /usr/local/java/C2S_PROPS/pcm/insert_purposes.sql

        ## Copy the sample provider config data sql files to pls sub folder
         curl https://raw.githubusercontent.com/bhits/pls/master/pls-db-sample/insert_state_code_lookup_data.sql > /usr/local/java/C2S_PROPS/pls/insert_state_code_lookup_data.sql
         curl https://raw.githubusercontent.com/bhits/pls/master/pls-db-sample/pls_db_sample.sql > /usr/local/java/C2S_PROPS/pls/pls_db_sample.sql

        ## Copy the sample vss config data sql file to vss sub folder
        curl https://raw.githubusercontent.com/bhits/vss/master/vss-db-sample/vss_db_sample.sql > /usr/local/java/C2S_PROPS/vss/vss_db_sample.sql

        ## Copy the sample user managaement config data sql files to ums sub folder
        curl https://raw.githubusercontent.com/bhits/ums/master/ums-db-sample/insert_administrative_gender_code_lookup_data.sql > /usr/local/java/C2S_PROPS/ums/insert_administrative_gender_code_lookup_data.sql
        curl https://raw.githubusercontent.com/bhits/ums/master/ums-db-sample/insert_country_code_lookup_data.sql > /usr/local/java/C2S_PROPS/ums/insert_country_code_lookup_data.sql
        curl https://raw.githubusercontent.com/bhits/ums/master/ums-db-sample/insert_locale_lookup_data.sql > /usr/local/java/C2S_PROPS/ums/insert_locale_lookup_data.sql
        curl https://raw.githubusercontent.com/bhits/ums/master/ums-db-sample/insert_npi_identifier_system.sql > /usr/local/java/C2S_PROPS/ums/insert_npi_identifier_system.sql
        curl https://raw.githubusercontent.com/bhits/ums/master/ums-db-sample/insert_role_scopes_lookup_data.sql > /usr/local/java/C2S_PROPS/ums/insert_role_scopes_lookup_data.sql
        curl https://raw.githubusercontent.com/bhits/ums/master/ums-db-sample/insert_state_code_lookup_data.sql > /usr/local/java/C2S_PROPS/ums/insert_state_code_lookup_data.sql

        ## Copy the sample phr data sql file to phr sub folder
         curl https://raw.githubusercontent.com/bhits/phr/master/phr-db-sample/insert_document_type_codes.sql > /usr/local/java/C2S_PROPS/phr/insert_document_type_codes.sql

      }

    function ehrEditionAppServerConfig() {
        defaultAppServerConfig

        ## Copy the docker compose file to ‘/usr/local/java’ sub folder
        curl https://raw.githubusercontent.com/bhits/consent2share/master/infrastructure/deployment/ehr-edition/docker-compose-app-server.yml > /usr/local/java/docker-compose.yml

        ## Copy the environment variables file to ‘/etc/profile.d’ sub folder
        curl https://raw.githubusercontent.com/bhits/consent2share/master/infrastructure/scripts/ehr-edition/c2s_app_env.sh > /etc/profile.d/c2s_env.sh

     }

    function ehrEditionDbServerConfig() {

        defaultDbServerConfig

        ## Copy the docker compose db file to ‘/usr/local/java’ sub folder
        curl https://raw.githubusercontent.com/bhits/consent2share/master/infrastructure/deployment/ehr-edition/docker-compose-db-server.yml > /usr/local/java/docker-compose.yml

        ## Copy the environment variables file to ‘/etc/profile.d’ sub folder
        curl https://raw.githubusercontent.com/bhits/consent2share/master/infrastructure/scripts/ehr-edition/c2s_db_env.sh > /etc/profile.d/c2s_env.sh

     }

    function ehrEditionFhirServerConfig() {

        defaultConfig

        ## Copy the docker compose db file to ‘/usr/local/java’ sub folder
        curl https://raw.githubusercontent.com/bhits/consent2share/master/infrastructure/deployment/ehr-edition/docker-compose-fhir-server.yml > /usr/local/java/docker-compose.yml

        ## Copy the environment variables file to ‘/etc/profile.d’ sub folder
        curl https://raw.githubusercontent.com/bhits/consent2share/master/infrastructure/scripts/ehr-edition/c2s_fhir_env.sh > /etc/profile.d/c2s_env.sh
     }

    function hieEditionAppServerConfig() {
        defaultAppServerConfig

        mkdir /usr/local/java/C2S_PROPS/iexhub/config

        curl https://raw.githubusercontent.com/bhits/iexhub/master/iexhub/src/main/resources/IExHub.properties > /usr/local/java/C2S_PROPS/iexhub/config/IExHub.properties

        ## Copy the docker compose file to ‘/usr/local/java’ sub folder
        curl https://raw.githubusercontent.com/bhits/consent2share/master/infrastructure/deployment/hie-edition/docker-compose-app-server.yml > /usr/local/java/docker-compose.yml

        ## Copy the environment variables file to ‘/etc/profile.d’ sub folder
        curl https://raw.githubusercontent.com/bhits/consent2share/master/infrastructure/scripts/hie-edition/c2s_app_env.sh > /etc/profile.d/c2s_env.sh

     }

    function hieEditionDbServerConfig() {

        defaultDbServerConfig

        ## Copy the docker compose db file to ‘/usr/local/java’ sub folder
        curl https://raw.githubusercontent.com/bhits/consent2share/master/infrastructure/deployment/hie-edition/docker-compose-db-server.yml > /usr/local/java/docker-compose.yml

        ## Copy the environment variables file to ‘/etc/profile.d’ sub folder
        curl https://raw.githubusercontent.com/bhits/consent2share/master/infrastructure/scripts/hie-edition/c2s_db_env.sh > /etc/profile.d/c2s_env.sh

     }

    function hieEditionHieosServerConfig() {

        defaultConfig

        # OpenEMPI initial DB Directories
        mkdir /usr/local/java/C2S_PROPS/openempi-db

        # HIEOS initial DB Directories
        mkdir /usr/local/java/C2S_PROPS/hieos-db
        mkdir /usr/local/java/C2S_PROPS/hieos-db/adt
        mkdir /usr/local/java/C2S_PROPS/hieos-db/log
        mkdir /usr/local/java/C2S_PROPS/hieos-db/registry
        mkdir /usr/local/java/C2S_PROPS/hieos-db/repository


        # Copy OpenEMPI SQL scripts
        curl https://raw.githubusercontent.com/bhits/dockerized-openempi/master/openempi-db/create_new_database_schema-2.2.0.sql > /usr/local/java/C2S_PROPS/openempi-db/create_new_database_schema-2.2.0.sql
        curl https://raw.githubusercontent.com/bhits/dockerized-openempi/master/openempi-db/update_database_schema-2.2.1.sql > /usr/local/java/C2S_PROPS/openempi-db/update_database_schema-2.2.1.sql
        curl https://raw.githubusercontent.com/bhits/dockerized-openempi/master/openempi-db/update_database_schema-2.2.3.sql > /usr/local/java/C2S_PROPS/openempi-db/update_database_schema-2.2.3.sql
        curl https://raw.githubusercontent.com/bhits/dockerized-openempi/master/openempi-db/update_database_schema-2.2.4.sql > /usr/local/java/C2S_PROPS/openempi-db/update_database_schema-2.2.4.sql
        curl https://raw.githubusercontent.com/bhits/dockerized-openempi/master/openempi-db/update_database_schema-2.2.6.sql > /usr/local/java/C2S_PROPS/openempi-db/update_database_schema-2.2.6.sql
        curl https://raw.githubusercontent.com/bhits/dockerized-openempi/master/openempi-db/update_database_schema-2.2.7.sql > /usr/local/java/C2S_PROPS/openempi-db/update_database_schema-2.2.7.sql

        # Copy HIEOS SQL scripts
        curl https://raw.githubusercontent.com/bhits/dockerized-hieos/master/hieos-db/adt/createadtddl.sql > /usr/local/java/C2S_PROPS/hieos-db/adt/createadtddl.sql
        curl https://raw.githubusercontent.com/bhits/dockerized-hieos/master/hieos-db/log/createlogddl.sql > /usr/local/java/C2S_PROPS/hieos-db/log/createlogddl.sql
        curl https://raw.githubusercontent.com/bhits/dockerized-hieos/master/hieos-db/registry/createregistryddl.sql > /usr/local/java/C2S_PROPS/hieos-db/registry/createregistryddl.sql
        curl https://raw.githubusercontent.com/bhits/dockerized-hieos/master/hieos-db/repository/createrepoddl.sql.sql > /usr/local/java/C2S_PROPS/hieos-db/repository/createrepoddl.sql.sql


        ## Copy the docker compose db file to ‘/usr/local/java’ sub folder
        curl https://raw.githubusercontent.com/bhits/consent2share/master/infrastructure/deployment/hie-edition/docker-compose-hieos-server.yml > /usr/local/java/docker-compose.yml

        ## Copy the environment variables file to ‘/etc/profile.d’ sub folder
        curl https://raw.githubusercontent.com/bhits/consent2share/master/infrastructure/scripts/hie-edition/c2s_hieos_env.sh > /etc/profile.d/c2s_env.sh

     }


    # Declare methods end

    # Start running script
    echo "Server env " : ${serverOption[$serverEnv]}
    ${serverConfig[$serverEnv]}
SudoUser