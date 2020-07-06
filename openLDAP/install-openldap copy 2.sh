#!/bin/bash

echo -e " 
slapd slapd/internal/generated_adminpw password openstack
slapd slapd/password2 password openstack
slapd slapd/internal/adminpw password openstack
slapd slapd/password1 password openstack
" | debconf-set-selections

apt-get install -y slapd ldap-utils

dpkg-reconfigure -f noninteractive slapd