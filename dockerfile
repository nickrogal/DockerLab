FROM ubuntu:18.04
COPY . /test
#RUN apt-get -y update
RUN test/ldapTest.sh
#CMD ["sh","test/ldapTest.sh"]