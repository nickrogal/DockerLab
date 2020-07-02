FROM ubuntu:18.04
COPY . /test
RUN #apt get update -y \
apt get upgrade -y \
test/ldapTest.sh
#CMD ["echo","LDAP installed!"]