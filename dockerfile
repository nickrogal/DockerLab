FROM ubuntu:latest
COPY . /test
RUN apt-get update -y
RUN sh test/ldaptest.sh
#CMD ["sh","test/ldapTest.sh"]