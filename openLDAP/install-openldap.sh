#!/bin/bash
apt-get install openssh-server -y
apt-get -y install php php-cgi libapache2-mod-php php-common php-pear php-mbstring 

a2enconf php7.0-cgi 

service apache2 restart 

# Pre-seed the slapd passwords 

export DEBIAN_FRONTEND='non-interactive'

echo -e "slapd slapd/root_password password admin_password" |debconf-set-selections
echo -e "slapd slapd/root_password_again password admin_password" |debconf-set-selections

echo -e "slapd slapd/internal/adminpw password test" |debconf-set-selections
echo -e "slapd slapd/internal/generated_adminpw password test" |debconf-set-selections
echo -e "slapd slapd/password2 password test" |debconf-set-selections
echo -e "slapd slapd/password1 password test" |debconf-set-selections
echo -e "slapd slapd/domain string it610.local" |debconf-set-selections
echo -e "slapd shared/organization string IT610" |debconf-set-selections
echo -e "slapd slapd/backend string HDB" |debconf-set-selections
echo -e "slapd slapd/purge_database boolean true" |debconf-set-selections
echo -e "slapd slapd/move_old_database boolean true" |debconf-set-selections
echo -e "slapd slapd/allow_ldap_v2 boolean false" |debconf-set-selections
echo -e "slapd slapd/no_configuration boolean false" |debconf-set-selections
apt-get install -y slapd ldap-utils phpldapadmin
dpkg-reconfigure slapd
