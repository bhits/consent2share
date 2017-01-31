#!/bin/bash
# Database details
# This variable is only required in 'two-servers' deployment scenario, so it MUST be uncommented and configured accordingly in 'two-servers' deployment.
#export C2S_DB_HOST=your_db_server_host
export UAA_DB_PASSWORD=admin
export PCM_DB_PASSWORD=admin
export PLS_DB_PASSWORD=admin
export PHR_DB_PASSWORD=admin
export PATIENT_USER_DB_PASSWORD=admin
export AUDIT_DB_PASSWORD=admin
export C2S_BASE_PATH=/usr/local
# Edge Server configuraiton
export C2S_APP_HOST=your_app_server_host
export C2S_APP_PORT=80
# SMTP details
export UAA_SMTP_HOST=your_mail_host
export UAA_SMTP_PORT=your_mail_port
export UAA_SMTP_USER=your_mail_username
export UAA_SMTP_PASSWORD=your_mail_password
#logback-audit variables
export AUTO_SCAN=true
export SCAN_PERIOD="30 seconds"
#uaa client id keys
export UAA_ADMIN_UI_SECRET=changeit
export UAA_PP_UI_SECRET=changeit
#conofig server variables
export BASIC_AUTH_USER=your_basic_auth_user
export BASIC_AUTH_PASSWORD=your_basic_auth_password
#conofig data variables
export CONFIG_DATA_ENCRYPT_KEY=your_config_data_encrypt