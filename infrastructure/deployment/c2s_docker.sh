#!/bin/bash
#Db server details
export C2S_DB_HOST=bhitsqadblnx01
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
export UAA_PUBLIC_KEY="-----BEGIN PUBLIC KEY-----MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvQlpuZSYUKHOkGCW4AwWKWgf/jukU0vrZQ/6vfAU8tmCYoPJfqsqA9zgJbvj8UPQ/sjmY7txjpAw6qTz3/yW4lSkkZyz25eSy9+/vUY/WSghHxjYWnhaGDBD5Qgs7TmzotRvia33rZxtcq1Osylt/WufFc0RClPwEqLQCISYMiC4TnccE+wkFaDAwfgVIzEoHhiOeItRvgghYEHHDuFi1uYNo5XvyYop5ulT4HZuS7wccm2jCuzHAeJULxN7epc7juib93OsLyEWfqfk/Jif nW9n1Kr7Ph6teDXTsZ/jFM/nFFfNpJeNfW2bgOG/3fJWf8zGhbTx426uznn3iG0wWwIDAQAB-----END PUBLIC KEY-----"
export HIE_CONNECTION_ENABLE=false
#logback-audit variables
export AUTO_SCAN=false
export SCAN_PERIOD="30 seconds"