#  完成NFT的上链部署
- 上链网络: 主网(mainnet)

## 需求
- 完成 NFT相关知识的学习
- 完成可以mint NFT的合约上链
- 给自己地址mint一个NFT
-  NFT必须是自己 github 的头像作为图片
- mint 一个 nft 发送到地址: `0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`

## 任务指南

Publish NFT Conrtact

```bash
sui client publish --gas-budget 78400952
```

PackageID:`0x76f7b3160dcf36011c006fc154b9a72de4f8929d2e02da168b63a11a0c2e4ba2`

内部提供了公共函数,可以在DAPP和RPC上直接调用`mint`

```
public entry fun mint(){}
```