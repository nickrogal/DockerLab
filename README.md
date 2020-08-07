# DockerLab


<h3>Preface</h3>


This docker project was made for my IT610 class at NJIT and is dubbed DockerLab, which is a container running OpenLDAP, Apache2, phpldapadmin, and smaller other components to faciliate the communication between one another.
LDAP stands for Lightweight Directory Access Protocol. The ELI5 explanation is that LDAP is the most central part to any organization's IT infrastructure and associates a user with their corporate account. If you've ever logged into a computer with a username given to you by an employer or school, there is a 99.99999999999% chance that LDAP was the underlying protocol.


The idea for this project was to run a contanerized instance of OpenLDAP to be used in a laboratory environment as building out environments to test a proof of concept is something I do quite often. Initially, the idea was huge and I was going to include a multiple components and containers to do various things like an SMB server, but ultimately, time required me to refocus on one componnent, so I went with OpenLDAP. Initially I had proposed that I was even going to pre-populate the OUs and 

In any case, I decided to focus on OpenLDAP with a GUI interface (much like Windows Active Directory) that can be spun up and configured within minutes. As such, I used OpenLDAP with phpldapadmin.


<h3>Ports Used</h3>


SSH: 22


HTTP: 80


LDAP: 389


<h3>Building the DockerLab OpenLDAP container</h3>


$ sudo docker build --pull --rm -f "openLDAP/dockerfile" -t dockerlab:latest "openLDAP"


<h3>Running the DockerLab OpenLDAP container</h3>


<h3>Starting Services</h3>


<h3>Accessing phpldapadmin</h3>


<h3>DockerLab Default Settings and Credentials</h3>

Note that these can be changed in the install-openldap.sh and config.php files.


domain: it610ismyfavoriteclass.com


admin username: admin


admin password: it610rocks

<h3>Creating Objects</h3>
