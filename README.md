# Consent2Share

For additional information not contained on this site, please visit the [**Consent2Share on GitHub**](https://bhits.github.io/consent2share/) project website.

Consent2Share is an open source software application sponsored by the U.S. Substance Abuse and Mental Health Administration (SAMHSA). It is designed to support behavioral health data integration with Fast Healthcare Interoperability Resources (FHIR) Servers. Behavioral healthcare, which includes substance abuse and mental health treatment services and providers, faces special privacy regulations that makes the exchange of health care information with other providers more strict than in other areas of healthcare.

Consent2Share implements the concepts and standards of Data Segmentation for Privacy (DS4P). The DS4P Initiative was sponsored and defined by the U.S. Office of the National Coordinator for Health Information Technology (ONC). The implementation of DS4P concepts and standards allows patients receiving behavioral health treatment to share their health information through health information exchanges while protecting patients' privacy.

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

+ [Angular JS](https://angular.io/)
+ [Angular Material](https://material.angular.io/)
+ [Angular CLI](https://github.com/angular/angular-cli)
+ [Node.js](https://nodejs.org/en/)
+ [NPM](https://www.npmjs.com/)
+ [MD2](https://github.com/Promact/md2)
+ [RXJS](https://github.com/ReactiveX/rxjs)
+ [TypeScript](https://www.typescriptlang.org/)
+ [JavaScript - ES6](http://www.ecma-international.org/ecma-262/6.0/index.html)
+ [HTML5](https://www.w3.org/TR/html5/)
+ [CSS3](https://www.w3.org/TR/CSS/)
+ [Oracle Java 8](http://www.oracle.com/technetwork/java/javase/overview/java8-2100321.html)
+ [Spring Framework](https://projects.spring.io/spring-framework/)
+ [Spring Boot](https://projects.spring.io/spring-boot/)
+ [Spring Cloud](http://projects.spring.io/spring-cloud/)
+ [Apache Maven](https://maven.apache.org/)
+ [Apache Tomcat](http://tomcat.apache.org/)
+ [MySQL](https://www.mysql.com/)
+ [Flyway](https://flywaydb.org/)
+ [Docker and Docker Compose](https://www.docker.com/)
+ [CloudFoundry User Account and Authentication (UAA) Server](https://github.com/cloudfoundry/uaa)


## Architecture

Consent2Share employs a [Microservices Architecture](http://martinfowler.com/articles/microservices.html) which makes it highly scalable and resilient. The majority of Consent2Share microservices are implemented as [Spring Boot](http://projects.spring.io/spring-boot/) applications and utilize several [Spring Cloud](http://projects.spring.io/spring-cloud/) projects including [Spring Cloud Netflix](http://cloud.spring.io/spring-cloud-netflix/) and [Spring Cloud Security](http://cloud.spring.io/spring-cloud-security/).

The *Consent2Share Technical Blueprint* can be used as a good reference that shows the big picture of Consent2Share architecture, the technical components, and the high-level interactions among  them. Please see the documents in the [release page](../../releases) for the applicable version of *Consent2Share Technical Blueprint* document.

The Consent2Share components can be grouped as the following:

### User Interfaces

Consent2Share currently offers the following user interfaces: MASTER-UI, C2S UI, PROVIDER-UI and STAFF-UI.

#### Master User Interface (MASTER-UI)

The Master User Interface (master-ui) is a single UI interface to login to Consent2Share as patient, provider, or staff user account.

Source Code Repository: [https://github.com/bhits/master-ui](https://github.com/bhits/master-ui)

#### Consent2Share User Interface (C2S-UI)

The Consent2Share User Interface (c2s-ui) is a user interface component of Consent2share used by the patient to manage his or her consents.

Source Code Repository: [https://github.com/bhits/c2s-ui](https://github.com/bhits/c2s-ui)

#### Provider User Interface (PROVIDER-UI)

The Provider User Interface (provider-ui) is a provider user interface component of Consent2Share used to create and manage patient accounts. Providers can use this to log in, visit their home page, create patient accounts, and manage patient consents.

Source Code Repository: [https://github.com/bhits/provider-ui](https://github.com/bhits/provider-ui)

#### Staff User Interface (STAFF-UI)

The Staff User Interface (staff-ui) is an administrative user interface component of Consent2Share used to create and manage user accounts. Administrative staff can use this to log in, visit their home page, create user accounts, and manage user information.

Source Code Repository: [https://github.com/bhits/staff-ui](https://github.com/bhits/staff-ui)

### Microservices

The backend of Consent2Share consists of many microservices that are small and focused on certain domain areas. These microservices provide RESTful API for external access. Some of these microservices also have persistence using [MySQL](https://www.mysql.com/).

#### Consent2Share User Interface API (C2S-UI-API)

The Consent2Share User Interface API (c2s-ui-api) is a Backend For Frontends (BFF) component of Consent2Share.

Source Code Repository: [https://github.com/bhits/c2s-ui-api](https://github.com/bhits/c2s-ui-api)

#### Context Handler (CONTEXT-HANDLER)

The Context Handler is a RESTful web service component of Consent2Share. It is responsible for sending XACML response context that includes authorization decisions along with applied policy obligations to Policy Enforcement Point (PEP) components. The Context Handler sends the XACML request context to the Policy Decision Point (PDP). The PDP evaluates the applicable policies either from the Patient Consent Management (PCM) or a Fast Healthcare Interoperability Resource (FHIR) server against the request context, and returns the response context that includes authorization decisions along with obligations of applied policies to the Context Handler. The Context Handler sends XACML response context back to the PEP component. The PDP uses [HERAS-AF](https://bitbucket.org/herasaf/herasaf-xacml-core/overview), an open source XACML 2.0 implementation, for XACML evaluation, and uses either a PCM database as a local policy repository or a FHIR server to retrieve XACML policies that are generated from patients’ consents.

Source Code Repository: [https://github.com/bhits/context-handler](https://github.com/bhits/context-handler)

#### Document Validator Service (DOCUMENT-VALIDATOR)

The Document Validator Service is responsible for validating C32, C-CDA R1.1 and C-CDA R2.1 clinical documents. It is a RESTful Web Service wrapper around [MDHT](https://www.projects.openhealthtools.org/sf/projects/mdht/) (Model Driven Health Tools) libraries. It does schema validation for C32 and both schema and schematron validation for C-CDA, and returns the validation results from MDHT in the response. The Document Validator Service is used directly by the Document Segmentation Service [DSS](https://github.com/bhits/dss) to validate the document before and after the segmentation.

Source Code Repository: [https://github.com/bhits/document-validator](https://github.com/bhits/document-validator)

#### Document Segmentation Service (DSS)

The Document Segmentation Service (DSS) is responsible for segmenting patients' sensitive health information using the privacy settings selected in the patient's consent. The segmentation process involves the following phases:

1. Document Validation: The DSS uses the [Document-Validator](https://github.com/bhits/document-validator) to verify that the original document is a valid CCD document.
2. Fact Model Extraction: The DSS extracts a fact model, which is essentially based on the coded concepts in a CCD document.
3. Value Set Lookup: For every code and code system in the fact model, the DSS uses the Value Set Service (VSS) API to lookup the value set categories. The value set categories are also stored in the fact model for future use in the *Redaction* and *Tagging* phases.
4. Business Rules Management Service (BRMS) Execution: The DSS retrieves the business rules that are stored in a *[JBoss Guvnor](http://guvnor.jboss.org/)* instance and executes them with the fact model. The business rule execution response might contain directives regarding the *Tagging* phase.
5. Redaction: The DSS redacts sensitive health information for any sensitive value set categories which the patient did not consent to share in his/her consent. *NOTE: Additional Redaction Handlers are also being configured for other clean-up purposes.*
6. Tagging: The DSS tags the document based on the business rule execution response from the *BRMS Execution* step.
7. Clean Up: The DSS removes the custom elements that were added to the document for tracing purposes.
8. Segmented Document Validation: The DSS validates the final segmented document before returning it to ensure the output of DSS is still a valid CCD document.
9. Auditing: If enabled, the DSS also audits the segmentation process using *Logback Audit* server.

Source Code Repository: [https://github.com/bhits/dss](https://github.com/bhits/dss)

#### FHIR Integration Service (FIS)

The FHIR Integration Service (FIS) Spring Boot project provides RESTful endpoints to allow applications to publish and retrieve FHIR resources.

Source Code Repository: [https://github.com/bhits/fis](https://github.com/bhits/fis)

#### Master User Interface API (MASTER-UI-API)

The Master User Interface API (master-ui-api) is a Backend For Frontends(BFF) component of Consent2Share.

Source Code Repository: [https://github.com/bhits/master-ui-api](https://github.com/bhits/master-ui-api)

#### Patient Consent Management Service (PCM)

The Patient Consent Management (PCM) Service is one of the core components of the Consent2Share application. The PCM provides APIs for patients to manage their electronic consents including consent create, consent edit, consent delete, consent eSignature, and patient provider list management.

Source Code Repository: [https://github.com/bhits/pcm](https://github.com/bhits/pcm)

#### Policy Enforcement Point Service (PEP)
     
The Policy Enforcement Point (PEP) Service is one of the core components of the Consent2Share application. PEP delegates the access decision to the Context Handler API, and it utilizes the Document Segmentation Service 
([DSS](https://github.com/bhits/dss-api)) for segmenting CCD documents according to a patient's granular consent. 
PEP gives the same response for both *"No applicable consents"* and *"No documents found"* cases to avoid exposing the existence of a patient's consent.

Source Code Repository: [https://github.com/bhits/pep](https://github.com/bhits/pep)

#### Patient Health Record Service (PHR)
     
The Patient Health Record (PHR) service is a component of Consent2Share. It is a core service that manages and retains information about each patient. PHR also manages any C32 and/or C-CDA documents that a **patient** has uploaded to his or her own account for use in testing their consents using the [Try My Policy](https://github.com/bhits/try-policy) feature.

Source Code Repository: [https://github.com/bhits/phr](https://github.com/bhits/phr)


#### Provider Lookup Service (PLS)

The Provider Lookup Service (PLS) is responsible for storing provider information as a provider directory. The PLS also provides a RESTful service for querying providers by using several query parameters including *first name, last name, gender, address, and phone number* for individual providers, and *organization name, address, and phone number* for organizational providers.

Source Code Repository: [https://github.com/bhits/pls](https://github.com/bhits/pls)


#### Provider User Interface API (PROVIDER-UI-API)

The Provider User Interface API (provider-ui-api) is a Backend For Frontend (BFF) component of Consent2Share.

Source Code Repository: [https://github.com/bhits/provider-ui-api](https://github.com/bhits/provider-ui-api)


#### Staff User Interface API (STAFF-UI-API)

The Staff User Interface API (staff-ui-api) is a Backend For Frontend (BFF) component of Consent2Share.

Source Code Repository: [https://github.com/bhits/staff-ui-api](https://github.com/bhits/staff-ui-api)

#### Try My Policy (TRY-POLICY)

Try My Policy (TRY-POLICY) is a service that enables patients to preview the redacted version of their uploaded clinical document based on the privacy preferences of the consent. It calls the Document Segmentation Service (DSS)(https://github
.com/bhits/dss) to (1) segment the patient's clinical document, in the template prescribed by C-CDA-R1, C-CDA-R2, and HITSP C32, and (2) highlight the sections that will be removed in accordance to the patient's consent. Try My Policy transforms the response from DSS into a full XHTML file and provides the Base 64-encoded file in the response JSON. This service is currently utilized in the Consent2Share UI (c2s-ui) for patients to try their policies on their uploaded documents.

Source Code Repository: [https://github.com/bhits/try-policy](https://github.com/bhits/try-policy)

#### User Management Service (UMS)

The User Management Service (UMS) is a component of Consent2Share. It manages the user account creation process, user account activation, user disable, user update, and user demographics persisting. The UMS has been designed to support various roles for a given user such as Admin, Parent, Guardian, Patient, and so on. If it is configured to do so, it also registers user demographics (if the user is also a patient) to a FHIR server. 

Source Code Repository: [https://github.com/bhits/ums](https://github.com/bhits/ums)

#### Value Set Service (VSS)

The Value Set Service (VSS) is responsible for Managing sensitive categories, code systems, value sets, and coded concepts. The VSS also provides a RESTful service to map coded concepts to respective sensitive categories and provide the list of all sensitive categories available in the system.

Source Code Repository: [https://github.com/bhits/vss](https://github.com/bhits/vss)


### Supporting Infrastructure Services

Consent2Share uses [Eureka](https://github.com/Netflix/eureka) and [Zuul](https://github.com/Netflix/zuul) via [Spring Cloud Netflix](http://cloud.spring.io/spring-cloud-netflix/) project to facilitate microservice orchestration, dynamic service discovery, load balancing, security, and server side routing. There are two major supporting infrastructure services in Consent2Share based on these projects: Edge Server (Zuul) and Discovery Server (Eureka).

#### Configuration Server (CONFIG-SERVER)

The Configuration Server (config-server) provides support for externalized configuration in the Consent2Share application, including the following components: Consent2Share UI, Consent2Share UI API, Edge Server, Patient Consent Management Service (PCM), Provider Lookup Service (PLS), and Value Set Service (VSS).

Source Code Repository: [https://github.com/bhits/config-server](https://github.com/bhits/config-server)

#### Discovery Server (DSS)

The Discovery Server *([Eureka from Netflix OSS](https://github.com/Netflix/eureka))* is one of the key tenets of a microservice based architecture. It facilitates Consent2Share microservices to dynamically discover each other and promotes the scalability of the Consent2Share system. It provides the following:

 + Registry of Consent2Share service instances
 + Provides a means for Consent2Share service instances to register, de-register, and query instances with the registry
 + Registry propagation to other Consent2Share microservice (Eureka client) and Discovery Server (Eureka server cluster) instances

Source Code Repository: [https://github.com/bhits/discovery-server](https://github.com/bhits/discovery-server)

#### Edge Server (EDGE-SERVER)

The Edge Server acts as a gatekeeper to the outside world. It keeps unauthorized external requests from passing through. It uses Spring Cloud Zuul as a routing framework, which serves as an entry point to the Consent2Share microservices landscape. Zuul uses Spring Cloud Ribbon to look up available services, and routes the external request to an appropriate service instance, facilitating Dynamic Routing and Load Balancing.

Source Code Repository: [https://github.com/bhits/edge-server](https://github.com/bhits/edge-server)

### Third-party Services

Consent2Share uses third-party open source service for authentication and authorization service.

#### CloudFoundry User Account and Authentication (UAA) Server

Consent2Share uses UAA for authentication, authorization, issuing tokens for client applications, and user account management. Please see [UAA Source Code Repository](https://github.com/cloudfoundry/uaa) and [UAA API Documentation](http://docs.cloudfoundry.org/api/uaa/) for more detailed information about UAA.

Consent2Share currently uses a fork of the UAA project. This fork is fundamentally the same as the original UAA implementation, but it has some minor styling changes and customization to run behind the [Edge Server](#edge-server). It also includes a template [`uaa.yml`](https://github.com/bhits/uaa/blob/master/config-template/uaa.yml) configuration file to setup Consent2Share clients, OAuth2 scopes, and a few test users including an admin user in UAA. This fork can be found at [https://github.com/bhits/uaa](https://github.com/bhits/uaa).

#### HAPI FHIR (HAPI-FHIR)

HAPI-FHIR is a Java API for HL7 FHIR Clients and Servers.

Source Code Repository: [https://github.com/bhits/hapi-fhir](https://github.com/bhits/hapi-fhir)

## Security

Consent2Share uses [OAuth2](https://tools.ietf.org/html/rfc6749), [OpenID Connect](http://openid.net/specs/openid-connect-core-1_0.html), [JSON Web Token (JWT)](https://jwt.io/) and [SCIM](https://tools.ietf.org/html/rfc7644) for authorization, authentication, and identity management. [CloudFoundry User Account and Authentication (UAA) Server](https://github.com/cloudfoundry/uaa) implementation is currently being used and tested with Consent2Share as the authorization server.

The [Edge Server](#edge-server) is being used as the entry point for public access and acts as a *reverse proxy* to the OAuth2 resource servers. The security is delegated to the resource servers that are exposed by the [Edge Server](#edge-server). Therefore **one should exercise great caution when configuring the routes to the microservices. The endpoints that contain sensitive information and do not implement a form of security MUST NOT BE exposed through Edge Server.**

### SSL

For simplicity in development and testing environments, SSL is **NOT** enabled by default in configurations in Consent2Share components. Please follow the instructions given in particular microservice documentations for enabling SSL if needed to do so in your particular deployment environment. Also, please be mindful about overriding the target endpoints in the default configurations to use `https` for SSL enabled services.

### UAA Private and Public Keys

The Consent2Share microservices that are also configured as *OAuth2 Resource Servers* use a public key to verify the signature of the JWT Token provided in the `Authorization` header. This token is generated and signed by UAA using the UAA private key.

These keys need to be securely generated and configured in production environments. The properties that are used to configure the keys:

In Consent2Share microservices:

+ `security.oauth2.resource.jwt.key-value`: public key

In UAA:

+ `jwt.token.verification-key`: public key
+ `jwt.token.signing-key`: private key

Please see [UAA Source Code Repository](https://github.com/cloudfoundry/uaa) and [UAA API Documentation](http://docs.cloudfoundry.org/api/uaa/) for more detailed information about UAA.

### DISCLAIMER

**It is strongly encouraged that your program’s Information Security Manager (or equivalent) reviews the security practices as it applies to your implementation of the Consent2Share application in your unique situation. The U.S. Substance Abuse and Mental Health Services Administration (SAMHSA) and BHITS Development Team are not liable for any risks experienced.**

## Sub-projects and Git Repositories

Consent2Share is an umbrella project which has several sub-projects.

In [User Interfaces](#user-interfaces), [Microservices](#microservices) and [Supporting Infrastructure Services](#supporting-infrastructure-services) sections, we listed services and UIs used in Consent2Share. Each of these services is a sub-project and has its own Git repository. 

Also the forked UAA mentioned in [Third-party Services](#third-party-services) section are sub-projects as well and has its own Git repositories.  

Additionally, there are other sub-projects listed in the below:

### Common Libraries (COMMON-LIBRARIES)

Consent2Share has a set of common libraries that are being used across the microservices. These libraries mostly contain basic utility functions.

Source Code Repository: [https://github.com/bhits/common-libraries](https://github.com/bhits/common-libraries)

**NOTE: The common libraries need to be built and installed to the local Maven repository or deployed to the Maven repository used in your enterprise development environment before building any other Consent2Share microservices, in order to prevent any dependency resolution issues.**

### Java Jar Runner

This project only contains a `Dockerfile` and an `entrypoint.sh` script to build a base Docker image for all other Consent2Share microservices that are implemented as Spring Boot applications. This image is essentially based on a [`opendk`](https://hub.docker.com/_/openjdk/) Docker image and supports certain environment variables for configuration and runs a configured `jar` file at startup.

Source Code Repository: [https://github.com/bhits/java-jar-runner](https://github.com/bhits/java-jar-runner)


## Releases

As mentioned in the previous sections, Consent2Share is an umbrella project that consists of many microservices. Each microservice and infrastructure component has its own independent source code repository, version, and release cycle. The release of Consent2Share as a whole system is basically a set of tested and compatible microservice releases and the supporting documentation.

The release version numbers are usually specified in `<MajorVersion>.<MinorVersion>.<IncrementalVersion>` format. 

Please see the [release page](../../releases) for current releases.

## Development Guide

Please see [release page](../../releases) to download the document.

## Deployment Guide

Please see [release page](../../releases) to download the document.

## User Guides

Please see [release page](../../releases) to download the document.


## Infrastructure Using Docker

The BHITS project also has a [Docker Hub account](https://hub.docker.com/u/bhits/) to house the Docker images built from the public release versions. Please see the [Deployment Guide](#deployment-guide) and the [infrastructure](/infrastructure) folder for standing up a Consent2Share running instance and related infrastructure using *Docker* and *Docker Compose*.

Additionally, each source code repository also contains `README.md` instructions and a `Dockerfile` for building Docker images from the source code.

[//]: # (## Coding Style Guide)

[//]: # (## Security Practices and Check List)
