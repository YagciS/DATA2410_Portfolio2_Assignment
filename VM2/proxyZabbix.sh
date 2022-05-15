#bin/bash

# First check Zabbix version, this can be done by going to frontend and
# scrolling down. In this case we have Zabbix 6.0.4 installed

# We pull the Zabbix 6.0 package for Ubuntu (the version is automatic)
wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-1\
+ubuntu$(lsb_release -rs)_all.deb

# We unpack the package
sudo dpkg -i zabbix-release_6.0-1+ubuntu$(lsb_release -rs)_all.deb

sudo apt update

# Installation of needed apts
sudo apt -y install zabbix-proxy-mysql zabbix-sql-scripts

# Removing the wget pull that we dont need anymore
rm -rf zabbix-release_6.0-1+ubuntu20.04_all.deb

# We didn't have curl installed when we first started
sudo apt update
sudo apt install curl -y

# Installing MariaDB 10.6
curl -LsS -O https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
sudo bash mariadb_repo_setup --mariadb-server-version=10.6

sudo apt update
sudo apt -y install mariadb-common mariadb-server-10.6 mariadb-client-10.6

# Enabling MariaDB
sudo systemctl start mariadb
sudo systemctl enable mariadb

# Creating database and granting all privileges to zabbix@localhost user
sudo mysql -uroot -e "create database zabbix_proxy character set utf8mb4 collate utf8mb4_bin;"
sudo mysql -uroot -e "grant all privileges on zabbix_proxy.* to zabbix@localhost identified by '123';"

# Copying the default SQL-script file to the database
sudo cat /usr/share/doc/zabbix-sql-scripts/mysql/proxy.sql | mysql -uzabbix -p'123' zabbix_proxy

# Removing the curl setup
rm -rf mariadb_repo_setup

echo -e "\nInstall complete, now some manual labor"
echo -e "---------------------------------------\n"
echo -e "Go to 'sudo nano /etc/zabbix/zabbix_proxy.conf'"
echo -e "Add following:"
echo -e "DBPassword=123, Server=IPofZabbixServer, Hostname=Zabbix proxy"
echo -e "DBName=zabbix_proxy, DBUser=zabbix\n"
echo -e "Then start and enable the Zabbix Proxy service with:"
echo -e "sudo systemctl restart zabbix-proxy\nsudo systemctl enable zabbix-proxy\n"
echo -e "Last thing is to register the proxy in ZabbixFrontend"
