# Facebook-In-Spring

A Spring-based web application (WAR) built as a Facebook-like demo using Spring Framework, Hibernate, JSP/Servlets and MySQL. This repository contains the source and Maven configuration required to build a deployable WAR artifact.

> Note: This README is a practical guide and includes placeholder configuration values. Replace placeholders (USERNAME, PASSWORD, DB_NAME, SMTP settings, etc.) with your real values.

## Table of contents
- [Project overview](#project-overview)
- [Features](#features)
- [Technology stack](#technology-stack)
- [Prerequisites](#prerequisites)
- [Quick start (development)](#quick-start-development)
- [Configuration](#configuration)
  - [Database](#database)
  - [Mail (optional)](#mail-optional)
- [Build and run](#build-and-run)
- [Deploying to Tomcat](#deploying-to-tomcat)
- [Project structure](#project-structure)
- [Troubleshooting & tips](#troubleshooting--tips)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Project overview
Facebook-In-Spring is intended as a learning/demo application that demonstrates building a Java web application with Spring (MVC/core), Hibernate, JSPs, JavaMail, and MySQL. The project is packaged as a WAR so it can be deployed on a servlet container (for example Apache Tomcat).

## Features
(Adjust this list to reflect what your application actually implements.)
- User registration & login (session-based authentication)
- Profile pages and profile editing
- Create, view and delete posts
- Commenting and simple feed
- File upload support for profile pictures (if implemented)
- Email notifications via JavaMail (optional)

## Technology stack
- Java 22 (configured in pom.xml)
- Maven (build tool)
- Spring Framework (spring-core, spring-webmvc, spring-context, spring-beans)
- Hibernate ORM + Hibernate Validator
- MySQL (mysql-connector)
- JSP / JSTL for views
- Jakarta/JavaMail for email support
- Packaged as WAR for servlet containers

See `pom.xml` for exact dependency versions and build configuration.

## Prerequisites
- JDK 22 installed and JAVA_HOME set
- Maven 3.6+ (or newer)
- MySQL server (or another RDBMS if you adapt datasource)
- Servlet container (Tomcat 10+ recommended for Jakarta Servlet compatibility)
- (Optional) SMTP credentials for email notifications

## Quick start (development)
1. Clone the repo:
   git clone https://github.com/Mujeem8410/Facebook-In-Spring.git
2. Enter the project directory:
   cd Facebook-In-Spring
3. Update configuration (see next section) with your DB and mail settings.
4. Build the WAR:
   mvn clean package
5. Deploy the generated WAR found in `target/` to your servlet container (e.g., copy `target/*.war` to `tomcat/webapps`).

## Configuration

This project likely reads configuration either from `WEB-INF` resources (e.g., `context.xml`, `application.properties`, or similar). If your app uses `application.properties`, add a file like below in `src/main/resources/` or update whichever config your app uses.

Example `application.properties` (replace placeholders):
```properties
# Database
spring.datasource.url=jdbc:mysql://localhost:3306/DB_NAME?useSSL=false&serverTimezone=UTC
spring.datasource.username=DB_USER
spring.datasource.password=DB_PASSWORD
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
hibernate.dialect=org.hibernate.dialect.MySQL8Dialect

# Hibernate
hibernate.hbm2ddl.auto=update
hibernate.show_sql=true

# Mail (optional)
mail.host=smtp.example.com
mail.port=587
mail.username=SMTP_USER
mail.password=SMTP_PASSWORD
mail.properties.mail.smtp.auth=true
mail.properties.mail.smtp.starttls.enable=true
