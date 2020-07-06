#!/bin/bash
#I took bits of https://stackoverflow.com/questions/28937889/how-to-do-an-initial-setup-of-slapd-olc-with-ldapmodify and reworked it as my own.
#Below sets the noninteractive slapd
debconf-set-selections <<EOF
slapd slapd/internal/generated_adminpw password it610rocks
slapd slapd/password2 password it610rocks
slapd slapd/internal/adminpw password it610rocks
slapd slapd/password1 password it610rocks
slapd slapd/domain string it610ismyfavoriteclass.com
slapd shared/organization string it610ismyfavoriteclass.com
EOF

apt-get install -y slapd ldap-utils