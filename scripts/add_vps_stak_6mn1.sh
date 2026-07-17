#!/bin/bash

#Setup Variables
GREEN='\033[0;32m'
YELLOW='\033[0;93m'
RED='\033[0;31m'
NC='\033[0m'

echo -e ${YELLOW}"Welcome to the Cent Automated Update 1.0.0.2 (6in1)."${NC}
echo "Please wait while updates are performed..."
sleep 5
echo "Stopping first node, please wait...";
/root/cent/cent-cli -datadir=/root/cent/home/cent1/.cent stop
echo "Stopping second node, please wait...";
/root/cent/cent-cli -datadir=/root/cent/home/cent2/.cent stop
echo "Stopping third node, please wait...";
/root/cent/cent-cli -datadir=/root/cent/home/cent3/.cent stop
echo "Stopping fourth node, please wait...";
/root/cent/cent-cli -datadir=/root/cent/home/cent4/.cent stop
echo "Stopping 5th node, please wait...";
/root/cent/cent-cli -datadir=/root/cent/home/cent5/.cent stop
echo "Stopping 6th node, please wait...";
/root/cent/cent-cli -datadir=/root/cent/home/cent6/.cent stop
sleep 10
echo "Removing binaries..."
cd /usr/local/bin
rm -rf centd cent-cli cent-tx
echo "Downloading latest binaries"
sudo mkdir /root/cent
cd /root/cent
wget https://github.com/Cent-Cloud-Miner/Cent/releases/download/1.0.0.2/centlinux.tar.gz
tar -xvzf centlinux.tar -C /root/cent
sudo mv /root/cent/home/taihei/Cent/src/centd /root/cent/home/taihei/Cent/src/cent-cli /root/cent/home/taihei/Cent/src/cent-tx /root/cent

sudo chmod 755 -R  /root/cent*
rm -rf centlinux.tar

sudo apt-get install -y ufw
sudo ufw allow ssh/tcp
sudo ufw limit ssh/tcp
sudo ufw logging on
echo "y" | sudo ufw enable
sudo ufw status
sudo ufw allow 9822/tcp
sudo ufw allow 9922/tcp

sudo mkdir -p /root/cent/home/cent1/.cent
sudo touch /root/cent/home/cent1/.cent/cent.conf
echo "Deleting old nodes from node config files"
sed -i '/addnode/d' /root/cent/home/cent1/.cent/cent.conf
sed -i '/addnode/d' /root/cent/home/cent2/.cent/cent.conf
sed -i '/addnode/d' /root/cent/home/cent3/.cent/cent.conf
sed -i '/addnode/d' /root/cent/home/cent4/.cent/cent.conf
sed -i '/addnode/d' /root/cent/home/cent5/.cent/cent.conf
sed -i '/addnode/d' /root/cent/home/cent6/.cent/cent.conf

echo "Adding new nodes..."
echo "addnode=185.206.23.95" >> /root/cent/home/cent1/.cent/cent.conf
echo "addnode=163.245.218.219" >> /root/cent/home/cent1/.cent/cent.conf
echo "addnode=185.190.56.235" >> /root/cent/home/cent1/.cent/cent.conf
echo "addnode=69.10.50.56" >> /root/cent/home/cent1/.cent/cent.conf
echo "addnode=162.35.173.254" >> /root/cent/home/cent1/.cent/cent.conf
echo "staking=1" >> /root/cent/home/cent1/.cent/cent.conf

echo "addnode=185.206.23.95" >> /root/cent/home/cent2/.cent/cent.conf
echo "addnode=163.245.218.219" >> /root/cent/home/cent2/.cent/cent.conf
echo "addnode=185.190.56.235" >> /root/cent/home/cent2/.cent/cent.conf
echo "addnode=69.10.50.56" >> /root/cent/home/cent2/.cent/cent.conf
echo "addnode=162.35.173.254" >> /root/cent/home/cent2/.cent/cent.conf
echo "staking=1" >> /root/cent/home/cent2/.cent/cent.conf

echo "addnode=185.206.23.95" >> /root/cent/home/cent3/.cent/cent.conf
echo "addnode=163.245.218.219" >> /root/cent/home/cent3/.cent/cent.conf
echo "addnode=185.190.56.235" >> /root/cent/home/cent3/.cent/cent.conf
echo "addnode=69.10.50.56" >> /root/cent/home/cent3/.cent/cent.conf
echo "addnode=162.35.173.254" >> /root/cent/home/cent3/.cent/cent.conf
echo "staking=1" >> /root/cent/home/cent3/.cent/cent.conf

echo "addnode=185.206.23.95" >> /root/cent/home/cent4/.cent/cent.conf
echo "addnode=163.245.218.219" >> /root/cent/home/cent4/.cent/cent.conf
echo "addnode=185.190.56.235" >> /root/cent/home/cent4/.cent/cent.conf
echo "addnode=69.10.50.56" >> /root/cent/home/cent4/.cent/cent.conf
echo "addnode=162.35.173.254" >> /root/cent/home/cent4/.cent/cent.conf
echo "staking=1" >> /root/cent/home/cent4/.cent/cent.conf

echo "addnode=185.206.23.95" >> /root/cent/home/cent5/.cent/cent.conf
echo "addnode=163.245.218.219" >> /root/cent/home/cent5/.cent/cent.conf
echo "addnode=185.190.56.235" >> /root/cent/home/cent5/.cent/cent.conf
echo "addnode=69.10.50.56" >> /root/cent/home/cent5/.cent/cent.conf
echo "addnode=162.35.173.254" >> /root/cent/home/cent5/.cent/cent.conf
echo "staking=1" >> /root/cent/home/cent5/.cent/cent.conf

echo "addnode=185.206.23.95" >> /root/cent/home/cent6/.cent/cent.conf
echo "addnode=163.245.218.219" >> /root/cent/home/cent6/.cent/cent.conf
echo "addnode=185.190.56.235" >> /root/cent/home/cent6/.cent/cent.conf
echo "addnode=69.10.50.56" >> /root/cent/home/cent6/.cent/cent.conf
echo "addnode=162.35.173.254" >> /root/cent/home/cent6/.cent/cent.conf
echo "staking=1" >> /root/cent/home/cent6/.cent/cent.conf

echo "Syncing first node, please wait...";
/root/cent/centd -datadir=/root/cent/home/cent1/.cent -daemon
until /root/cent/cent-cli -datadir=/root/cent/home/cent1/.cent mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
/root/cent/cent-cli -datadir=/root/cent/home/cent1/.cent getnewaddress
echo -e ${RED}” This is your VPS Staking wallet address for mn 1!”${NC}
echo -e ${GREEN}"First node is fully synced. Your masternode is running!"${NC}
sleep 5
echo "Syncing second node, please wait...";
/root/cent/centd -datadir=/root/cent/home/cent2/.cent -daemon
until /root/cent/cent-cli -datadir=/root/cent/home/cent2/.cent mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Second node is fully synced. Your masternode is running!"${NC}
/root/cent/cent-cli -datadir=/root/cent/home/cent2/.cent getnewaddress
echo -e ${RED}”This is your VPS staking wallet address for mn 2!”${NC}
sleep 5
echo "Syncing third node, please wait...";
/root/cent/centd -datadir=/root/cent/home/cent3/.cent -daemon
until /root/cent/cent-cli -datadir=/root/cent/home/cent3/.cent mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
/root/cent/cent-cli -datadir=/root/cent/home/cent3/.cent getnewaddress
echo -e ${RED}”This is your VPS Staking wallet address for mn 3!“{NC}
echo -e ${GREEN}"Third node is fully synced. Your masternode is running!"${NC}
sleep 5
echo "Syncing fourth node, please wait...";
/root/cent/centd -datadir=/root/cent/home/cent4/.cent -daemon
until /root/cent/cent-cli -datadir=/root/cent/home/cent4/.cent mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
/root/cent/cent-cli -datadir=/root/cent/home/cent4/.cent getnewaddress
echo -e ${RED}”This is your VPS Staking wallet address for mn 4!“${NC}
echo -e ${GREEN}"Fourth node is fully synced. Your masternode is running!"${NC}
sleep 5
echo "Syncing fourth node, please wait...";
/root/cent/centd -datadir=/root/cent/home/cent5/.cent -daemon
until /root/cent/cent-cli -datadir=/root/cent/home/cent5/.cent mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
/root/cent/cent-cli -datadir=/root/cent/home/cent5/.cent getnewaddress
echo -e ${RED}”This is your VPS Staking wallet address for mn 5!”${NC}
echo -e ${GREEN}"5th node is fully synced. Your masternode is running!"${NC}
sleep 5
echo "Syncing fourth node, please wait...";
/root/cent/centd -datadir=/root/cent/home/cent6/.cent -daemon
until /root/cent/cent-cli -datadir=/root/cent/home/cent6/.cent mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
/root/cent/cent-cli -datadir=/root/cent/home/cent6/.cent getnewaddress
echo -e ${RED}”This is your VPS Staking wallet address for mn 6!”${NC}
echo -e ${GREEN}"6th node is fully synced. Your masternode is running!"${NC}
sleep 5
echo "Deleting temporary files"
rm -rf /root/cent/add_vps_stak_6mn1.sh
cd ~
echo "Cents address: CVW3GfX1ertGAfcaPvUQdDgKC7PZYX7c5U"
echo "LTC address: ltc1q0u3z5u5z9425sksl2vtsh4krvn3f2ejst9x6rj"
echo "The END. You can close now the SSH terminal session";
