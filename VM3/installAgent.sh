#bin/bash

# From last installation, we know which Zabbix version we are running
# Therefore we just use the same link to pull Zabbix 6.0 package
wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-1\
+ubuntu$(lsb_release -rs)_all.deb

# We unpack the package
sudo dpkg -i zabbix-release_6.0-1+ubuntu$(lsb_release -rs)_all.deb

sudo apt update -y

# Installation of needed apt
sudo apt install zabbix-agent -y

# Removing the wget pull that we dont need anymore
rm -rf zabbix-release_6.0-1+ubuntu$(lsb_release -rs)_all.deb

# Restarting and enabling the agent
systemctl restart zabbix-agent
systemctl enable zabbix-agent

# We generate hex value for psk encryption file, this file is going to be
# located in /opt/zabbix
mkdir /opt/zabbix/
touch /opt/zabbix/zabbix_agent.psk

openssl rand -hex 32 > /opt/zabbix/zabbix_agent.psk

chown zabbix:zabbix /opt/zabbix/zabbix_agent.psk && chmod 640 /opt/zabbix/zabbix_agent.psk

echo -e "\nInstall complete, now some manual fingering"
echo -e "-----------------------------------------\n"
echo -e "Go to sudo nano /etc/zabbix/zabbix_agentd.conf"
echo -e "We want to add:"
echo -e "TLSConnect=psk, TLSAccept=psk, TLSPSKIdentity=cbt_psk_01"
echo -e "TLSPSKFile=/opt/zabbix/zabbix_agent.psk, Server=IPofVM1"
echo -e "Hostname=Zabbix agent wPSK"
echo -e "Restart and enable zabbix-agent with systemctl"
echo -e "\nNow we need to register the agent with PSK in ZabbixFrontend"
