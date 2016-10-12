<a name="2.0.0"></a>
# 2.0.0 (2016-10-31)

### Features

* **Patient Registration:** collect patient demographic and register patient in Consent2Share and HIE (if connected)
* **Security:** use OAuth 2.0 and OpenID Connect for authentication and authorization
* **Provider Management:** allow patients to search providers and mange their providers
* **Consent Management:** allow patients to create, sign and revoke consent policies that determine the level of
privacy applied to the patient’s health record when it is shared between providers
* **Try Policy:** allow patients to try-their-policy against their medical record or a sample medical record in order to view the segmented medical record
* **Value Set Management:** provide API to determine sensitivity categories for medical record entries
* **Data Segmentation:** handle the segmentation of a patient’s sensitive health information per their consent
* **View PHI:** allow patients to view medical records/health information retrieved from HIE (if connected)
* **Document Validation:** provide API to validate C32, CCDA R1 and 2.1 documents based on schema and/or schematron rules

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
* Common Libraries v1.7.0: [https://github.com/bhits/common-libraries/releases/tag/1.7.0](https://github.com/bhits/common-libraries/releases/tag/1.7.0)


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