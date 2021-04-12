#!/bin/bash

#check_permissions V1.0
# This script check the permission of all users that hava a home directory
# You must to be root to run this script
# Author: Rocken2k - GR


#Get all every user who has home directory
passwd_file=$(grep home /etc/passwd | cut -d: -f1)

#Display username, group and sudo permission
for users in $passwd_file
do	
	echo "USERNAME:" $users

	get_group= id $users
	printf "[+] %s$get_group" 
	
	permission_sudo= sudo -l -U $users | tail -n 2 	
	printf "%s$permission_sudo\n"


done

