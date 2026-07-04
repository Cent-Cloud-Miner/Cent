cd ~
cd /root/cent
/root/cent/cent-cli stop
rm -rf centd cent-cli cent-tx
sudo mkdir /root/cent
cd /root/cent
wget https://github.com/Cent-Cloud-Miner/Cent/releases/download/1.0.0.1/centlinux.tar
tar -xvf centlinux.tar -C /root/cent
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
echo "staking=1" >> /root/cent/home/cent1/.cent/cent.conf
/root/cent/centd -daemon
/root/cent/cent-cli -datadir=/root/cent/home/cent1/.cent getnewaddress
/root/cent/cent-cli -datadit=/root/cent/home/cent1/.cent masternode debug
echo -e ${RED}"This is your VPS Staking wallet address for mn 1!"${NC}
sleep 30
/root/cent/cent-cli getinfo
echo "Cents address: CVW3GfX1ertGAfcaPvUQdDgKC7PZYX7c5U"
echo "LTC address: ltc1q0u3z5u5z9425sksl2vtsh4krvn3f2ejst9x6rj"
