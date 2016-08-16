#!/bin/sh

# Attempt to wait for host to be ready...
while ! ping -c1 ${MASTER_HOST} > /dev/null; do sleep 0.5; done

# Download the slave.jar file from the master node.
curl -o ${SLAVE_WORKSPACE}/slave.jar http://${MASTER_HOST}:${MASTER_PORT}/jnlpJars/slave.jar

# Start the slave, connecting the the master to retrieve configuration.
java ${JAVA_OPTS} -jar ${SLAVE_WORKSPACE}/slave.jar -jnlpUrl http://${MASTER_HOST}:${MASTER_PORT}/computer/${SLAVE_NAME}/slave-agent.jnlp
