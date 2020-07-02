FROM ubuntu:18.04
COPY . /openLDAPTest
RUN sh ldapTest.sh
CMD ["LDAP installed!"]