# Consent2Share

For additional information not contained on this site, please visit the [**Consent2Share on GitHub**](https://bhits.github.io/consent2share/) website.

Consent2Share (C2S) is an open source software application sponsored by the U.S. Substance Abuse and Mental Health Administration (SAMHSA) which is designed to support behavioral health integration with Fast Healthcare Interoperability Resources (FHIR) Servers. Behavioral healthcare, which includes substance abuse and mental health treatment services and providers, faces special privacy regulations that can make the exchange of health care information with other providers more strict than in other areas of healthcare.

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

C2S employs a [Microservices Architecture](http://martinfowler.com/articles/microservices.html) which makes it highly scalable and resilient. The majority of C2S microservices are implemented as [Spring Boot](http://projects.spring.io/spring-boot/) applications and utilize several [Spring Cloud](http://projects.spring.io/spring-cloud/) projects including [Spring Cloud Netflix](http://cloud.spring.io/spring-cloud-netflix/) and [Spring Cloud Security](http://cloud.spring.io/spring-cloud-security/).

The *C2S Technical Blueprint* can be used as a good reference that shows the big picture of C2S architecture, the technical components, and the high level interaction among  them. Please see the documents in the [release page](../../releases) for the applicable version of *C2S Technical Blueprint* document.

The C2S components can be grouped as the following:

### User Interfaces

C2S currently offers one user interface: the C2S UI.

#### Consent2Share User Interface(C2S-UI)

The C2S UI (c2s-ui) is a user interface component of Consent2share (C2S) used by the patient to manage his or her consents.

Source Code Repository: [https://github.com/bhits/c2s-ui](https://github.com/bhits/c2s-ui)

### Microservices

The backend of C2S consists of many microservices that are small yet focused on certain domain areas. These microservices provide RESTful API for external access. Some of these microservices also have persistence using [MySQL](https://www.mysql.com/).

#### Consent2Share User Interface API (C2S-UI-API)

The Consent2Share User Interface API (c2s-ui-api) is a Backend For Frontends(BFF) component of Consent2Share (C2S) 

Source Code Repository: [https://github.com/bhits/c2s-ui-api](https://github.com/bhits/c2s-ui-api)

#### Patient Consent Management Service (PCM)

The Patient Consent Management (PCM) Service is one of the core components of the Consent2Share (C2S) application. The PCM provides APIs for patients to manage their electronic consents including consent create, consent edit, consent delete, consent eSignature and patient provider list management.

Source Code Repository: [https://github.com/bhits/pcm](https://github.com/bhits/pcm)

#### Provider Lookup Service(PLS)

The Provider Lookup Service (PLS) is responsible for storing provider information as a provider directory. The PLS also provides a RESTful service for querying providers by using several query parameters including *first name, last name, gender, address, and phone number* for individual providers, and *organization name, address, and phone number* for organizational providers.

Source Code Repository: [https://github.com/bhits/pls](https://github.com/bhits/pls)

#### Value Set Service(VSS)

The Value Set Service (VSS) is responsible for Managing sensitive categories, code systems, value sets and coded concepts. The VSS also provides a RESTful service to map coded concepts to respective sensitive categories and provide the list of all sensitive categories available in the system.

Source Code Repository: [https://github.com/bhits/vss](https://github.com/bhits/vss)

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

#### Configuration Server

The Configuration Server (config-server) provides support for externalized configuration in the Consent2Share (C2S) application, including the following C2S components: Consent2Share UI,Consent2Share UI API, Edge Server,Patient Consent Management Service(PCM), Provider Lookup Service(PLS) and Value Set Service(VSS).

Source Code Repository: [https://github.com/bhits/config-server](https://github.com/bhits/config-server)

### Third-party Services

C2S uses third-party open source service for authentication and authorization service.

#### CloudFoundry User Account and Authentication (UAA) Server

C2S uses UAA for authentication, authorization, issuing tokens for client applications, and user account management. Please see [UAA Source Code Repository](https://github.com/cloudfoundry/uaa) and [UAA API Documentation](http://docs.cloudfoundry.org/api/uaa/) for more detailed information about UAA.

C2S currently uses a fork of UAA project. This fork is fundamentally the same as the original UAA implementation, but it has some minor styling changes and customization to run behind the [Edge Server](#edge-server). It also includes a template [`uaa.yml`](https://github.com/bhits/uaa/blob/master/config-template/uaa.yml) configuration file to setup C2S clients, OAuth2 scopes, and a few test users including an admin user in UAA. This fork can be found at [https://github.com/bhits/uaa](https://github.com/bhits/uaa).

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

Also Forked UAA mentioned in [Third-party Services](#third-party-services) section are sub-projects as well and has its own Git repositories.  

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
