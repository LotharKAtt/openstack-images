#!/bin/bash

echo "lol"
bash
if [ -z $SKIP_SYNCDB ]; then
    echo "DB sync"
    glance-manage db_sync
fi


echo 'export PS1="[\u@glance-${COMPONENT}] \W # "' >> /root/.bash_profile

echo "Starting glance ${COMPONENT} endpoint"
service glance-${COMPONENT} start
