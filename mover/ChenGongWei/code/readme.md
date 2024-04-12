# 任务笔记
## task1
### 创建项目
```sui move new hello_world```

### 代码
```
module hello_world::task1 {
    // Part 1: imports
    use sui::transfer;
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};

    // Part 2: struct definition
    struct Counter has key {
        id: UID,
        value: u64,
    }

    // Part 3: transfer the counter object to the sender
    entry public fun getCounter(ctx: &mut TxContext) {
        // sender address
        let sender = tx_context::sender(ctx);
        let counter_obj = Counter {
            id: object::new(ctx),
            value: 0
        };
        transfer::transfer(counter_obj, sender);
    }

    // part 4: public/ entry functions
    public entry fun incr(counter: &mut Counter) {
        counter.value = counter.value + 1;
    } 
}
```

### 构建
```
sui move build
```

### 发布
```
sui client publish --gas-budget 100000000 --skip-dependency-verification
```


## task2
### 创建项目
```sui move new coin_demo```

### 构建、发布
```bash
sui move build
sui client publish --gas-budget=50000000 
```

输出：
```
    packageid： 0xfe1458e359b848cc712e6ebac282ef4d1a7b28e0875d870c4f290b1c617a285b
    MYCoin TreasuryCap: 0xf34d136051585e67567e046478b219efa3f809cc46303b1768419e30785a59ba
    FaucetCoin TreasuryCap: 0xfa918b2be63630b2c4735b09b600373579a5f55453cd7415dc524c9a53c68d1d
```

## mint&转账
### mint
```bash
sui client call --function mint --module mycoin --package 0xfe1458e359b848cc712e6ebac282ef4d1a7b28e0875d870c4f290b1c617a285b --args 0xf34d136051585e67567e046478b219efa3f809cc46303b1768419e30785a59ba 100000000000 0xf5ab0303f5df5dc4627073559578e9a702739c998efa608e497c1c63a0961228 --gas-budget 50000000

sui client call --function mint --module faucet_coin --package 0xfe1458e359b848cc712e6ebac282ef4d1a7b28e0875d870c4f290b1c617a285b --args 0xfa918b2be63630b2c4735b09b600373579a5f55453cd7415dc524c9a53c68d1d 100000000000 0xf5ab0303f5df5dc4627073559578e9a702739c998efa608e497c1c63a0961228 --gas-budget 50000000
```

### 给老板发点MYCoin
```bash
sui client call --function mint --module mycoin --package 0xfe1458e359b848cc712e6ebac282ef4d1a7b28e0875d870c4f290b1c617a285b --args 0xf34d136051585e67567e046478b219efa3f809cc46303b1768419e30785a59ba 100000000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000
```