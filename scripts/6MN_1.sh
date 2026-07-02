#!/bin/bash

#Setup Variables
GREEN='\033[0;32m'
YELLOW='\033[0;93m'
RED='\033[0;31m'
NC='\033[0m'

#Checking OS
if [[ $(lsb_release -d) != *18.04* ]]; then
  echo -e ${RED}"The operating system is not Ubuntu 18.04. You must be running on ubuntu 18.04."${NC}
  exit 1
fi

echo -e ${YELLOW}"Welcome to the Cent Automated Install, Durring this Process Please Hit Enter or Input What is Asked."${NC}
echo
echo -e ${YELLOW}"You Will See alot of code flashing across your screen, don't be alarmed it's supposed to do that. This process can take up to an hour and may appear to be stuck, but I can promise you it's not."${NC}
echo
echo -e ${GREEN}"Are you sure you want to install a Cent Masternode? type y/n followed by [ENTER]:"${NC}
read AGREE

if [[ $AGREE =~ "y" ]] ; then
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for the first node:"${NC}
read privkey
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for second node:"${NC}
read privkey2
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for the third node:"${NC}
read privkey3
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for 4th node:"${NC}
read privkey4
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for 5th node:"${NC}
read privkey5
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for 6th node:"${NC}
read privkey6
echo "Creating 6 Cent system users with no-login access:"
sudo adduser --system --home /home/cent cent1
sudo adduser --system --home /home/cent2 cent2
sudo adduser --system --home /home/cent3 cent3
sudo adduser --system --home /home/cent4 cent4
sudo adduser --system --home /home/cent5 cent5
sudo adduser --system --home /home/cent6 cent6
sudo apt-get -y update 
sudo apt-get -y upgrade
sudo apt-get -y install software-properties-common 
sudo apt-get -y install build-essential  
sudo apt-get -y install libtool autotools-dev autoconf automake  
sudo apt-get -y install libssl-dev 
sudo apt-get -y install libevent-dev 
sudo apt-get -y install libboost-all-dev 
sudo apt-get -y install pkg-config  
sudo add-apt-repository ppa:bitcoin/bitcoin 
sudo apt-get update 
sudo apt-get -y install libdb4.8-dev 
sudo apt-get -y install libdb4.8++-dev 
sudo apt-get -y install libminiupnpc-dev libzmq3-dev libevent-pthreads-2.0-5 
sudo apt-get -y install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev
sudo apt-get -y install libqrencode-dev bsdmainutils unzip
#sudo apt install git 
cd /var 
sudo touch swap.img 
sudo chmod 600 swap.img 
sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=2000 
sudo mkswap /var/swap.img 
sudo swapon /var/swap.img 
sudo echo ' /var/swap.img none swap sw 0 0 ' >> /etc/fstab
cd ~ 
sudo mkdir /root/cent
cd /root/cent
wget https://github.com/Cent-Cloud-Miner/Cent/releases/download/1.0/centlinux.tar
tar -xvf centlinux.tar
sudo mv /root/cent/centd /root/cent/cent-cli /root/cent/cent-tx /usr/local/bin
sudo chmod 755 -R  /usr/local/bin/cent*
sudo mkdir /home/cent1/.cent
sudo touch /home/cent1/.cent/cent.conf
echo -e "${GREEN}Configuring Wallet for first node${NC}"
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/cent1/.cent/cent.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/cent1/.cent/cent.conf
echo "rpcallowip=127.0.0.1" >> /home/cent1/.cent/cent.conf
echo "server=1" >> /home/cent1/.cent/cent.conf
echo "daemon=1" >> /home/cent1/.cent/cent.conf
echo "maxconnections=250" >> /home/cen1t/.cent/cent.conf
echo "masternode=1" >> /home/cent1/.cent/cent.conf
echo "rpcport=9922" >> /home/cent1/.cent/cent.conf
echo "listen=0" >> /home/cent1/.cent/cent.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):9922" >> /home/cent1/.cent/cent.conf
echo "masternodeprivkey=$privkey" >> /home/cent1/.cent/cent.conf
echo "addnode=182.206.23.95" >> /home/cent1/.cent/cent.conf
echo "addnode=153.75.231.58" >> /home/cent1/.cent/cent.conf
echo "addnode=162.35.173.254" >> /home/cent1/.cent/cent.conf
echo "addnode=163.245.218.219" >> /home/cent1/.cent/cent.conf
sleep 5
echo -e "${GREEN}Configuring Wallet for second node${NC}"
sudo mkdir /home/cent2/.cent
sudo touch /home/cent2/.cent/cent.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/cent2/.cent/cent.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/cent2/.cent/cent.conf
echo "rpcallowip=127.0.0.1" >> /home/cent2/.cent/cent.conf
echo "server=1" >> /home/cent2/.cent/cent.conf
echo "daemon=1" >> /home/cent2/.cent/cent.conf
echo "maxconnections=250" >> /home/cent2/.cent/cent.conf
echo "masternode=1" >> /home/cent2/.cent/cent.conf
echo "rpcport=9923" >> /home/cent2/.cent/cent.conf
echo "listen=0" >> /home/cent2/.cent/cent.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):9922" >> /home/cent2/.cent/cent.conf
echo "masternodeprivkey=$privkey2" >> /home/cent2/.cent/cent.conf
echo "addnode=182.206.23.95" >> /home/cent2/.cent/cent.conf
echo "addnode=153.75.231.58" >> /home/cent2/.cent/cent.conf
echo "addnode=162.35.173.254" >> /home/cent2/.cent/cent.conf
echo "addnode=163.245.218.219" >> /home/cent2/.cent/cent.conf
sleep 5 
echo -e "${GREEN}Configuring Wallet for third node${NC}"
sudo mkdir /home/cent3/.cent
sudo touch /home/cent3/.cent/cent.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/cent3/.cent/cent.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/cent3/.cent/cent.conf
echo "rpcallowip=127.0.0.1" >> /home/cent3/.cent/cent.conf
echo "server=1" >> /home/cent3/.cent/cent.conf
echo "daemon=1" >> /home/cent3/.cent/cent.conf
echo "maxconnections=250" >> /home/cent3/.cent/cent.conf
echo "masternode=1" >> /home/cent3/.cent/cent.conf
echo "rpcport=9924" >> /home/cent3/.cent/cent.conf
echo "listen=0" >> /home/cent3/.cent/cent.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):9922" >> /home/cent3/.cent/cent.conf
echo "masternodeprivkey=$privkey3" >> /home/cent3/.cent/cent.conf
echo "addnode=182.206.23.95" >> /home/cent3/.cent/cent.conf
echo "addnode=153.75.231.58" >> /home/cent3/.cent/cent.conf
echo "addnode=162.35.173.254" >> /home/cent3/.cent/cent.conf
echo "addnode=163.245.218.219" >> /home/cent3/.cent/cent.conf
sleep 5 
echo -e "${GREEN}Configuring Wallet for 4th node${NC}"
sudo mkdir /home/cent4/.cent
sudo touch /home/cent4/.cent/cent.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/cent4/.cent/cent.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/cent4/.cent/cent.conf
echo "rpcallowip=127.0.0.1" >> /home/cent4/.cent/cent.conf
echo "server=1" >> /home/cent4/.cent/cent.conf
echo "daemon=1" >> /home/cent4/.cent/cent.conf
echo "maxconnections=250" >> /home/cent4/.cent/cent.conf
echo "masternode=1" >> /home/cent4/.cent/cent.conf
echo "rpcport=9925" >> /home/cent4/.cent/cent.conf
echo "listen=0" >> /home/cent4/.cent/cent.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):9922" >> /home/cent4/.cent/cent.conf
echo "masternodeprivkey=$privkey4" >> /home/cent4/.cent/cent.conf
echo "addnode=182.206.23.95" >> /home/cent4/.cent/cent.conf
echo "addnode=153.75.231.58" >> /home/cent4/.cent/cent.conf
echo "addnode=162.35.173.254" >> /home/cent4/.cent/cent.conf
echo "addnode=163.245.218.219" >> /home/cent4/.cent/cent.conf
sleep 5 
echo -e "${GREEN}Configuring Wallet for 5th node${NC}"
sudo mkdir /home/cent5/.cent
sudo touch /home/cent5/.cent/cent.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/cent5/.cent/cent.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/cent5/.cent/cent.conf
echo "rpcallowip=127.0.0.1" >> /home/cent5/.cent/cent.conf
echo "server=1" >> /home/cent5/.cent/cent.conf
echo "daemon=1" >> /home/cent5/.cent/cent.conf
echo "maxconnections=250" >> /home/cent5/.cent/cent.conf
echo "masternode=1" >> /home/cent5/.cent/cent.conf
echo "rpcport=9926" >> /home/cent5/.cent/cent.conf
echo "listen=1" >> /home/cent5/.cent/cent.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):9922" >> /home/cent5/.cent/cent.conf
echo "masternodeprivkey=$privkey5" >> /home/cent5/.cent/cent.conf
echo "addnode=182.206.23.95" >> /home/cent5/.cent/cent.conf
echo "addnode=153.75.231.58" >> /home/cent5/.cent/cent.conf
echo "addnode=162.35.173.254" >> /home/cent5/.cent/cent.conf
echo "addnode=163.245.218.219" >> /home/cent5/.cent/cent.conf
sleep 5 
echo -e "${GREEN}Configuring Wallet for 6th node${NC}"
sudo mkdir /home/cent6/.cent
sudo touch /home/cent6/.cent/cent.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/cent6/.cent/cent.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/cent6/.cent/cent.conf
echo "rpcallowip=127.0.0.1" >> /home/cent6/.cent/cent.conf
echo "server=1" >> /home/cent6/.cent/cent.conf
echo "daemon=1" >> /home/cent6/.cent/cent.conf
echo "maxconnections=250" >> /home/cent6/.cent/cent.conf
echo "masternode=1" >> /home/cent6/.cent/cent.conf
echo "port=9927" >> /home/cent6/.cent/cent.conf
echo "listen=1" >> /home/cent6/.cent/cent.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):9922" >> /home/cent6/.cent/cent.conf
echo "masternodeprivkey=$privkey6" >> /home/cent6/.cent/cent.conf
echo "addnode=182.206.23.95" >> /home/cent6/.cent/cent.conf
echo "addnode=153.75.231.58" >> /home/cent6/.cent/cent.conf
echo "addnode=162.35.173.254" >> /home/cent6/.cent/cent.conf
echo "addnode=163.245.218.219" >> /home/cent6/.cent/cent.conf

sleep 5 
fi
echo "Syncing first node, please wait...";
centd -datadir=/home/cent1/.cent -daemon
sleep 10 
until cent-cli -datadir=/home/cent1/.cent mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"First node is fully synced. You 1st masternode is running!"${NC}
sleep 10
echo "Syncing second node, please wait...";
centd -datadir=/home/cent2/.cent -daemon
sleep 10 
until cent-cli -datadir=/home/cent2/.cent mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Second node is fully synced. You second masternode is running!"${NC}
sleep 10
echo "Syncing third node, please wait...";
centd -datadir=/home/cent3/.cent -daemon
sleep 10 
until cent-cli -datadir=/home/cent3/.cent mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Third node is fully synced. You third masternode is running!"${NC}
sleep 10
echo "Syncing fourth node, please wait...";
centd -datadir=/home/cent4/.cent -daemon
sleep 10 
until cent-cli -datadir=/home/cent4/.cent mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Fourth node is fully synced. You fourth masternode is running!"${NC}
sleep 10 
echo "Syncing 5th node, please wait...";
centd -datadir=/home/cent5/.cent -daemon
sleep 10 
until cent-cli -datadir=/home/cent5/.cent mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"5th node is fully synced. You 5th masternode is running!"${NC}
sleep 10 
echo "Syncing 6th node, please wait...";
centd -datadir=/home/cent6/.cent -daemon -listen=0
sleep 10 
until cent-cli -datadir=/home/cent6/.cent mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Last node is fully synced. You 6th masternode is running!"${NC}
echo ""
echo -e ${GREEN}"Congrats! Your Cent Masternodes are now installed and started. Please wait from 10-20 minutes in order to give the masternode enough time to sync, then start the node from your wallet, Debug console option"${NC}
echo "Cents address: CVW3GfX1ertGAfcaPvUQdDgKC7PZYX7c5U"
echo "LTC address: ltc1q0u3z5u5z9425sksl2vtsh4krvn3f2ejst9x6rj"
echo "The END. You can close now the SSH terminal session";
