<a name="2.0.0"></a>
# Consent2Share 2.0.0 (2016-10-31)

### Features

* **Patient Registration:** Collect patient demographic and register patient in Consent2Share and HIE (if connected)
* **Security:** Use OAuth 2.0 and OpenID Connect for authentication and authorization
* **Provider Management:** Allow patients to search, delete, and manage their providers
* **Consent Management:** Allow patients to create, sign, and revoke consent policies that determine the level of privacy applied to the patient’s health record when it is shared between providers
* **Try Policy:** : Allow patients to use the Try My Policy tool against a medical record in order to view the effects of their consent directive segmentation choices
* **Value Set Management:** Provide an API to determine sensitivity categories for medical record entries
* **Data Segmentation:** Handle the segmentation of patients’ sensitive health information according to their consent directive
* **View PHI:** Allow patients to view medical records and health information retrieved from an HIE (if connected)
* **Document Validation:** Provide an API to validate C32, C-CDA R1 and 2.1 documents based on schema and/or schematron rules

### NOTES:

Consent2Share 2.0.0 release includes:

1. Patient Portal UI 0.20.0: [https://github.com/bhits/patient-portal-ui/releases/tag/0.20.0](https://github.com/bhits/patient-portal-ui/releases/tag/0.20.0)
* Admin Portal UI 0.13.0: [https://github.com/bhits/admin-portal-ui/releases/tag/0.13.0](https://github.com/bhits/admin-portal-ui/releases/tag/0.13.0)
* Patient Registration API 1.15.0: [https://github.com/bhits/registration-api/releases/tag/1.15.0](https://github.com/bhits/registration-api/releases/tag/1.15.0)
* Patient User API 0.12.0: [https://github.com/bhits/patient-user-api/releases/tag/0.12.0](https://github.com/bhits/patient-user-api/releases/tag/0.12.0)
* Patient Consent Management API 1.18.0: [https://github.com/bhits/pcm-api/releases/tag/1.18.0](https://github.com/bhits/pcm-api/releases/tag/1.18.0)
* Provider Lookup Service API 1.11.0: [https://github.com/bhits/pls-api/releases/tag/1.11.0](https://github.com/bhits/pls-api/releases/tag/1.11.0)
* Try My Policy API 1.13.0: [https://github.com/bhits/try-policy-api/releases/tag/1.13.0](https://github.com/bhits/try-policy-api/releases/tag/1.13.0)
* Patient Health Record API 1.19.0: [https://github.com/bhits/phr-api/releases/tag/1.19.0](https://github.com/bhits/phr-api/releases/tag/1.19.0)
* Policy Enforcement Point API 1.7.0: [https://github.com/bhits/pep-api/releases/tag/1.7.0](https://github.com/bhits/pep-api/releases/tag/1.7.0)
* Context Handler API 1.8.0: [https://github.com/bhits/context-handler/releases/tag/1.8.0](https://github.com/bhits/context-handler/releases/tag/1.8.0)
* Document Segmentation Service API 1.13.0: [https://github.com/bhits/dss-api/releases/tag/1.13.0](https://github.com/bhits/dss-api/releases/tag/1.13.0)
* Document Validator API 0.9.0: [https://github.com/bhits/document-validator/releases/tag/0.9.0](https://github.com/bhits/document-validator/releases/tag/0.9.0)
* Information Exchange Hub 0.3.0: [https://github.com/bhits/iexhub/releases/tag/0.3.0](https://github.com/bhits/iexhub/releases/tag/0.3.0)
* Edge Server 0.11.0: [https://github.com/bhits/edge-server/releases/tag/0.11.0](https://github.com/bhits/edge-server/releases/tag/0.11.0)
* Discovery Server 0.8.0: [https://github.com/bhits/discovery-server/releases/tag/0.8.0](https://github.com/bhits/discovery-server/releases/tag/0.8.0)
* CloudFoundry User Account and Authentication (UAA) Server 3.4.1-01: [https://github.com/bhits/uaa/releases/tag/3.4.1-01](https://github.com/bhits/uaa/releases/tag/3.4.1-01)
* Logback Audit 0.6.1: [https://github.com/bhits/logback-audit/releases/tag/v_0.6.1](https://github.com/bhits/logback-audit/releases/tag/v_0.6.1)
* Common Libraries 1.7.0: [https://github.com/bhits/common-libraries/releases/tag/1.7.0](https://github.com/bhits/common-libraries/releases/tag/1.7.0)
* Java Jar Runner 8u102-jre: [https://github.com/bhits/java-jar-runner/releases/tag/1.7.0](https://github.com/bhits/java-jar-runner/releases/tag/1.7.0)
* Dockerized JBoss Drools Guvnor 5.5.0: [https://github.com/bhits/dockerized-drools-guvnor/releases/tag/5.5.0](https://github.com/bhits/dockerized-drools-guvnor/releases/tag/5.5.0)
* Spring Boot Application Runner 1.8.0: [https://github.com/bhits/spring-boot-app-runner/releases/tag/2.2.9](https://github.com/bhits/spring-boot-app-runner/releases/tag/1.8.0)


[//]: # (The followings are commented out full template for Release Notes, for each new release, using this)
[//]: # (template to fill out information and put the Release Notes at the top of this file.)
[//]: # (And also paste the new Release Notes as inline description when creating the new Github release)
[//]: # (in consent2share Github repository's release tab.)

[//]: # (<a name="x.x.x"></a>)
[//]: # (# x.x.x (yyyy-mm-dd)

[//]: # (### Features)

[//]: # (* **pcm-api:** provide what feature)
[//]: # (* **pls-api:** implement what feature)


[//]: # (### Bug Fixes)

[//]: # (* **pcm-api:** fix what)
[//]: # (* **pls-api:** fix what)


[//]: # (### Code Refactoring)

[//]: # (* **pcm-api:** remove what)
[//]: # (* **pcm-api:** refactor what)


[//]: # (### BREAKING CHANGES)

[//]: # (* **pcm-api:** break change )
[//]: # (* **pcm-api:** refactor what)

[//]: # (### NOTES:)

[//]: # (Consent2Share x.x.x requires:)

[//]: # (* Patient Portal UI x.x.x: [release url](http://)
[//]: # (* Admin Portal UI x.x.x: [release url](http://)
