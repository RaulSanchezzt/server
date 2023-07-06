# Server

This is a repository of service configurations in docker compose for any server.

## Exposed Ports

List of the exposed ports in a server:

- 53: Pi-Hole DNS
- 80: Reverse Proxy HTTP
- 81: Nginx Proxy Manager Admin UI
- 88: Nextcloud
- 443: Reverse Proxy HTTPS
- 888: Odoo
- 3333: Ghostfolio
- 4000: Blockscout HTTP
- 5353: Pi-Hole Admin UI
- 6379: Redis DB Blockscout
- 7432: Postgres DB Blockscout
- 8000: Vaultwarden
- 8080: Traefik Admin UI
- 8443: Code Server
- 8545: Truffle Ganache RPC
- 8888: Wordpress
- 9000: Portainer HTTP
- 9443: Portainer HTTPS
- 19999: Netdata
- 51820: Wireguard VPN UDP

## Install

First, boot from the `Ubuntu Server` ISO.

![GRUB](img/1.png)

In this case we only need the **minimized** server.

![Select Minimized version](img/2.png)

Format the disk in order to have enough space and `Swap`.

![File System Summary](img/3.png)

Configure the user, password and server's name.

![Profile Setup](img/4.png)

Install `OpenSSH Server`.

![SSH Setup](img/5.png)

Wait until the install is complete and restart.

![Install complete](img/6.png)

## Configuration

### Network

After installing [Ubuntu Server](https://ubuntu.com/download/server), we can log in using SSH.

![Windows Terminal](img/7.png)

Then, update the packages to install **git** and **vim** *(or nano if you prefer)*.

```bash
$ sudo su

$ apt update

$ apt install git vim
```

Edit the **netplan** file to configure the network settings.

```bash
$ vim /etc/netplan/00-installer-config.yaml
```

This is the network configuration of this server.

```yaml
network:
  ethernets:
    ens33:
      addresses:
        - 192.168.10.130/24
      nameservers:
        addresses: [8.8.8.8, 1.1.1.1]
      routes:
        - to: default
          via: 192.168.10.1
  version: 2
```

Use the **netplan** command to apply the changes.

```bash
$ netplan apply
```

Reboot the server to check everything is working.

```bash
$ reboot now
```

### Setup

First, clone this *repository* on the server and navigate to the directory.

```bash
$ git clone https://github.com/RaulSanchezzt/server.git && cd server
```

Give executable **permissions** to all *bash scripts* in this directory.

```bash
$ chmod +x *.sh
```

Now you can run the **setup** script.

```bash
$ ./setup.sh
```

### Compose

Before running this script, open `VScode` on your browser *(http://server.local:8443)* and edit the `.env` files of the services you want to install. Then, choose the services to install in the `compose.sh` script and run it!

```bash
$ ./compose.sh
```