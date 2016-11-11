# Consent2Share

For additional information not contained on this site, please visit the [**Consent2Share on GitHub**](https://bhits.github.io/consent2share/) website.

Consent2Share (C2S) is an open source software application sponsored by the U.S. Substance Abuse and Mental Health Administration (SAMHSA) which is designed to support behavioral health integration with health information exchanges (HIEs). Behavioral healthcare, which includes substance abuse and mental health treatment services and providers, faces special privacy regulations that can make the exchange of health care information with other providers more strict than in other areas of healthcare.

Consent2Share implements the concepts of Data Segmentation for Privacy (DS4P) which was sponsored and defined by the U.S. Office of the National Coordinator for Health Information Technology (ONC). The implementation of DS4P concepts and standards will allow patients receiving behavioral health treatment to share their health information through the nation’s HIEs while providing improved protection of their privacy.

## Table of Contents

[**Technology Stack**](#technology-stack)  &nbsp; | &nbsp; [**Architecture**](#architecture) &nbsp; | &nbsp; [User Interfaces](#user-interfaces) &nbsp; | &nbsp; [Microservices](#microservices)

[Supporting Infrastructure Services](#supporting-infrastructure-services) &nbsp; | &nbsp; [Third-party Services](#third-party-services)

[**Security**](#security) &nbsp; | &nbsp; [SSL](#ssl) &nbsp; | &nbsp; [UAA Private and Public Keys](#uaa-private-and-public-keys) &nbsp; | &nbsp; [DISCLAIMER](#disclaimer)

[**Sub Projects and Git Repositories**](#sub-projects-and-git-repositories) &nbsp; | &nbsp; [Common Libraries](#common-libraries)

[Java Jar Runner](#java-jar-runner) &nbsp; | &nbsp; [Spring Boot App Runner](#spring-boot-app-runner) &nbsp; | &nbsp; [**Releases**](#releases)

[**Development Guide**](#development-guide) &nbsp; | &nbsp; [**Deployment Guide**](#deployment-guide)

[**Infrastructure Using Docker**](#infrastructure-using-docker)


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

C2S employs a [Microservices Architecture](http://martinfowler.com/articles/microservices.html) which makes it highly scalable and resilient. The majority of C2S microservices are implemented as [Spring Boot](http://projects.spring.io/spring-boot/) applications and utilize several [Spring Cloud](http://projects.spring.io/spring-cloud/) projects including [Spring Cloud Netflix](http://cloud.spring.io/spring-cloud-netflix/) and [Spring Cloud Security](http://cloud.spring.io/spring-cloud-security/).

The *C2S Technical Blueprint* can be used as a good reference that shows the big picture of C2S architecture, the technical components, and the high level interaction among  them. Please see the documents in the [release page](../../releases) for the applicable version of *C2S Technical Blueprint* document.

The C2S components can be grouped as the following:

### User Interfaces

C2S currently offers two user interfaces: the Patient Portal UI and the Admin Portal UI.

#### Patient Portal UI

The Patient Portal UI (patient-portal-ui) is a patient user interface component of Consent2share (C2S) used by the patient to manage his or her health information and consent. Patients can use this application to register, log in, visit their home page, review their health records, conduct consent management activities, and view prior consent decisions.

Source Code Repository: [https://github.com/bhits/patient-portal-ui](https://github.com/bhits/patient-portal-ui)

#### Admin Portal UI

The Admin Portal UI (admin-portal-ui) is an administrative user interface component of Consent2Share (C2S) used to create and manage patient accounts. Administrative staff can use this to log in, visit their home page, create patient accounts, and manage patient information.

Source Code Repository: [https://github.com/bhits/admin-portal-ui](https://github.com/bhits/admin-portal-ui)

### Microservices

The backend of C2S consists of many microservices that are small yet focused on certain domain areas. These microservices provide RESTful API for external access. Some of these microservices also have persistence using [MySQL](https://www.mysql.com/).

#### Patient Registration API

The Patient Registration (patient-registration) API is a component of Consent2Share (C2S) that manages the patient account creation process and persists patient demographics in Patient Health Record (PHR) API domain. If it is configured, it also registers the patient demographics to Health Information Exchange (HIE) via Information Exchange Hub (IExHub).

Source Code Repository: [https://github.com/bhits/registration-api](https://github.com/bhits/registration-api)

#### Patient User API

The Patient User API is responsible for managing the patient user creation process, including user creation and activation, user scope management, email token generation, and extracting existing user profile from the Patient Health Record API (PHR) in the Consent2Share (C2S) application.

Source Code Repository: [https://github.com/bhits/patient-user-api](https://github.com/bhits/patient-user-api)

#### Patient Consent Management API

The Patient Consent Management (PCM) API is one of the core components of the Consent2Share (C2S) application. The PCM provides APIs for patients to manage their electronic consents including consent creation, consent audit, consent eSignature, consent export, and patient provider list management. 

Source Code Repository: [https://github.com/bhits/pcm-api](https://github.com/bhits/pcm-api)

#### Provider Lookup Service API

The Provider Lookup Service (PLS) API is responsible for storing provider information as a provider directory. PLS also provides a RESTful API for querying providers by using several query parameters including first name, last name, gender, address, and phone number for individual providers, and organization name, address, and phone number for organizational providers.

Source Code Repository: [https://github.com/bhits/pls-api](https://github.com/bhits/pls-api)

#### Try My Policy API

Try My Policy is a service that enables patients to preview the redacted version of their uploaded clinical document based on the privacy preferences of the consent. Try My Policy calls the [Document Segmentation Service (DSS) API](https://github.com/bhits/dss-api) to (1) segment the patient's clinical document, in the template prescribed by C-CDA-R1, C-CDA-R2, and HITSP C32, and (2) highlight the sections that will be removed in accordance to the patient's consent. Try My Policy transforms the response from DSS into a full XHTML file and provides the Base 64 encoded file in the response JSON. This API is currently utilized in the Patient Portal UI for patients to try their policies on their uploaded documents.

Source Code Repository: [https://github.com/bhits/try-policy-api](https://github.com/bhits/try-policy-api)

#### Patient Health Record API

The Patient Health Record (PHR) API is responsible for storing patient identities in the Consent2Share (C2S) domain, and for serving patient health records from the health information exchange (HIE) via the Information Exchange Hub (IExHub). Currently, only patient demographics and C2S Medical Record Numbers (MRN) are persisted in PHR domain.

Source Code Repository: [https://github.com/bhits/phr-api](https://github.com/bhits/phr-api)

#### Policy Enforcement Point API

The Policy Enforcement Point (PEP) API is a RESTful web service for the Access Control Service (ACS) entry point. PEP delegates the access decision to the Context Handler API, and it utilizes the Document Segmentation Service (DSS) for segmenting CCD documents according to a patient's granular consent. PEP gives the same response for both "No applicable consents" and "No documents found" cases to avoid exposing the existence of a patient's consent.

Source Code Repository: [https://github.com/bhits/pep-api](https://github.com/bhits/pep-api)

#### Context Handler API

The Context Handler API is a RESTful web service responsible for making the access decisions (PERMIT/DENY) based on the given request contexts. It uses a Policy Decision Point (PDP) to evaluate access requests against authorization policies before issuing access decisions. The PDP uses [HERAS-AF](https://bitbucket.org/herasaf/herasaf-xacml-core/overview), an open source XACML 2.0 implementation, for XACML evaluation and uses Patient Consent Management (PCM) database as a local policy repository to retrieve XACML policies that are generated from patients’ consents.

Source Code Repository: [https://github.com/bhits/context-handler](https://github.com/bhits/context-handler)

#### Document Segmentation Service API

The Document Segmentation Service (DSS) API is responsible for the segmentation of the patient's sensitive health information using the privacy settings selected in the patient's consent. 

Source Code Repository: [https://github.com/bhits/dss-api](https://github.com/bhits/dss-api)

#### Document Validator API

The Document Validator API is responsible for validating C-CDA R1 and C-CDA R2 clinical documents. It is a RESTful Web Service wrapper around [MDHT](https://www.projects.openhealthtools.org/sf/projects/mdht/) (Model Driven Health Tools) libraries. It does both schema and schematron validation and returns the validation results from MDHT in the response. Document Validator API is used directly by [DSS](https://github.com/bhits/dss-api) (Document Segmentation Service) to validate the document before and after the segmentation.

Source Code Repository: [https://github.com/bhits/document-validator](https://github.com/bhits/document-validator)

#### Information Exchange Hub

The Information Exchange Hub consists of connectors, services, and transformation components intended to allow applications to interoperate with standards-based Health Information Exchange (HIE) organizations.

Source Code Repository: [https://github.com/bhits/iexhub](https://github.com/bhits/iexhub)

### Supporting Infrastructure Services

C2S uses [Eureka](https://github.com/Netflix/eureka) and [Zuul](https://github.com/Netflix/zuul) via [Spring Cloud Netflix](http://cloud.spring.io/spring-cloud-netflix/) project to facilitate microservice orchestration, dynamic service discovery, load balancing, security, and server side routing. There are two major supporting infrastructure services in C2S based on these projects: Edge Server (Zuul) and Discovery Server (Eureka).

#### Edge Server

The Edge Server acts as a gatekeeper to the outside world. It keeps unauthorized external requests from passing through. It uses Spring Cloud Zuul as a routing framework, which serves as an entry point to the Consent2Share (C2S) microservices landscape. Zuul uses Spring Cloud Ribbon to lookup available services, and routes the external request to an appropriate service instance, facilitating Dynamic Routing and Load Balancing.

Source Code Repository: [https://github.com/bhits/edge-server](https://github.com/bhits/edge-server)

#### Discovery Server

The Discovery Server *([Eureka from Netflix OSS](https://github.com/Netflix/eureka))* is one of the key tenets of a microservice based architecture. It facilitates C2S microservices to dynamically discover each other and promotes the scalability of the C2S system. It provides the following:

 + Registry of C2S service instances
 + Provides means for C2S service instances to register, de-register and query instances with the registry
 + Registry propagation to other C2S microservice (Eureka client) and Discovery Server (Eureka server cluster) instances

Source Code Repository: [https://github.com/bhits/discovery-server](https://github.com/bhits/discovery-server)

### Third-party Services

C2S uses several third-party open source services for authentication, authorization, business rules management, auditing and detecting viruses.

#### CloudFoundry User Account and Authentication (UAA) Server

C2S uses UAA for authentication, authorization, issuing tokens for client applications, and user account management. Please see [UAA Source Code Repository](https://github.com/cloudfoundry/uaa) and [UAA API Documentation](http://docs.cloudfoundry.org/api/uaa/) for more detailed information about UAA.

C2S currently uses a fork of UAA project. This fork is fundamentally the same as the original UAA implementation, but it has some minor styling changes and customization to run behind the [Edge Server](#edge-server). It also includes a template [`uaa.yml`](https://github.com/bhits/uaa/blob/master/config-template/uaa.yml) configuration file to setup C2S clients, OAuth2 scopes, and a few test users including an admin user in UAA. This fork can be found at [https://github.com/bhits/uaa](https://github.com/bhits/uaa).

#### Logback Audit

The Consent2Share (C2S) application uses [Logback Audit](http://audit.qos.ch/) as a centralized audit repository in backend services, particularly in the Access Control Service components. Logback Audit can be configured to use relational databases for persistence.

C2S currently uses a fork of the [Logback Audit project](https://github.com/qos-ch/logback-audit). This fork is fundamentally the same as the  original Logback Audit implementation. However, it has some dependency version updates and column size modifications in the database tables. It also includes an SQL script for database creation and a generated *Logback Audit Server* project that can be built and deployed on an application server such as [Apache Tomcat](http://tomcat.apache.org/). This fork can be found at [https://github.com/bhits/logback-audit](https://github.com/bhits/logback-audit).

#### JBoss Drools Guvnor

C2S uses [JBoss Drools Guvnor](https://docs.jboss.org/drools/release/5.5.0.Final/drools-guvnor-docs/html_single/) as a user interface and a versioned repository for business rules of its Business Rule Management System (BRMS). Guvnor also offers a guided editor while creating/editing rules, versioning, and Quality Assurance (QA) support for testing and validating the changes to the business rules. The [Document Segmentation Service (DSS) API](#document-segmentation-service-api) uses the [JBoss Drools Expert](https://docs.jboss.org/drools/release/5.4.0.Final/drools-expert-docs/html_single/) to run the business rules that are retrieved from the Guvnor instance with given arguments in a *Document Segmentation* request context. These rules and the execution result are used as *Tagging Directives* and they drive the *Document Tagging* phase of *Document Segmentation Service*.

Source Code Repository for Dockerized JBoss Drools Guvnor: [https://github.com/bhits/dockerized-drools-guvnor](https://github.com/bhits/dockerized-drools-guvnor)

#### ClamAV

C2S uses [ClamAV](http://http://www.clamav.net/) to scan clinical documents uploaded by patients.

## Security

C2S uses [OAuth2](https://tools.ietf.org/html/rfc6749), [OpenID Connect](http://openid.net/specs/openid-connect-core-1_0.html), [JSON Web Token (JWT)](https://jwt.io/) and [SCIM](https://tools.ietf.org/html/rfc7644) for authorization, authentication, and identity management. [CloudFoundry User Account and Authentication (UAA) Server](https://github.com/cloudfoundry/uaa) implementation is currently being used and tested with C2S as the authorization server.

The [Edge Server](#edge-server) is being used as the entry point from public access and acts as a *reverse proxy* to the OAuth2 resource servers. The security is delegated to the resource servers that are exposed by the [Edge Server](#edge-server), therefore **one should exercise great caution when configuring the routes to the microservices. The endpoints that contain sensitive information and do not implement a form of security MUST NOT BE exposed through Edge Server.**

### SSL

For simplicity in development and testing environments, SSL is **NOT** enabled by default in configurations in C2S components. Please follow the instructions given in particular microservice documentations for enabling SSL if needed to do so in your particular deployment environment. Also, please be mindful for overriding the target endpoints in the default configurations to use `https` for SSL enabled services.

### UAA Private and Public Keys

The C2S microservices that are also configured as *OAuth2 Resource Servers* use a public key to verify the signature of the JWT Token provided in the `Authorization` header. This token is generated and signed by UAA using the UAA private key.

These keys need to be securely generated and configured in production environments. The properties that are used to configure the keys:

In C2S microservices:

+ `security.oauth2.resource.jwt.key-value`: public key

In UAA:

+ `jwt.token.verification-key`: public key
+ `jwt.token.signing-key`: private key

Please see [UAA Source Code Repository](https://github.com/cloudfoundry/uaa) and [UAA API Documentation](http://docs.cloudfoundry.org/api/uaa/) for more detailed information about UAA.

### DISCLAIMER

**It is strongly encouraged that your program’s Information Security Manager (or equivalent) reviews the security practices as it applies to your implementation of the Consent2Share application in your unique situation. The Substance Abuse and Mental Health Services Administration and BHITS Development Team are not liable for any risks experienced.**

## Sub Projects and Git Repositories

C2S is an umbrella project which has several sub-projects.

In [User Interfaces](#user-interfaces), [Microservices](#microservices) and [Supporting Infrastructure Services](#supporting-infrastructure-services) sections, we listed services/UIs used in Consent2Share. Each of these services is a sub-project and has its own Git repository. 

Also Forked UAA, Forcked Logback Audit and Dockerized JBoss Drools Guvnor listed in [Third-party Services](#third-party-services) section are sub-projects as well and have their own Git repositories.  

Additionally,  there are other sub-projects listed in the below:

### Common Libraries

The C2S application has a set of common libraries that are being used across the microservices. These libraries mostly contain basic utility functions.

Source Code Repository: [https://github.com/bhits/common-libraries](https://github.com/bhits/common-libraries)

**NOTE: The common libraries need to be built and installed to the local Maven repository or deployed to the Maven repository used in your enterprise development environment before building any other C2S microservices, in order to prevent any dependency resolution issues.**

### Java Jar Runner

This project only contains a `Dockerfile` and an `entrypoint.sh` script to build a base Docker image for all other C2S microservices that are implemented as Spring Boot applications. This image is essentially based on an [`opendk`](https://hub.docker.com/_/openjdk/) Docker image and supports certain environment variables for configuration and runs a configured `jar` file at startup.

Source Code Repository: [https://github.com/bhits/java-jar-runner](https://github.com/bhits/java-jar-runner)

### Spring Boot App Runner

Spring Boot App Runner is developed to run Spring Boot applications that are packaged as `jar` in development and test environments that do not have Docker engine available. It provides RESTful APIs to:

1. Deploy/Undeploy applications including binaries that are packaged as `jar`
2. Add/Remove instance configurations to/from existing applications
3. Get the current state of deployed applications and instances

Spring Boot App Runner persists the binaries, application, and instance configurations on a configured file system location. This application itself is packaged in `war` format and can be deployed on an application server such as [Apache Tomcat](http://tomcat.apache.org/). During shutdown and startup, it shuts down all current applications and instances, and start them back up again using previously persisted state.

Source Code Repository: [https://github.com/bhits/spring-boot-app-runner](https://github.com/bhits/spring-boot-app-runner)

**NOTE: This application can be used for development and testing purposes, but it is NOT meant for and MUST NOT be used in production environments.**

## Releases

As mentioned in the previous sections, C2S is an umbrella project that consists of many microservices. Each microservice and infrastructure component has its own independent source code repository, version, and release cycle. The release of C2S as a whole system is basically a set of tested and compatible microservice releases and the supporting documentation.

The release version numbers are usually specified in `<MajorVersion>.<MinorVersion>.<IncrementalVersion>` format. 

Please see the [release page](../../releases) for current releases.

## Development Guide

Please see [release page](../../releases) to download the document.

## Deployment Guide

Please see [release page](../../releases) to download the document.

## Infrastructure Using Docker

The BHITS project also has a [Docker Hub account](https://hub.docker.com/u/bhits/) to house the Docker images built from the public release versions. Please see the [Deployment Guide](#deployment-guide) and the [infrastructure](/infrastructure) folder for standing up a C2S running instance and related infrastructure using *Docker* and *Docker Compose*.

Additionally, each source code repository also contains `README.md` instructions and a `Dockerfile` for building Docker images from the source code.

[//]: # (## Coding Style Guide)

[//]: # (## Security Practices and Check List)
