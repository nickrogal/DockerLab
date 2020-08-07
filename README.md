# DockerLab

<h3>Preface</h3>
This docker project was made for my IT610 class at NJIT.
LDAP stands for Lightweight Directory Access Protocol. The ELI5 explanation is that LDAP is the most central part to any organization's IT infrastructure and associates a user with their corporate account. If you've ever logged into a computer with a username given to you by an employer or school, there is a 99.99999999999% chance that LDAP was the underlying protocol.

The idea for this project was to run a contanerized instance of OpenLDAP
Step 1:
slapd

Step 2:
Populating slapd

'''console
$ docker run -p 80:80 -p 389:389 -it --name dockerlab --hostname dockerlab.it610ismyfavoriteclass.com dockerlab:latest
'''

Step 3:
phpldapadmin

step 4:

bringing it all together