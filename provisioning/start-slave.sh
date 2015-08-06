#!/bin/sh

curl -O http://${MASTER_HOST}/jnlpJars/slave.jar
java -jar slave.jar -jnlpUrl http://${MASTER_HOST}/computer/${SLAVE_NAME}/slave-agent.jnlp
