# Major Project - VTJCC08_2025

A Java / J2EE Web Application for Secure Cloud Data Storage and Searchable Encryption.

## Overview
This project provides a secure multi-role system (Data Owner, Cloud Server, Data User, Admin) featuring:
- **AES & HMAC Encryption:** Encrypting uploaded files and generating cryptographic trapdoors/keys.
- **Data Owner Module:** Registration, authentication, and secure file uploading with encryption.
- **Cloud Server Module:** Managing encrypted files and access requests.
- **Data User Module:** Registration, trapdoor generation, secure keyword searching, secret key request, and file decryption/download.
- **Admin Module:** User/owner approval and system administration.

## Tech Stack
- **Backend:** Java (Servlets, JSP), Maven
- **Database:** MySQL (`cc08.sql`)
- **Security:** AES Encryption, HMAC hashing
- **Server:** Apache Tomcat 9.0+

## Project Structure
- `java_project/VTJCC08_2025/CODE/VTJCC08_2025`: Maven Java web application source code.
- `java_project/VTJCC08_2025/DATABASE/cc08.sql`: Database schema and table dump.
- `java_project/VTJCC08_2025/VTJCC08_REC.mp4`: Project demo / execution walkthrough recording.

## Setup Instructions
1. **Database:** Import `java_project/VTJCC08_2025/DATABASE/cc08.sql` into MySQL.
2. **Build:** Run `mvn clean install` inside `java_project/VTJCC08_2025/CODE/VTJCC08_2025`.
3. **Deploy:** Deploy the generated WAR file or run on Apache Tomcat.

