FROM debian:jessie

RUN apt-get update && \
    apt-get --no-install-recommends install -q -y openjdk-7-jre-headless && \
    #apt-get -y install nodejs nodejs-legacy npm &&\
    apt-get -y install curl &&\
    apt-get -y install git &&\
    apt-get -y install bzip2 &&\
    apt-get -y install sshpass

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install -y nodejs

ADD http://mirrors.jenkins-ci.org/war/latest/jenkins.war /opt/jenkins.war
RUN chmod 644 /opt/jenkins.war
ENV JENKINS_HOME /jenkins

ENTRYPOINT ["java", "-jar", "/opt/jenkins.war"]
EXPOSE 8080

RUN rm -rf /var/lib/apt/lists/*

CMD [""]