#!/bin/bash
#this was the only way i could think of to get these services to autostart after building the image
service slapd start
service apache2 start