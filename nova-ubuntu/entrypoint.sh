#!/bin/bash

if [ -z $SKIP_SYNCDB ]; then
    echo "DB sync"
    nova-manage db sync
    nova-manage api_db sync
fi


echo 'export PS1="[\u@nova-${COMPONENT}] \W # "' >> /root/.bash_profile

echo "Starting nova ${COMPONENT} endpoint"
service nova-${COMPONENT} start
