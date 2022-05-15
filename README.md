# Portfolio 2 - Group assignment

This is a group Portfolio assignment for DATA2410 – Networking and cloud computing. The task was to create a collection of VM or virtual machines to run servers with encryption for safety and a Nginx frontend to help monitor the servers together with an agent. In this task, we were instructed to use Zabbix servers together with their MySQL server. To set the VM1 machine up we used docker-compose to start the servers and to connect the servers, while the other machines were set up with bash scripts that run the commands to install everything it needs. 

Zabbix is an open-source IT solution to monitor networks and servers and will provide you with system statistics and errors. Zabbix released its first version of its system in 2001, but the first stable version came in 2004. The goal for this assignment is to learn to use docker-compose and docker to initialize and run servers, but also to learn and get real-world experience in using and implementing Zabbix’s monitoring tools. The goal is also to learn to set up a webserver that will listen to localhost, and finally to get familiar with the Zabbix frontend and to know how to do the basics.

In this assignment, we will be going to use a Zabbix proxy to collect data and send it to the server to process and store. To get data from the system we used two Zabbix agents that monitors the system. The first agent is in the same local host as the server, but the second one is in VM3 and uses PSK encryption, and sends data to the Zabbix proxy, VM2.

Summary:

All VM's will run Ubuntu 20.4 with network bridge enabled (default is NAT)
 - *First VM* is going to run 1 Docker-compose file where it will start 4 containers; SQL, Zabbix Server, Zabbix Frontend and Zabbix agent
 - *Second VM* is going to run Zabbix Proxy with MariaDB 10.6 and Nginx Proxy
 - *Last VM* will run a Zabbix Agent with PSK encryption

How to **install** and run this project will be detailed in each directory.

[Offical Zabbix website](https://www.zabbix.com "Zabbix's Homepage")

[Offical Docker website](https://www.docker.com "Docker's Homepage")
