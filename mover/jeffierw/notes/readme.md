##   01 hello move  
- [] package id: 0x14438265c2836a22b73c5bdd2b94d551d573e3a8c66607278ea20832152a51d4
- 日志：
mac使用brew安装，没有什么问题。
build和publish时，因为用了最新版的sui，需要先把toml文件的`edition = "2024.alpha"`注释打开。
task1使用`sui move new hello_move`创建项目，使用了`struct`创建结构体，`has key`表示拥有key abllity，
通过`init`函数部署合约时自动调用，实例化Hello结构体，并通过`transfer`方法将实例化的结果传递给调用者。

##   06 用 Sui SDK 和 Navi SDK 在Navi Protocol 存入 1 SUI
- [] save hash: ADAHwEK8tSxBqb4623VYm22MmZbJonrWhDgQznjh6ywG
- 日志：
看了ptb sdk 和navi sdk的文档，可以直接调用navi sdk的`account.depositToNavi(coinType: CoinInfo, amount: number)`方法，
因为想学习下ptb 用了另一个api`depositCoin(txb: TransactionBlock, _pool: PoolConfig, coinObject: any, amount: number)`
从depositToNavi的源码来看 封装了sui的ptb部分：
```ts
async depositToNavi(
    coinType: CoinInfo,
    amount: number
  ) {
    const coinSymbol = coinType.symbol;

    let txb = new TransactionBlock();
    let sender = this.getPublicKey();
    txb.setSender(sender);
    console.log(coinSymbol)
    const pool_real: PoolConfig = pool[coinSymbol as keyof Pool];

    let getCoinInfo = await this.getCoins(coinType.address);
    if (!getCoinInfo.data[0]) {
      throw new Error("Insufficient balance for this Coin");
    }
    if (coinSymbol == "Sui") {
      const [to_deposit] = txb.splitCoins(txb.gas, [amount]);
      depositCoin(txb, pool_real, to_deposit, amount);
    } else {
      //Try to merge all the tokens to one object
      const mergedCoinObject = mergeCoins(txb, getCoinInfo);
      depositCoin(txb, pool_real, mergedCoinObject, amount);
    }
    const result = SignAndSubmitTXB(txb, this.client, this.keypair);
    return result;
  }
```