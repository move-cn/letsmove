# 设置网络与切换
```shell
# 设置mainnet主网
sui client new-env --alias testnet --rpc https://fullnode.testnet.sui.io:443

# 切换当前使用的网络
sui client switch --env mainnet
```

# 导入已有地址Address与切换
```shell
# 通过助记词导入已有地址address
sui keytool import "12个助记词" ed25519

# 切换address
sui client switch --address 0xe3c97815e1d899293c2dc11fdde713b28294d621d49bbc3557add8e937c2ac65
```

# 发布上链
```shell
sui client publish --gas-budget 100000000 --skip-fetch-latest-git-deps 
```

# 调用合约中的某个方法
```shell 
##                       方法名称         合约名称               合约上链后的地址address                                                     合约方法接收的 参数1                                                参数2
sui client call --function mint --module faucet_coin --package 0x458446d261dff12681934d1a0f890fc341a522794007400279cce10ec16002e3 --args 0x30ee475266140f97fbbcc98ae37e9d3f093fdb1e4978b3ac83fe99ec90a0fd07 100 --gas-budget 10000000

# mint nft
sui client call --function mint --module JANMIE_JAN_NFT --package 0x88eeddd2a7f1cd119741d22c8491a016aa0b89f5abcf356707d37ca96518475b --args 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 5000000
```