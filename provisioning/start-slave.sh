#!/bin/sh

# The home directory will hopefully be in either /home or /Users. The jenkins user has access to
# create directories there.
mkdir -p ${SLAVE_HOME}

# Set new home directory for using ~.
export HOME=${SLAVE_HOME}

cd ${SLAVE_WORKSPACE}

# Attempt to wait for host to be ready...
while ! ping -c1 ${MASTER_HOST} > /dev/null; do sleep 0.5; done

# Download the slave.jar file from the master node.
curl -O http://${MASTER_HOST}:${MASTER_PORT}/jnlpJars/slave.jar

# Start the slave, connecting the the master to retrieve configuration.
java ${JAVA_OPTS} -jar slave.jar -jnlpUrl http://${MASTER_HOST}:${MASTER_PORT}/computer/${SLAVE_NAME}/slave-agent.jnlp
