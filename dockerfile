FROM ubuntu:20.04
COPY . /test
RUN apt-get update -y && apt-get upgrade -y
#test/ldapTest.sh
CMD ["sh","test/ldapTest.sh"]