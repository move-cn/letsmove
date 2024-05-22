cd ~/
wget -O sui-installer https://github.com/MystenLabs/sui/releases/download/mainnet-v1.25.1/sui-mainnet-v1.25.1-ubuntu-x86_64.tgz
mkdir ./sui-install
tar -xzf ./sui-installer -C ./sui-install

echo "export PATH=$PATH:~/sui-install" >> ~/.bashrc

