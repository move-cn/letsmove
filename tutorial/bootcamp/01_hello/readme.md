## 学习资源
-  [PPT](https://docs.google.com/presentation/d/1s3zfVe_yHz4cDI44hKh5bc5TlYL5GmdiAFB-buj-bnk) 
-  [什么是Move](https://mp.weixin.qq.com/s/MEZXP8l8x67lBDZWQsgg8g)
-  [什么是智能合约](https://mp.weixin.qq.com/s/5yQuNUsa0lt-krJint_lkw)
-  [钱包和区块链浏览器](https://mp.weixin.qq.com/s/9Zc2u5l8c1LiatNNEkN_Ow)

# 运行前提

## 安装好Sui Cli （move编译器）
-  [sui安装文档](https://docs.sui.io/guides/developer/getting-started/sui-install)
-  [预编译的下载包](https://github.com/MystenLabs/sui/releases)
### docker 方式的安装
pull 镜像  `devnet` 可以换成 `testnet` `mainnet`
```shell
  docker pull mysten/sui-tools:devnet
``` 
运行镜像
```shell
  docker run --name suidevcontainer -itd mysten/sui-tools:devnet

  docker exec -it suidevcontainer bash
```    

## 如何验证自己是否安装好
```shell
sui --version
```

输出
```shell 
sui 1.22.0-0362997459
```


## 安装Sui钱包
* [Sui Wallet](https://chrome.google.com/webstore/detail/opcgpfmipidbgpenhmajoajpbobppdil)  |    [教程-如何开始使用Sui钱包](https://mp.weixin.qq.com/s/-_hCFUO-62hv9amPzmJdeg)
* [Suiet Wallet](https://chrome.google.com/webstore/detail/suiet-sui-wallet/khpkpbbcccdmmclmpigdgddabeilkdpd)   |  [教程-如何获取Suiet钱包](https://suiet.app/blog/what-is-suiet-sui-wallet-how-to-use-sui-wallet)
* [surf](https://surf.tech)
* [Ethos Wallet](https://ethoswallet.xyz/)

## 熟悉区块链浏览器
- https://suiscan.xyz/
- https://suivision.xyz/

## 获取测试网 SUI
-  [水龙头1](https://github.com/uvd/sui-faucet)
-  [水龙头2](https://docs.sui.io/guides/developer/getting-started/get-coins)

```shell
sui client addresses 
```

```shell

curl --location --request POST 'https://faucet.devnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "0xff71ff2dfa9f5ba0176fb40fdda9d13d738ec97143b46bdfa1addc09e2263b02"
    }
}'
```


### 创建项目

```shell
sui move new hello_move
```

```move
module hello_move::hello {
    use std::ascii::{String, string};
    use sui::object::{Self,UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct Hello has key{
        id:UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_move = Hello {
            id:object::new(ctx),
            say: string(b"move"),
        };
        transfer(hello_move, sender(ctx));
    }
}
```


### 发布上链
```shell
sui client publish --gas-budget 100000000
```


# 提交作业 hello move的作业  30人民币等值SUI的奖励
- [let's move](https://github.com/move-cn/letsmove) 


