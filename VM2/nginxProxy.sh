#bin/bash

# Updating and installing nginx
apt update
apt install nginx

# Unlinking the default nginx site
unlink /etc/nginx/sites-enabled/default

echo -e "\nInstall complete, now some manual labor"
echo -e "-----------------------------------------\n"
echo -e "Do 'sudo nano /etc/nginx/sites-available/zabbix.conf'"
echo -e "Add in the file shown in the assignment\n"
echo -e "Do 'sudo nano /etc/nginx/nginx.conf'"
echo -e "Add 'include /etc/nginx/includes/*;'\n"
echo -e "Go to VM1 and config nginx to listen to port 8080"



