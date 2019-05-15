#!/bin/bash

if [ -z $SKIP_SYNCDB ]; then
    echo "DB sync"
    neutron-db-manage upgrade heads
fi

echo 'export PS1="[\u@neutron-${COMPONENT}] \W # "' >> /root/.bash_profile

echo "Starting neutron ${COMPONENT} service"

/usr/bin/neutron-${COMPONENT} --config-file=/etc/neutron/neutron.conf
