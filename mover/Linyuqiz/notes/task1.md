# Task 1 - Hello Move

## 1. Sui Cli 版本
![alt text](image.png)

## 2. 创建 Move 项目
```
sui move new hello
```

## 3. 编译 Move 项目
```
sui move build
```

## 4. 编写 Hello Move 合约
```move
module hello::Hello {
    use std::ascii::{String, string};
    use sui::transfer::transfer;

    public struct Hello has key, store {
        id: UID,
        content: String
    }

    fun init(ctx: &mut TxContext) {
        transfer(Hello {
            id: object::new(ctx),
            content: string(b"Hello, Move!"),
        }, tx_context::sender(ctx))
    }
}
```

## 5. 初始化本地 Move 环境
![alt text](./%20task1-img/image-1.png)

## 6. Sui 测试账户地址
![alt text](./%20task1-img/image-2.png)

## 7. 领取测试币
![alt text](./%20task1-img/image-3.png)

## 8. 部署 Hello Move 合约
![alt text](./%20task1-img/image-4.png)

## 9. 查看 Hello Move 合约
https://testnet.suivision.xyz/txblock/4CeGpVB7rFM5WTSuzRztUqJcnWAW4SzMMr3JNRaVfgV3
![alt text](./%20task1-img/image-5.png)