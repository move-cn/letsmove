# gzliudan

## 基本信息

- Sui钱包地址: `0x4f5bc8bc8c7cc9f5f645d342d06de17fea8cc5aba61292fbe46bd682479528eb`

> 首次参与需要完成第一个任务注册好钱包地址才被合并，并且后续学习奖励会打入这个地址

- github: [gzliudan](https://github.com/gzliudan)

## 个人简介

- 工作经验: 28年
- 技术栈: Rust, C++, C, Go, Python, Solidity, Java, Shell, SQL
- 4年区块链开发经验，对Move特别感兴趣，想入门Move
- 联系方式:
  - tg: [gzliudan](https://t.me/gzliudan)
  - email: <139250065@qq.com>

## 任务

## 01 hello move  

- [X] package id:
  - devnet:  0xdc4cbdff9758fbc90ec1bba5301432c32f7bda8d24e1b77dfa75833585eab185
  - testnet: 0x035dafe6d77154ce12fa57a7f62ef7af422488364e458f48572c6206339b8b7b

## 02 move coin

### 2.1 文件

[源代码](./task2/)

### 2.2 编译

```bash
sui move build
sui move test
```

### 2.3 测试网

```bash
sui client switch --env testnet 
sui client publish 

ADDRESS="0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2"
PACKAGE_ID="0xf6743ed0cba33d6119bb5472cdb328f8afcfffcd61323e73d6e950e62ee26da6"
COIN_TREASURY="0x372d345064295e3389d861ab2606fedba5052ffa1052f7f89d7170a93174806a"
FAUCET_TREASURY="0xbda736c2929a2630c6b01bb2291b1994477e22f132242aaa4ef6623afbb6f42f"

# Transaction Digest: 6AEduZbZdCBw2gzirLJd5LfBEhiMW4w6QxtqMQ8vWFrj
sui client call --package ${PACKAGE_ID} --module gzliudan_coin --function mint --args ${COIN_TREASURY} 100 ${ADDRESS} 

# Transaction Digest: 3v3j9Wpv2HozZ44nsxTMjMtKn62QHdPiJMnfhAirCxd2
sui client call --package ${PACKAGE_ID} --module gzliudan_faucet --function mint --args ${FAUCET_TREASURY} 100 ${ADDRESS} 
```

### 2.4 主网

```bash
sui client switch --env mainnet
sui client publish 

ADDRESS="0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2"
PACKAGE_ID="0x0fe40e15fb138fce7c11fd341b173a8ddc3184c389147f3f7044aa4f1e2677ea"
COIN_TREASURY="0x47f21bde78897543b6f3864b8f46c2c8414e74e6a5961e7fa8414091e1e75b02"
FAUCET_TREASURY="0x20651eff485bf329ea2aa8c1fb2a73e6cac00feddfc322d000e30d5ca71fd648"

# Transaction Digest: GXu4gp5TkK8PfwvS51qRFY7CiBszdHDS4hcjew5jKfLe
sui client call --package ${PACKAGE_ID} --module gzliudan_coin --function mint --args ${COIN_TREASURY} 100 ${ADDRESS} 

# Transaction Digest: 2cicQW8ZA5DmBgAwhvdpG3guehp1zJzb1BbHTDymGzyh
sui client call --package ${PACKAGE_ID} --module gzliudan_faucet --function mint --args ${FAUCET_TREASURY} 100 ${ADDRESS} 
```

### 2.5 结果

- 主网
  - package id: 0x0fe40e15fb138fce7c11fd341b173a8ddc3184c389147f3f7044aa4f1e2677ea
  - gzliudan_coin object id : 0x47f21bde78897543b6f3864b8f46c2c8414e74e6a5961e7fa8414091e1e75b02
  - gzliudan_faucet object id : 0x20651eff485bf329ea2aa8c1fb2a73e6cac00feddfc322d000e30d5ca71fd648
  - mint gzliudan_coin hash: [GXu4gp5TkK8PfwvS51qRFY7CiBszdHDS4hcjew5jKfLe](https://suiexplorer.com/txblock/GXu4gp5TkK8PfwvS51qRFY7CiBszdHDS4hcjew5jKfLe)
- 测试网
  - package id: 0xf6743ed0cba33d6119bb5472cdb328f8afcfffcd61323e73d6e950e62ee26da6
  - gzliudan_coin object id : 0x372d345064295e3389d861ab2606fedba5052ffa1052f7f89d7170a93174806a
  - gzliudan_faucet object id : 0xbda736c2929a2630c6b01bb2291b1994477e22f132242aaa4ef6623afbb6f42f
  - mint gzliudan_coin hash: [6AEduZbZdCBw2gzirLJd5LfBEhiMW4w6QxtqMQ8vWFrj](https://suiexplorer.com/txblock/6AEduZbZdCBw2gzirLJd5LfBEhiMW4w6QxtqMQ8vWFrj?network=testnet)

## 03 move NFT

[源代码](./task3/)

### 3.1 测试网

- [X] nft package id: 0x82726bc631c741d5a990d4ac8ac86ee6d6803efa271f9cf8b73e7d543f431e3b
- [X] nft object id: [0x8a25c6c81e44a8b4bd665ae72cc20e2b958af1668bd2bc6e414058f7ae6d38f3](https://suiscan.xyz/testnet/object/0x8a25c6c81e44a8b4bd665ae72cc20e2b958af1668bd2bc6e414058f7ae6d38f3)
- [X] 转账 nft  hash: [ARexvaYinzHi6AHBPdjk1Pd58aq1G86h68Em6ssZLmJt](https://suiscan.xyz/testnet/tx/ARexvaYinzHi6AHBPdjk1Pd58aq1G86h68Em6ssZLmJt)

命令：

```bash
PACKAGE_ID="0x82726bc631c741d5a990d4ac8ac86ee6d6803efa271f9cf8b73e7d543f431e3b"
name="gzliudan"
email="139250065@qq.com"
description="Daniel Liu"
url="https://avatars.githubusercontent.com/u/7695325?v=4"
sui client call  --package ${PACKAGE_ID} --module github_medal --function mint --args ${name} ${email} "${description}" ${url}

nft_id="0x8a25c6c81e44a8b4bd665ae72cc20e2b958af1668bd2bc6e414058f7ae6d38f3"
address="0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2"
sui client call  --package ${PACKAGE_ID} --module github_medal --function transfer --args ${nft_id} ${address}
```

### 3.2 主网

- [X] nft package id: 0x44844ea0a1ca0c4e334b1014371978c236b13bcd257a531e93d77940e50e2ff1
- [X] nft object id: [0x68969f7a64bac1ed12139272df871ef2c854e865694486427a3db81fff3781f9](https://suiscan.xyz/mainnet/object/0x68969f7a64bac1ed12139272df871ef2c854e865694486427a3db81fff3781f9)
- [X] 转账 nft  hash: [5hAYTfQLke1X9zkjBHxZ5Va3pMRZTFPpMQ3rFBssrmKY](https://suiscan.xyz/mainnet/tx/5hAYTfQLke1X9zkjBHxZ5Va3pMRZTFPpMQ3rFBssrmKY)

命令：

```bash
PACKAGE_ID="0x44844ea0a1ca0c4e334b1014371978c236b13bcd257a531e93d77940e50e2ff1"
name="gzliudan"
email="139250065@qq.com"
description="Daniel Liu"
url="https://avatars.githubusercontent.com/u/7695325?v=4"
sui client call  --package ${PACKAGE_ID} --module github_medal --function mint --args ${name} ${email} "${description}" ${url}

nft_id="0x68969f7a64bac1ed12139272df871ef2c854e865694486427a3db81fff3781f9"
address="0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2"
sui client call  --package ${PACKAGE_ID} --module github_medal --function transfer --args ${nft_id} ${address}
```

## 04 Move Game

- [] game package id :
- [] call game hash:

## 05 Move Swap

- [] swap package id :
- [] call swap hash:

## 06 SDK PTB

- [] save hash :
