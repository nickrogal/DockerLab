#!/bin/bash

password='root123'
dn='dc=math,dc=nccu,dc=edu,dc=tw'
ldap_ip=127.0.0.1

cat << EOF | debconf-set-selections
slapd slapd/internal/adminpw password root123
slapd slapd/internal/generated_adminpw password root123
slapd slapd/password2 password root123
slapd slapd/password1 password root123
slapd slapd/dump_database_destdir string /var/backups/slapd-VERSION
slapd slapd/domain string math.nccu.edu.tw
slapd shared/organization string NCCU Mathematics
slapd slapd/backend string HDB
slapd slapd/purge_database boolean true
slapd slapd/move_old_database boolean true
slapd slapd/allow_ldap_v2 boolean false
slapd slapd/no_configuration boolean false
slapd slapd/dump_database string when needed
EOF

apt-get install -y slapd ldap-utils

hash_pw='slappasswd -s $password'

cat << EOF > /etc/ldap/ldap.conf
BASE    $dn
URI     ldap://$ldap_ip
SSL     no
pam_password    md5
TLS_CACERT      /etc/ssl/certs/ca-certificates.crt
nss_initgroups_ignoreusers root,ldap,named,avahi,haldaemon,dbus,radvd,tomcat,radiusd,news,mailman,nscd,gdm
EOF

dpkg-reconfigure -f noninteractive slapd

ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/ldap/schema/core.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/ldap/schema/cosine.ldif 
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/ldap/schema/inetorgperson.ldif 
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/ldap/schema/nis.ldif 

cat << EOF > database.ldif
dn: olcDatabase={1}hdb,cn=config
changetype: modify
replace: olcRootPW
olcRootPW: $hash_pw
dn: olcDatabase={1}hdb,cn=config
add: olcAccess
olcAccess: {0}to attrs=userPassword,shadowLastChange by dn="cn=admin,$dn" write by anonymous auth by self write by * none
olcAccess: {1}to dn.subtree="" by * read
olcAccess: {2}to * by dn="cn=admin,$dn" write by * read
dn: olcDatabase={1}hdb,cn=config
add: olcDbIndex
olcDbIndex: uid,gidNumber,uidNumber pres,eq
olcDbIndex: cn,sn,mail,givenName,memberUid pres,eq,approx,sub
dn: olcDatabase={-1}frontend,cn=config
changetype: modify
delete: olcAccess
dn: olcDatabase={0}config,cn=config
changetype: modify
add: olcRootDN
olcRootDN: cn=admin,cn=config
dn: olcDatabase={0}config,cn=config
changetype: modify
add: olcRootPW
olcRootPW: $hash_pw
EOF
ldapmodify -Y -f database.ldif