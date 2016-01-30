FROM seeruk/docker-java:oracle-java8
MAINTAINER Elliot Wright <elliot@elliotwright.co>

COPY provisioning/start-slave.sh /opt/jenkins-slave-setup/start-slave.sh

ENV MASTER_HOST ""
ENV MASTER_PORT ""
ENV SLAVE_NAME ""
ENV SLAVE_WORKSPACE /opt/jenkins-slave

RUN \
    useradd -d /opt/jenkins-slave -u 1000 -m -s /bin/bash jenkins && \
    mkdir -p /opt/jenkins-slave && \
    chown -R jenkins: /opt && \
    apt-get update && \
    apt-get install -y build-essential curl git && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    chmod 755 /opt/jenkins-slave-setup/start-slave.sh

WORKDIR /opt/jenkins-slave-setup

CMD /opt/jenkins-slave-setup/start-slave.sh
