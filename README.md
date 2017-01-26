# docker-jenkins
Docker image. Based on Debian image.  
Using for CI.  

Including
- jenkins
- git
- npm

##Docker-compose
```
version: '2'
services:
    jenkins:
        image: andrdru/jenkins
        restart: always
        ports:
            - "8080:8080"
        volumes:
            - ./jenkins:/jenkins
```
