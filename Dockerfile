FROM seeruk/java:openjdk-java8
MAINTAINER Elliot Wright <hello@elliotdwright.com>

COPY provisioning/start-slave.sh /opt/jenkins-slave-setup/start-slave.sh

ENV MASTER_HOST ""
ENV MASTER_PORT ""
ENV SLAVE_NAME ""
ENV SLAVE_WORKSPACE /opt/jenkins-slave

RUN \
    useradd -d /opt/jenkins-slave -u 1000 -m -s /bin/bash jenkins && \
    mkdir -p /opt/jenkins-slave && \
    mkdir -p /Users && \
    chown -R jenkins: /opt && \
    chown -R jenkins: /Users && \
    apt-get update && \
    apt-get install -y build-essential curl git iputils-ping && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    chmod 755 /opt/jenkins-slave-setup/start-slave.sh

WORKDIR /opt/jenkins-slave-setup

CMD /opt/jenkins-slave-setup/start-slave.sh
