- 开发环境：ubuntu 22.04

# task

## task1 hello move
### 1. chrome插件Sui钱包安装

- [Sui Wallet](https://chrome.google.com/webstore/detail/opcgpfmipidbgpenhmajoajpbobppdil)

### 2.0 方案一：Sui CLI编译安装(慢)

- a. 安装rust & cargo
```shell
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
- b. 安装sui-cli
```shell
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch devnet sui
```

### 2.1 方案二：使用Docker镜像(推荐)

```shell
# 镜像tag：devnet | testnet | mainnet
docker pull mysten/sui-tools:devnet
# 启动指定网络sui-cli容器并指定数据卷挂载 (可使用 pwd 查看项目目录位置)
docker run --name suimain -itd -v /root/letsmove:/letsmove mysten/sui-tools:mainnet
# 进入容器执行sui指令
docker exec -it suimain bash
```

### 3. sui-cli常用指令
```shell
# 列出当前所有网络别名: devnet, testnet, mainnet
sui client envs
# 切换到测试网
sui client switch --env testnet

# 查询当前保存了密钥的地址
sui client addresses
# 查询当前启用的地址
sui client active-address
# 切换活跃地址
sui client switch --address [ADDRESS]

# 列出所拥有的 gas objects (gas objects 是一种用于支付交易费用的特殊资产) 1.22版本可查询sui余额
sui client gas

# 创建新钱包地址
sui client new-address ed25519
# 助记词回显字段：recoveryPhrase
# 导出私钥方法一
sui keytool export --key-identity [KEY_IDENTITY||ADDRESS] # 私钥以suiprivkey开头
# 导出私钥方法二
sui keytool list # 查看地址信息，顺序对应sui.keystore文件中的list
cat ~/.sui/sui_config/sui.keystore # 每个$BASE64_STR key对应sui keytool list中的地址
sui keytool convert [$BASE64_STR] # 导出对应地址的私钥(bech32WithFlag)

# 导入私钥
sui keytool import [PRIVATE_KEY]  ed25519 # 加密方式v1.21.0-42fce1d30

# 创建项目
sui move new [project_name]
# 发布项目
sui client publish --gas-budget 200000000 .  --skip-dependency-verification
```

- [获取测试网络SUI](https://intro-zh.sui-book.com/unit-one/lessons/1_%E9%85%8D%E7%BD%AE%E7%8E%AF%E5%A2%83.html#%E8%8E%B7%E5%BE%97%E6%B5%8B%E8%AF%95%E7%BD%91-testnet-%E7%9A%84-sui-tokens)

- 频道：https://discord.com/channels/916379725201563759/1037811694564560966

### 4. Hello Move

- a. 创建一个新的项目
```shell
sui move new hello_world
# sources文件夹用于存放move文件，命名都采用RUST命名规范，下划线分割
# 配置文件 Move.toml
```

- b. 发布项目
```shell
# cd 到项目目录
sui client publish --gas-budget 200000000 .

```
主网scan：https://suiscan.xyz/mainnet/home
测试网scan：https://suiscan.xyz/testnet/home

- c. 尝试调用合约
```shell
# sui client call --package <合约地址> --module <模块名> --function <函数名> --gas-budget 10000000 --args "<参数1>, <参数2>"

sui client call --package 0xea39d5d8336007350aad11071fc936a0bd6eeef349db65479b2f2f6190b7b303 --module hello_world --function mint --gas-budget 10000000
```

## task2

```shell
# 切换至主网
sui client envs
sui client new-env --alias=mainnet --rpc https://fullnode.mainnet.sui.io:443
sui client switch --env mainnet
```

```shell
# 部署
sui client publish  .
```

在可视化web界面调用mint.

## task3

准备一些nft图片：

![175721_5](https://img.zhulijun.club/app/thumb.php?img=/i/2024/04/03/175721_5.png)

![175721_4](https://img.zhulijun.club/app/thumb.php?img=/i/2024/04/03/175721_4.png)

![175721_3](https://img.zhulijun.club/app/thumb.php?img=/i/2024/04/03/175721_3.png)

![175721_2](https://img.zhulijun.club/app/thumb.php?img=/i/2024/04/03/175721_2.png)

![175721_1](https://img.zhulijun.club/app/thumb.php?img=/i/2024/04/03/175721_1.png)

![175721](https://img.zhulijun.club/app/thumb.php?img=/i/2024/04/03/175721.png)

## task4

game: 生成一个随机数，最后通过%2得到0或1，通过比较输入，得出结论.

## task5
