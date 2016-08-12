#!/bin/sh

# The home directory will hopefully be in either /home or /Users. The jenkins user has access to
# create directories there.
mkdir -p ${SLAVE_HOME}

# Set new home directory for using ~.
export HOME=${SLAVE_HOME}
