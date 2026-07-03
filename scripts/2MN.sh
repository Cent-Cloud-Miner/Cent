#!/bin/bash

#Setup Variables
GREEN='\033[0;32m'
YELLOW='\033[0;93m'
RED='\033[0;31m'
NC='\033[0m'


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

echo "Creating 6 Cent system users with no-login access:"
sudo adduser --system --home /home/cent1 cent1
sudo adduser --system --home /home/cent2 cent2

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
wget https://github.com/Cent-Cloud-Miner/Cent/releases/download/1.0.0.1/centlinux.tar
tar -xvf centlinux.tar -C /root/cent
sudo mv /root/cent/home/taihei/Cent/src/centd /root/cent/home/taihei/Cent/src/cent-cli /root/cent/home/taihei/Cent/src/cent-tx /usr/local/bin/cent
sudo chmod 755 -R  /usr/local/bin/cent*
rm -rf centlinux.tar
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
echo "addnode=69.10.50.56" >> /home/cent1/.cent/cent.conf
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
echo "addnode=69.10.50.56" >> /home/cent2/.cent/cent.conf
echo "addnode=162.35.173.254" >> /home/cent2/.cent/cent.conf
echo "addnode=163.245.218.219" >> /home/cent2/.cent/cent.conf
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
echo ""
echo -e ${GREEN}"Congrats! Your Cent Masternodes are now installed and started. Please wait from 10-20 minutes in order to give the masternode enough time to sync, then start the node from your wallet, Debug console option"${NC}
echo "Cents address: CVW3GfX1ertGAfcaPvUQdDgKC7PZYX7c5U"
echo "LTC address: ltc1q0u3z5u5z9425sksl2vtsh4krvn3f2ejst9x6rj"
echo "The END. You can close now the SSH terminal session";
