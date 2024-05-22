# 安装 sui cli, 使用二进制而不是 cargo 的原因是，cargo 安装需要非常长时间的编译。经过测试，在最低配置的 codespace 中需要非常多的时间
cd ~/
wget -O sui-installer https://github.com/MystenLabs/sui/releases/download/mainnet-v1.25.1/sui-mainnet-v1.25.1-ubuntu-x86_64.tgz
mkdir ./sui-install
tar -xzvf ./sui-installer -C ./sui-install

wget -O ./sui-install/sui-move-analyzer https://github.com/movebit/sui-move-analyzer/releases/download/v1.1.5/sui-move-analyzer-ubuntu22.04-x86_64-v1.1.5
chmod +x ./sui-install/sui-move-analyzer

echo "export PATH=$PATH:~/sui-install" >> ~/.bashrc

# 安装 rust 工具链
wget -O rust-setup.sh https://sh.rustup.rs
chmod +x rust-setup.sh
sh ./rust-setup.sh -y
rm ./rust-setup.sh
