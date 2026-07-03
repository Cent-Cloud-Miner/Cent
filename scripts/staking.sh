#/bin/bash

cd ~

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get install -y nano htop git
sudo apt-get install -y software-properties-common
sudo apt-get install -y build-essential libtool autotools-dev pkg-config libssl-dev
sudo apt-get install -y libboost-all-dev
sudo apt-get install -y libevent-dev
sudo apt-get install -y libminiupnpc-dev
sudo apt-get install -y autoconf
sudo apt-get install -y automake unzip
sudo add-apt-repository  -y  ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get install -y libdb4.8-dev libdb4.8++-dev
sudo apt-get install libzmq3-dev

cd /var
sudo touch swap.img
sudo chmod 600 swap.img
sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=2000
sudo mkswap /var/swap.img
sudo swapon /var/swap.img
sudo free
sudo echo "/var/swap.img none swap sw 0 0" >> /etc/fstab
cd

sudo mkdir /root/cent
cd /root/cent
wget https://github.com/Cent-Cloud-Miner/Cent/releases/download/1.0.0.1/centlinux.tar
tar -xvf centlinux.tar -C /root/cent
sudo mv /root/cent/home/taihei/Cent/src/centd /root/cent/home/taihei/Cent/src/cent-cli /root/cent/home/taihei/Cent/src/cent-tx /usr/local/bin/cent
sudo chmod 755 -R  /usr/local/bin/cent*

sudo apt-get install -y ufw
sudo ufw allow ssh/tcp
sudo ufw limit ssh/tcp
sudo ufw logging on
echo "y" | sudo ufw enable
sudo ufw status
sudo ufw allow 9822/tcp
sudo ufw allow 9922/tcp


mkdir -p .cent
echo "staking=1" >> cent.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> cent.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> cent.conf
echo "rpcallowip=127.0.0.1" >> cent.conf
echo "listen=1" >> /home/cent/.cent/cent.conf
echo "server=1" >> /home/cent/.cent/cent.conf
echo "daemon=1" >> /home/cent/.cent/cent.conf
echo "logtimestamps=1" >> /home/cent/.cent/cent.conf
echo "maxconnections=256" >> /home/cent/.cent/cent.conf
echo "addnode=182.206.23.95" >> /home/cent/.cent/cent.conf
echo "addnode=69.10.50.56" >> /home/cent/.cent/cent.conf
echo "addnode=162.35.173.254" >> /home/cent/.cent/cent.conf
echo "addnode=163.245.218.219" >> /home/cent/.cent/cent.conf
echo "port=6942" >> /home/cent/.cent/cent.conf
mv cent.conf .cent



./centd -daemon -resync
sleep 30
./cent-cli getinfo
sleep 5
./cent-cli getnewaddress
echo "Cents address: CVW3GfX1ertGAfcaPvUQdDgKC7PZYX7c5U"
echo "LTC address: ltc1q0u3z5u5z9425sksl2vtsh4krvn3f2ejst9x6rj"
