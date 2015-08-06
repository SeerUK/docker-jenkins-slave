FROM seeruk/docker-java:oracle-java8
MAINTAINER Elliot Wright <elliot@elliotwright.co>

COPY provisioning/start-slave.sh /opt/jenkins-slave-setup/start-slave.sh

RUN \
    apt-get update && \
    apt-get install -y build-essential curl git && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    chmod 700 /opt/jenkins-slave-setup/start-slave.sh

WORKDIR /opt/jenkins-slave-setup

CMD /opt/jenkins-slave-setup/start-slave.sh
