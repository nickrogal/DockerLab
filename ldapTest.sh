#!/bin/bash

apt get update -y
apt get upgrade -y
apt install open-ssh -y
ufo allow ssh
apt install slapd ldap-utils -y
