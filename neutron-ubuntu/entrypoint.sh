#!/bin/bash

if [ -z $SKIP_SYNCDB ]; then
    echo "DB sync"
    neutron-db-manage upgrade heads
fi

echo 'export PS1="[\u@neutron-${COMPONENT}] \W # "' >> /root/.bash_profile

echo "Starting neutron ${COMPONENT} endpoint"
service neutron-${COMPONENT} start
