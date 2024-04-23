##安装
通过https://github.com/MystenLabs/sui/releases下载，解压文件到d盘，然后配置环境变量

##部署hello_world合约
1.写好hello_world之后，在终端运行： sui move build
--出现报错，运行：sui move build --skip-fetch-latest-git-deps，成功解决
2.运行：sui client envs，得到表格 “devent | https://…… ”，然后运行：sui client new-env --alias=mainnet --rpc https://……和sui client new-env --alias=testnet --rpc https://……
--出现dns错误的问题，修改网络设备的DNS后得到解决
3.运行：sui keytool convert 私钥，得到表格“ base64WithFlag | xxxxxxx”
4.运行：sui keytool import xxxxxxx ed25519，其中xxxxxxx为第3步所得
5.运行：sui client active-address，得到表格“fervent-moonstone | 0x……”
6.运行：sui client switch --address 0x……，其中0x……为第5步所得
7.运行：sui client active-address查看是否已经改好
8.运行：sui client switch --env testnet切换网络
9.运行：sui client publish --gas-budget=100000000发布合约，得到：“Transaction Digest:xxxxxxxx”
--出现问题运行sui client publish --gas-budget=100000000 --skip-fetch-latest-git-deps得以解决
10.复制第9步得到的Transaction Digest，在https://suiscan.xyz/mainnet/home里面进行搜索，在网页右上角将mainnet切换成testnet之后再搜索，在搜索的结果界面往最底下拉，找到Object Change-Object lD，最下面那个0x……，此为合约地址，以上是部署了hello_world合约

##调用合约中的mint函数铸造helloworld obj
11.运行：sui client call --function mint --package 0x…… --module hello_world --gas-budget=100000000，其中“0x…… ”为第10步得到的合约地址，得到：“Transaction Digest:xxxxxxxx”，再次将所得的Transaction Digest在https://suiscan.xyz/mainnet/home里面进行搜索，在Object lD中，第一个是创建的hello world结构体，点进去可以在fields中看见“Hello lvxinnian”的内容