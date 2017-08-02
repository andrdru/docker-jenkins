FROM debian:jessie

RUN apt-get update && \
    apt-get --no-install-recommends install -q -y openjdk-7-jre-headless && \
    #apt-get -y install nodejs nodejs-legacy npm &&\
    apt-get -y install curl &&\
    apt-get -y install git &&\
    apt-get -y install bzip2 &&\
    apt-get -y install sshpass

RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install -y nodejs

RUN npm install -g less

#let's put docker in docker =)
RUN apt-get -y install apt-transport-https \
                           ca-certificates \
                           software-properties-common

RUN curl -fsSL https://yum.dockerproject.org/gpg | apt-key add -

RUN add-apt-repository \
           "deb https://apt.dockerproject.org/repo/ \
           debian-$(lsb_release -cs) \
           main"

RUN apt-get update && \
apt-get -y install docker-engine

RUN curl -L "https://github.com/docker/compose/releases/download/1.10.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

#ADD http://mirrors.jenkins-ci.org/war/latest/jenkins.war /opt/jenkins.war
ADD http://mirrors.jenkins-ci.org/war/2.46/jenkins.war /opt/jenkins.war
RUN chmod 644 /opt/jenkins.war
ENV JENKINS_HOME /jenkins

ENTRYPOINT ["java", "-jar", "/opt/jenkins.war"]
EXPOSE 8080

RUN rm -rf /var/lib/apt/lists/*

CMD [""]