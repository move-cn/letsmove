<!-- testnet交易凭证 -->
4RLW6rR7wjS6Nk9XC1eWmtE9Yct77wsUFX57Bcio9rvW
package id 0xe52f0062c662622923977d1da1e3e9d13a0f0024179ac8fae3cb251474ee688e
拿到铸币权限
TREASURYCAP_ID = 0x77effe3db60bd976b7a01512fdca61d98dbfa9301a29c183fb0828518ddc7ca2


根据你的合约代码和需求，要调用 faucet 合约领取代币，你需要调用 mint 函数。以下是具体步骤：
找到必要的参数：
MySupply 对象的 ID：从你的部署交易中可以看到是 0xc060733fc2d2f168124ecae8ab709598897b37ef19567856c34e29569827ca94
要铸造的代币数量：你可以自定义，比如 100（记住合约中设置的小数位数是 6）
接收地址：0x77bd6d097331cdcf924e950f605025e8296ad6f383b41d88f9e1c881aef55d2f
执行 mint 命令：
这个命令的参数说明：
--package：你部署的合约地址
--module：模块名称 singmin_faucet_coin
--function：函数名称 mint
--args：
第一个参数是 MySupply 对象的 ID
第二个参数是铸造数量（考虑到 6 位小数，100 个代币需要输入 100000000）
执行这个命令后，新铸造的代币会被转移到调用者的地址。如果你想直接转移到其他地址，你需要在得到代币后再进行一次转账操作。

sui client call --package 0xe52f0062c662622923977d1da1e3e9d13a0f0024179ac8fae3cb251474ee688e --module singmin_faucet_coin --function mint --args 0xc060733fc2d2f168124ecae8ab709598897b37ef19567856c34e29569827ca94 100000000 --gas-budget 10000000

<!-- 发币记录 -->
9n6cMHna5YEV3UrnV752dRJ6dyat1rhcPmbuD5yocbZM
EPqox4xbyQCrM8LUG4XULLA7ho7LGjfpNq49ujkZYdki

0x4418b0d3f84534af280ad2f4ab813d5129eb6995552018f6b43961c2597499d9

<!-- 新的发布 -->
HbFsudh74eW6dnZM1jV2QnVTTa48wD1PNTtkHvPz4dkS

<!-- mainnet -->
发布地址 Cw8BYbo9xmBrUKJ6C89tRkbrYpQZAP1Lu8MnJPW1vYAp
