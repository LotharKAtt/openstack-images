#!/bin/bash

echo 'export PS1="[\u@neutron-${COMPONENT}] \W # "' >> /root/.bash_profile

echo "Starting neutron ${COMPONENT} endpoint"
service neutron-${COMPONENT} start
