<a name="2.0.0"></a>
# 2.0.0 (2016-10-31)

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

Consent2Share 2.0.0 requires:

* Patient Portal UI v0.17.0: [https://github.com/bhits/patient-portal-ui/releases/tag/0.17.0](https://github.com/bhits/patient-portal-ui/releases/tag/0.17.0)
* Admin Portal UI v0.11.0: [https://github.com/bhits/admin-portal-ui/releases/tag/0.11.0](https://github.com/bhits/admin-portal-ui/releases/tag/0.11.0)
* Patient Registration API v1.12.0: [https://github.com/bhits/registration-api/releases/tag/1.12.0](https://github.com/bhits/registration-api/releases/tag/1.12.0)
+ Patient User API v0.10.0: [https://github.com/bhits/patient-user-api/releases/tag/0.10.0](https://github.com/bhits/patient-user-api/releases/tag/0.10.0)
* Patient Consent Management API v1.16.0: [https://github.com/bhits/pcm-api/releases/tag/1.16.0](https://github.com/bhits/pcm-api/releases/tag/1.16.0)
* Provider Lookup Service API v1.8.0: [https://github.com/bhits/pls-api/releases/tag/1.8.0](https://github.com/bhits/pls-api/releases/tag/1.8.0)
* Try My Policy API v1.11.0: [https://github.com/bhits/try-policy-api/releases/tag/1.11.0](https://github.com/bhits/try-policy-api/releases/tag/1.11.0)
* Patient Health Record API v1.17.0: [https://github.com/bhits/phr-api/releases/tag/1.17.0](https://github.com/bhits/phr-api/releases/tag/1.17.0)
* Policy Enforcement Point API v1.5.0: [https://github.com/bhits/pep-api/releases/tag/1.5.0](https://github.com/bhits/pep-api/releases/tag/1.5.0)
* Context Handler API v1.5.0: [https://github.com/bhits/context-handler/releases/tag/1.5.0](https://github.com/bhits/context-handler/releases/tag/1.5.0)
* Document Segmentation Service API v1.10.0: [https://github.com/bhits/dss-api/releases/tag/1.10.0](https://github.com/bhits/dss-api/releases/tag/1.10.0)
* Document Validator API v0.7.0: [https://github.com/bhits/document-validator/releases/tag/0.7.0](https://github.com/bhits/document-validator/releases/tag/0.7.0)
* Information Exchange Hub v0.2.0: [https://github.com/bhits/iexhub/releases/tag/sprint-09](https://github.com/bhits/iexhub/releases/tag/sprint-09)
* Edge Server v0.9.0: [https://github.com/bhits/edge-server/releases/tag/0.9.0](https://github.com/bhits/edge-server/releases/tag/0.9.0)
* Discovery Server v0.5.0: [https://github.com/bhits/discovery-server/releases/tag/0.5.0](https://github.com/bhits/discovery-server/releases/tag/0.5.0)
* CloudFoundry User Account and Authentication (UAA) Server v3.4.1: [https://github.com/bhits/uaa/releases/tag/task5-azhec](https://github.com/bhits/uaa/releases/tag/task5-azhec)
* Logback Audit v0.0.0: [https://github.com/bhits/logback-audit/releases/tag/0.0.0](https://github.com/bhits/logback-audit/releases/tag/0.0.0)
* Common Libraries v1.7.0: [https://github.com/bhits/common-libraries/releases/tag/1.7.0](https://github.com/bhits/common-libraries/releases/tag/1.7.0)
* Dockerized Java Jar Runner
* Dockerized OpenEMPI
* Dockerized JBoss Drools Guvnor


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
