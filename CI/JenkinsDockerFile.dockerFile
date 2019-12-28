FROM jenkins/jenkins:lts
USER root
RUN apt-get update \
    && apt-get install -y sudo curl\
    && apt-get install -y libltdl7\
    && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

# getting the docker-cli
RUN curl -fsSL get.docker.com -o get-docker.sh
RUN sudo sh get-docker.sh

# Installing docker-compose
RUN sudo curl -L https://github.com/docker/compose/releases/download/1.25.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
RUN sudo chmod +x /usr/local/bin/docker-compose
USER jenkins

# Installing Git plugin. See: https://github.com/jenkinsci/docker#preinstalling-plugins
RUN /usr/local/bin/install-plugins.sh git:3.9.4