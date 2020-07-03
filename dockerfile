FROM ubuntu:18.04
COPY . /test
RUN apt-get update -y
RUN test/ldapTest.sh
#CMD ["sh","test/ldapTest.sh"]