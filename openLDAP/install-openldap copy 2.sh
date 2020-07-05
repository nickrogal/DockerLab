#!/bin/bash

#apt-get install openssh-server -y

#bellow taken from https://unix.stackexchange.com/questions/362547/automating-slapd-install
# install maven 

#apt-get install -y maven 
#apt-get -y install php php-cgi libapache2-mod-php php-common php-pear php-mbstring 

#a2enconf php7.4-cgi 

#service apache2 restart 


# Pre-seed the slapd passwords 

#export DEBIAN_FRONTEND='noninteractive'
#debconf-set-selections <<< ‘slapd/root_password password_123123’
#debconf-set-selections <<< ‘slapd/root_password_again password_123123
#apt-get install -y slapd ldap-utils phpldapadmin
echo 'slapd/root_password password password' | debconf-set-selections \
  && echo 'slapd/root_password_again password password' | debconf-set-selections
apt-get install -y slapd ldap-utils phpldapadmin

#echo 'slapd slapd/password1 password password' | debconf-set-selections \
  #&& echo 'slapd slapd/domain string it610.local' | debconf-set-selections \
  #&& echo -e "slapd slapd/password2 password test" |debconf-set-selections

dpkg-reconfigure -f noninteractive slapd
