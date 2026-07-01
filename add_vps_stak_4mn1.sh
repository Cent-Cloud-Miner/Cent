#!/bin/bash

#Setup Variables
GREEN='\033[0;32m'
YELLOW='\033[0;93m'
RED='\033[0;31m'
NC='\033[0m'

echo -e ${YELLOW}"Welcome to the Cent Automated Update 1.0.0 (4in1)."${NC}
echo "Please wait while updates are performed..."
sleep 5
echo "Stopping first node, please wait...";
cent-cli -datadir=/home/cent1/.cent stop
echo "Stopping second node, please wait...";
cent-cli -datadir=/home/cent2/.cent stop
echo "Stopping third node, please wait...";
cent-cli -datadir=/home/cent3/.cent stop
echo "Stopping fourth node, please wait...";
cent-cli -datadir=/home/cent4/.cent stop
sleep 10
echo "Removing binaries..."
cd /usr/local/bin
rm -rf centd cent-cli cent-tx
echo "Downloading latest binaries"
wget https://github.com/Cent-Cloud-Miner/Cent/releases/download/1.0/centlinux.tar
tar -xzf centlinux.tar
sudo chmod 755 -R  /usr/local/bin/cent*
rm -rf cent-cli.tar.gz
echo "Deleting old nodes from node config files"
sed -i '/addnode/d' /home/cent1/.cent/cent.conf
sed -i '/addnode/d' /home/cent2/.cent/cent.conf
sed -i '/addnode/d' /home/cent3/.cent/cent.conf
sed -i '/addnode/d' /home/cent4/.cent/cent.conf

echo "Adding new nodes..."
echo "addnode=182.206.23.95" >> /home/cent1/.cent/cent.conf
echo "addnode=163.245.218.219" >> /home/cent1/.cent/cent.conf
echo "staking=1" >> /home/cent1/.cent/cent.conf

echo "addnode=182.206.23.95" >> /home/cent2/.cent/cent.conf
echo "addnode=163.245.218.219" >> /home/cent2/.cent/cent.conf
echo "staking=1" >> /home/cent2/.cent/cent.conf

echo "addnode=182.206.23.95" >> /home/cent3/.cent/cent.conf
echo "addnode=163.245.218.219" >> /home/cent3/.cent/cent.conf
echo "staking=1" >> /home/cent3/.cent/cent.conf

echo "addnode=182.206.23.95" >> /home/cent4/.cent/cent.conf
echo "addnode=163.245.218.219" >> /home/cent4/.cent/cent.conf
echo "staking=1" >> /home/cent4/.cent/cent.conf

echo "Syncing first node, please wait...";
centd -datadir=/home/cent1/.cent -daemon -staking=1 -masternode=1 
until cent-cli -datadir=/home/cent1/.cent mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
cent-cli -datadir=/home/cent1/.cent getnewaddress
cent-cli -datadit=/home/cent1/.cent masternode debug
echo -e ${GREEN}"First node is fully synced. Your masternode is running!"${NC}
echo -e ${RED}"This is your VPS Staking wallet address for mn 1!"${NC}
sleep 5
echo "Syncing second node, please wait...";
centd -datadir=/home/cent2/.cent -daemon -staking=1 -masternode=1
until cent-cli -datadir=/home/cent2/.cent mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
cent-cli -datadir=/home/cent2/.cent getnewaddress
cent-cli -datadit=/home/cent2/.cent masternode debug
echo -e ${GREEN}"Second node is fully synced. Your masternode is running!"${NC}
echo -e ${RED}"This is your VPS Staking wallet address for mn 2!"${NC}
sleep 5
echo "Syncing third node, please wait...";
centd -datadir=/home/cent3/.cent -daemon -staking=1 -masternode=1
until cent-cli -datadir=/home/cent3/.cent mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
cent-cli -datadir=/home/cent3/.cent getnewaddress
cent-cli -datadit=/home/cent3/.cent masternode debug
echo -e ${GREEN}"Third node is fully synced. Your masternode is running!"${NC}
echo -e ${RED}"This is your VPS Staking wallet address for mn 3!"${NC}
sleep 5
echo "Syncing fourth node, please wait...";
centd -datadir=/home/cent4/.cent -daemon -staking=1 -masternode=1
until cent-cli -datadir=/home/cent4/.cent mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
cent-cli -datadir=/home/cent4/.cent getnewaddress
cent-cli -datadit=/home/cent4/.cent masternode debug
echo -e ${GREEN}"Fourth node is fully synced. Your masternode is running!"${NC}
echo -e ${RED}"This is your VPS Staking wallet address for mn 4!"${NC}
sleep 5
echo "Deleting temporary files"
rm -rf /root/cent_4masternodes_update.sh
cd ~
echo "Cents address: CVW3GfX1ertGAfcaPvUQdDgKC7PZYX7c5U"
echo "LTC address: ltc1q0u3z5u5z9425sksl2vtsh4krvn3f2ejst9x6rj"
echo -e ${RED}"Don't forget to copy the wallet address for each node if you plan on having more than 1 staking!"${NC}
echo "The END. You can close now the SSH terminal session";
