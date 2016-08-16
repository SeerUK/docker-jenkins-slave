#!/bin/sh

set -e

# Create the user with the given home directory.
echo "Creating user with UID:GID of ${JENKINS_UID}:${JENKINS_GID}"
groupadd -g ${JENKINS_GID} -o jenkins
useradd -s /bin/bash -u ${JENKINS_UID} -g ${JENKINS_GID} -d ${JENKINS_HOME} -M -o jenkins

# Create the home directory, if it doesn't already exist. We won't bother with the skeleton.
mkdir -p ${JENKINS_HOME}

# Set new home directory for using ~.
export HOME=${JENKINS_HOME}

exec gosu jenkins "$@"
