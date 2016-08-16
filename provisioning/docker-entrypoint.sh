#!/bin/bash

USER=$(getent passwd jenkins 2>&1)
GROUP=$(getent group jenkins 2>&1)

echo "==> Attempting to create 'jenkins' user."

if [ ${#USER} == 0 ] && [ ${#GROUP} == 0 ]; then
    # Create the user with the given home directory.
    echo "    Creating user with UID:GID of ${JENKINS_UID}:${JENKINS_GID}"
    groupadd -g ${JENKINS_GID} -o jenkins
    useradd -s /bin/bash -u ${JENKINS_UID} -g ${JENKINS_GID} -d ${JENKINS_HOME} -M -o jenkins
else
    echo "    User 'jenkins' already exists."
fi

# Set new home directory for using ~.
export HOME=${JENKINS_HOME}

echo "==> Creating Jenkins home directory..."

# Create the home directory, if it doesn't already exist. We won't bother with the skeleton.
mkdir -p ${JENKINS_HOME}
chown -R ${JENKINS_UID}:${JENKINS_GID} ${JENKINS_HOME}

echo "==> Creating workspace directory..."

# Create the workspace.
mkdir -p ${SLAVE_WORKSPACE}
chown -R ${JENKINS_UID}:${JENKINS_GID} ${SLAVE_WORKSPACE}

echo "==> Running CMD..."

exec gosu jenkins "$@"
