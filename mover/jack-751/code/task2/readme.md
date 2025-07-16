# 完成两个Coin合约的上链部署

- 上链网络: mainnet

## 需求

- 完成 Coin相关知识的学习
- 完成 `My Coin` 的学习并部署主网
- 完成 `Faucet Coin` 的学习并部署主网
- 提交 `My Coin` 和 `Faucet Coin` 合约发布 `package id`
- 发送 `My Coin`  给地址 `0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`
- `Faucet Coin` 需要至少用两个地址mint

# 学习要点

1. 理解Coin协议 创建Coin
2. 理解独享所有权和共享所有权的区别
3. 对共享所有权保持敬畏 因为权限被共享了

public_transfer 独享 mint权限
public_share_object 共享 mint权限

## 任务指南

- `Faucet Coin` 就是任意人都可以mint的Coin
- `My Coin`  只能指定地址mint
