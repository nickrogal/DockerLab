#!/bin/bash
apt-get install openssh-server -y
apt-get install slapd ldap-utils -y
dpkg-reconfigure slapd