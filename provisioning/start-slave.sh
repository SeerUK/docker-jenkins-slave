#!/bin/sh

echo "==> Waiting for Jenkins container to start..."
while ! ping -c1 ${MASTER_HOST} > /dev/null; do
    sleep 0.5;
    echo "    Jenkins container still not ready..."
done
echo "    Jenkins container is available!"

echo "==> Sleeping for 20 seconds to wait for Jenkins boot..."
sleep 20;

echo "==> Downloading slave JAR from master node..."
curl -o ${SLAVE_WORKSPACE}/slave.jar http://${MASTER_HOST}:${MASTER_PORT}/jnlpJars/slave.jar
echo "    Done!"

# Start the slave, connecting the the master to retrieve configuration.
echo "==> Starting slave..."
java ${JAVA_OPTS} -jar ${SLAVE_WORKSPACE}/slave.jar -jnlpUrl http://${MASTER_HOST}:${MASTER_PORT}/computer/${SLAVE_NAME}/slave-agent.jnlp
