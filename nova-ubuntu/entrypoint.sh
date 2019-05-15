#!/bin/bash

if [ -z $SKIP_SYNCDB ]; then
    echo "DB sync"
    nova-manage api_db sync
    nova-manage cell_v2 map_cell0
    nova-manage db sync
fi

echo 'export PS1="[\u@nova-${COMPONENT}] \W # "' >> /root/.bash_profile

echo "Starting nova ${COMPONENT} service"
/usr/bin/nova-${COMPONENT} --config-file=/etc/nova/nova.conf
