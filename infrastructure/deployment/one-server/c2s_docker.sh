#!/bin/bash
#Db  details
export UAA_DB_PASSWORD=admin
export PCM_DB_PASSWORD=admin
export PLS_DB_PASSWORD=admin
export PHR_DB_PASSWORD=admin
export PATIENT_USER_DB_PASSWORD=admin
export AUDIT_DB_PASSWORD=admin
export C2S_BASE_PATH=/usr/local
# Edge server details
export C2S_APP_HOST=bhitsqaapplnx01
export C2S_APP_PORT=80
# SMTP details
export UAA_SMTP_HOST=mail.feisystems.com
export UAA_SMTP_PORT=25
export UAA_SMTP_USER=bhits.mail
export UAA_SMTP_PASSWORD="M@il4Bhit$"
export UAA_PUBLIC_KEY="-----BEGIN PUBLIC KEY-----MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA0m59l2u9iDnMbrXHfqkOrn2dVQ3vfBJqcDuFUK03d+1PZGbVlNCqnkpIJ8syFppW8ljnWweP7+LiWpRoz0I7fYb3d8TjhV86Y997Fl4DBrxgM6KTJOuE/uxnoDhZQ14LgOU2ckXjOzOdTsnGMKQBLCl0vpcXBtFLMaSbpv1ozi8h7DJyVZ6EnFQZUWGdgTMhDrmqevfx95U/16c5WBDOkqwIn7Glry9n9Suxygbf8g5AzpWcusZgDLIIZ7JTUldBb8qU2a0Dl4mvLZOn4wPojfj9Cw2QICsc5+Pwf21fP+hzf+1WSRHbnYv8uanRO0gZ8ekGaghM/2H6gqJbo2nIJwIDAQAB-----END PUBLIC KEY-----"
export HIE_CONNECTION_ENABLE=false
#logback-audit variables
export AUTO_SCAN=false
export SCAN_PERIOD="30 seconds"