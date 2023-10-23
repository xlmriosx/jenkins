# docker build . -t xlmriosx/jenkins:2.414.3-jdk17 && docker push xlmriosx/jenkins:2.414.3-jdk17
FROM jenkins/jenkins:2.414.3-jdk17
USER root
MAINTAINER xlmriosx@gmail.com
RUN apt-get update && apt-get install -y lsb-release
# Installing docker
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins
# Installing blueocean
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"