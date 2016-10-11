# Consent2Share

Consent2Share (C2S) is an open source software application sponsored by the U.S. Substance Abuse and Mental Health Administration (SAMHSA) which is designed to support Behavioral Health’s integration with Health Information Exchanges (HIE).  Behavioral Healthcare includes Substance Abuse and Mental Health treatment and providers in these domains of care face special privacy regulations which can make the exchange of health care information with other providers more difficult than in other areas of healthcare.

Consent2Share implements the concepts of Data Segmentation for Privacy (DS4P) which was sponsored and defined by the U.S. Office of the National Coordinator for Health Information Technology (ONC).  The implementation of DS4P concepts and standards will allow patients receiving behavioral health treatment to share their health information through the nation’s HIE’s while providing improved protection of their privacy.

## Technology Stack

The technology stack used for Consent2Share includes, but not limited to:

+ [Oracle Java 8](http://www.oracle.com/technetwork/java/javase/overview/java8-2100321.html)
+ [Spring Framework](https://projects.spring.io/spring-framework/)
+ [Spring Boot](https://projects.spring.io/spring-boot/)
+ [Spring Cloud](http://projects.spring.io/spring-cloud/)
+ [Apache Maven](https://maven.apache.org/)
+ [Apache Tomcat](http://tomcat.apache.org/)
+ [CloudFoundry User Account and Authentication (UAA) Server](https://github.com/cloudfoundry/uaa)
+ [ClamAV](https://www.clamav.net/)
+ [JBoss Drools Expert](https://docs.jboss.org/drools/release/5.4.0.Final/drools-expert-docs/html_single/)
+ [JBoss Drools Guvnor](https://docs.jboss.org/drools/release/5.5.0.Final/drools-guvnor-docs/html_single/)
+ [Logback Audit](http://audit.qos.ch/)
+ [MySQL](https://www.mysql.com/)
+ [Flyway](https://flywaydb.org/)
+ [Redis](http://redis.io/)
+ [JavaScript - ES5](https://es5.github.io/)
+ [HTML5](https://www.w3.org/TR/html5/)
+ [CSS3](https://www.w3.org/TR/CSS/)
+ [AngularJS](https://angularjs.org/)
+ [Bootstrap](http://getbootstrap.com/)
+ [Grunt](http://gruntjs.com/)
+ [Docker and Docker Compose](https://www.docker.com/)

## Architecture

Consent2Share employs a microservice architecture which makes it highly scalable and resilient. Majority of C2S microservices are implemented as [Spring Boot](http://projects.spring.io/spring-boot/) applications and utilize several [Spring Cloud](http://projects.spring.io/spring-cloud/) projects including [Spring Cloud Netflix](http://cloud.spring.io/spring-cloud-netflix/) and [Spring Cloud Security](http://cloud.spring.io/spring-cloud-security/).

*C2S Technical Blueprint* can be used as a good reference that shows the big picture of C2S architecture, the technical components, and the high level interaction between them. Please see the documents in [release page](../../releases) for the applicable version of *C2S Technical Blueprint* document.

The C2S components can be grouped as the following:

### Common Libraries

The C2S has a set of common libraries that are being used across the microservices. These libraries mostly contain basic utility functions. The complex domain features are implemented as microservices as described in the following sections. **The common libraries are needed to be built and installed to the local maven repository before building any other C2S microservices in order to prevent any dependency resolution issues.**

### User Interfaces

C2S currently offers 2 User Interfaces: Patient Portal UI and Admin Portal UI.

#### Patient Portal UI

The Patient Portal UI (patient-portal-ui) is a patient user interface module of Consent2share (C2S) used by the patient to manage his or her health information. The patients can use this application to register, log in, visit their home page, review their health records, conduct consent management activities, and view prior consent decisions.

Source Code Repository: [https://github.com/bhits/patient-portal-ui](https://github.com/bhits/patient-portal-ui)

#### Admin Portal UI

The Admin Portal UI (admin-portal-ui) is an administrative user interface module of the Consent2Share (C2S) used to create and manage patient accounts. Administrative staff can use this to log in, visit their home page, create patient accounts, and manage patient information.

Source Code Repository: [https://github.com/bhits/admin-portal-ui](https://github.com/bhits/admin-portal-ui)

### Microservices

The backend of C2S consists of many microservices that are small yet focused on certain domain areas. Some of these microservices also have persistence using [MySQL](https://www.mysql.com/) and are responsible for enforcing the specific domain rules.

#### Patient Registration API

The Patient Registration (patient-registration) API is a component of Consent2Share (C2S) that manages the patient account creation process and persists patient demographics in Patient Health Record (PHR) API domain. If it is configured, it also registers the patient demographics to Health Information Exchange (HIE) via Information Exchange Hub (IExHub).

Source Code Repository: [https://github.com/bhits/registration-api](https://github.com/bhits/registration-api)

#### Patient User API

Source Code Repository: [https://github.com/bhits/patient-user-api](https://github.com/bhits/patient-user-api)

#### Patient Consent Management API

Source Code Repository: [https://github.com/bhits/pcm-api](https://github.com/bhits/pcm-api)

#### Provider Lookup Service API

The Provider Lookup Service (PLS) API is responsible for storing provider information as a provider directory. PLS also provides a RESTful API for querying providers by using several query parameters including *first name, last name, gender, address, and phone number* for individual providers, and *organization name, address, and phone number* for organizational providers.

Source Code Repository: [https://github.com/bhits/pls-api](https://github.com/bhits/pls-api)

#### Try My Policy API

Source Code Repository: [https://github.com/bhits/try-policy-api](https://github.com/bhits/try-policy-api)

#### Patient Health Record API

The Patient Health Record (PHR) API is responsible for storing patient identities in the Consent2Share (C2S) domain, and for serving patient health records from Health Information Exchange (HIE) via Information Exchange Hub (IExHub). Currently, only patient demographics and C2S Medical Record Numbers (MRN) are persisted in PHR domain.

Source Code Repository: [https://github.com/bhits/phr-api](https://github.com/bhits/phr-api)

#### Policy Enforcement Point API

The Policy Enforcement Point (PEP) API is a RESTful web service for the Access Control Service (ACS) entry point. PEP delegates the access decision to the Context Handler API, and it utilizes the Document Segmentation Service (DSS) for segmenting CCD documents according to a patient's granular consent. PEP gives the same response for both *"No applicable consents"* and *"No documents found"* cases to avoid exposing the existence of a patient's consent.

Source Code Repository: [https://github.com/bhits/pep-api](https://github.com/bhits/pep-api)

#### Context Handler API

The Context Handler (CTX) API is a RESTful web service responsible for making the access decisions (PERMIT/DENY) based on the given request contexts. It uses a Policy Decision Point (PDP) to evaluate access requests against authorization policies before issuing access decisions. The PDP uses [HERAS-AF](https://bitbucket.org/herasaf/herasaf-xacml-core/overview), an open source XACML 2.0 implementation, for XACML evaluation and uses Patient Consent Management (PCM) database as a local policy repository to retrieve XACML policies that are generated from patients’ consents.

Source Code Repository: [https://github.com/bhits/context-handler](https://github.com/bhits/context-handler)

#### Document Segmentation Service API

Source Code Repository: [https://github.com/bhits/dss-api](https://github.com/bhits/dss-api)

#### Document Validator API

Source Code Repository: [https://github.com/bhits/document-validator](https://github.com/bhits/document-validator)

#### Information Exchange Hub

Source Code Repository: [https://github.com/bhits/iexhub](https://github.com/bhits/iexhub)

### Supporting Infrastructure Services

C2S uses [Eureka](https://github.com/Netflix/eureka) and [Zuul](https://github.com/Netflix/zuul) via [Spring Cloud Netflix](http://cloud.spring.io/spring-cloud-netflix/) project to facilitate microservice orchestration, dynamic service discovery, load balancing, security and server side routing. There are two major supporting infrastructure services in C2S based on these projects: Edge Server (Zuul) and Discovery Server (Eureka).

#### Edge Server

Source Code Repository: [https://github.com/bhits/edge-server](https://github.com/bhits/edge-server)

#### Discovery Server

The Discovery Server *([Eureka from Netflix OSS](https://github.com/Netflix/eureka))* is one of the key tenets of a microservice based architecture. It facilitates the Consent2Share (C2S) microservices to dynamically discover each other and promotes the scalability of C2S system. It provides the following:

+ Registry of Consent2Share (C2S) service instances,
+ Provides means for C2S service instances to register, de-register and query instances with the registry,
+ Registry propagation to other C2S microservice (Eureka client) and Discovery Server (Eureka server cluster) instances

Source Code Repository: [https://github.com/bhits/discovery-server](https://github.com/bhits/discovery-server)

### Third-party Services

C2S uses several third-party open source services for authentication, authorization, business rules management and auditing.

#### CloudFoundry User Account and Authentication (UAA) Server

C2S uses UAA for authentication, authorization, issuing tokens for client applications and user account management. Please see [UAA Source Code Repository](https://github.com/cloudfoundry/uaa) and [UAA API Documentation](http://docs.cloudfoundry.org/api/uaa/) for more detailed information about UAA.

C2S currently uses a fork of UAA project. This fork is fundamentally same as original UAA implementation, but it has some minor styling changes and customization to run behind the [Edge Server](#edge-server). It also includes a template [`uaa.yml`](https://github.com/bhits/uaa/blob/master/config-template/uaa.yml) configuration file to setup C2S clients, OAuth2 scopes and an admin user in UAA. This fork can be found at [https://github.com/bhits/uaa](https://github.com/bhits/uaa).

#### Logback Audit

C2S uses [Logback Audit](http://audit.qos.ch/) as a centralized audit repository in backend services, particularly in Access Control Service components. Logback Audit can be configured to use relational databases for persistence.

C2S currently uses a fork of Logback Audit project. This fork is fundamentally same as original Logback Audit implementation, but it has some dependency version updates and column size modifications in the database tables. It also includes a SQL script for database creation and a generated Audit Service project that can be built and deployed on an application server like [Apache Tomcat](http://tomcat.apache.org/). This fork can be found at [https://github.com/bhits/logback-audit](https://github.com/bhits/logback-audit).

#### JBoss Drools Guvnor

C2S uses [JBoss Drools Guvnor](https://docs.jboss.org/drools/release/5.5.0.Final/drools-guvnor-docs/html_single/) as a user interface and a versioned repository for business rules of its Business Rule Management System (BRMS). Guvnor also offers a guided editor while creating/editing rules, versioning, and Quality Assurance (QA) support for testing and validating the changes to the business rules. The [Document Segmentation Service (DSS) API](#document-segmentation-service-api) uses the [JBoss Drools Expert](https://docs.jboss.org/drools/release/5.4.0.Final/drools-expert-docs/html_single/) to run the business rules that are retrieved from the Guvnor instance with given arguments in a *Document Segmentation* request context. These rules and the execution result of them are used as *Tagging Directives* and they drive the *Document Tagging* phase of *Document Segmentation Service*.

## Security

C2S uses [OAuth2](https://tools.ietf.org/html/rfc6749), [OpenID Connect](http://openid.net/specs/openid-connect-core-1_0.html), [JSON Web Token (JWT)](https://jwt.io/) and [SCIM](https://tools.ietf.org/html/rfc7644) for authorization, authentication and identity management. [CloudFoundry User Account and Authentication (UAA) Server](https://github.com/cloudfoundry/uaa) implementation is currently being used and tested with C2S as the authorization server.

The [Edge Server](#edge-server) is being used as the entry point from public access and acts as a *reverse proxy* to the OAuth2 resource servers. The security is delegated to the resource servers that are exposed by the [Edge Server](#edge-server), therefore **one should exercise great caution when configuring the routes to the microservices. The endpoints that contain sensitive information and do not implement a form of security MUST NOT BE exposed through Edge Server.**

### DISCLAIMER

**It is strongly encouraged that your program’s Information Security Manager (or equivalent) reviews the security practices as it applies to your implementation of the Consent2Share application in your unique situation. The Substance Abuse and Mental Health Services Administration and its contractor FEi Systems are not liable for any risks experienced.**

## Releases

As mentioned in the previous sections, Consent2Share is an umbrella project that consists of many microservices. Each microservice and infrastructure component has its own independent source code repository, version, and release cycle. The release of Consent2Share as a whole system is basically a set of tested and compatible microservice releases and the supporting documentation.

The versions that can be found at Git tags in `<MajorVersion>.<MinorVersion>.<IncrementalVersion>` format represents the independent version of that specific component. The Consent2Share system version is also tagged in each repository with `c2s-` prefix *(Example: `c2s-<MajorVersion>.<MinorVersion>.<IncrementalVersion>`)*.

Please see the [release page](../../releases) for current releases.

## Development Guide

Please check the release notes from the [release page](../../releases) for the documentation.

## Deployment Guide

Please check the release notes from the [release page](../../releases) for the documentation.

## Docker

[//]: # (## Coding Style Guide)

[//]: # (## Security Practices and Check List)