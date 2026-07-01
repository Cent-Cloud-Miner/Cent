#/bin/bash

cd ~
cd /usr/local/bin
./cent-cli stop
rm -rf centd cent-cli cent-tx
wget https://github.com/Cent-Cloud-Miner/Cent/releases/download/1.0/centlinux.tar
tar -xzf centlinux.tar
rm -rf https://github.com/Cent-Cloud-Miner/Cent/releases/download/1.0/centlinux.tar
./centd -daemon
sleep 30
./cent-cli getinfo
echo "Cents address: CVW3GfX1ertGAfcaPvUQdDgKC7PZYX7c5U"
echo "LTC address: ltc1q0u3z5u5z9425sksl2vtsh4krvn3f2ejst9x6rj"
echo "The END. You can close now the SSH terminal session";