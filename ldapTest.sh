#!/bin/bash
apt install openssh-server -y
ufw allow ssh
apt install slapd ldap-utils -y
dpkg-reconfigure slapd
apt get install phpldapadmin -y