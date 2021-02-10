FROM "jenkins/jenkins:lts
USER root
RUN /bin/bash -c "apt-get install maven"
