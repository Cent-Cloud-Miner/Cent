cd ~
cd /usr/local/bin
./cent-cli stop
rm -rf centd cent-cli cent-tx
sudo mkdir /root/cent
cd /root/cent
wget https://github.com/Cent-Cloud-Miner/Cent/releases/download/1.0.0.1/centlinux.tar
tar -xvf centlinux.tar -C /root/cent
sudo mv /root/cent/home/taihei/Cent/src/centd /root/cent/home/taihei/Cent/src/cent-cli /root/cent/home/taihei/Cent/src/cent-tx /usr/local/bin/cent
sudo chmod 755 -R  /usr/local/bin/cent*
rm -rf centlinux.tar
echo "staking=1" >> /home/cent/.cent/cent.conf
./centd -daemon
./cent-cli -datadir=/home/cent/.cent getnewaddress
./cent-cli -datadit=/home/cent/.cent masternode debug
echo -e ${RED}"This is your VPS Staking wallet address for mn 1!"${NC}
sleep 30
./cent-cli getinfo
echo "Cents address: CVW3GfX1ertGAfcaPvUQdDgKC7PZYX7c5U"
echo "LTC address: ltc1q0u3z5u5z9425sksl2vtsh4krvn3f2ejst9x6rj"
