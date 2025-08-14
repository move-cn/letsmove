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
sui client publish  --skip-dependency-verification
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


## task3
### 创建项目
```sui move new nfg_example```

### 构建、发布
```bash
sui move build
sui client publish --gas-budget=50000000 
```

输出：
```
    package id: 0xb01abee6307b48e001f17f06dcd42db9341aae627a74145859142a03e486ffd0
```

## mint&转账
### mint
```bash
sui client call  --gas-budget 50000000 --function mint_nft --module my_nft --package 0xb01abee6307b48e001f17f06dcd42db9341aae627a74145859142a03e486ffd0 --args "joker" "twitter joker" "https://png.pngtree.com/png-clipart/20190904/original/pngtree-clown-cartoon-png-material-png-image_4477011.jpg"
```

```
    object id: 0xbf7f5bd4609c1f3cd079e2368e843bb83459f1a494a3342def5860ccc4b7bff1
```

### 转账
```bash
sui client call --gas-budget 50000000 --function transfer_nft --module my_nft --package 0xb01abee6307b48e001f17f06dcd42db9341aae627a74145859142a03e486ffd0 --args 0xbf7f5bd4609c1f3cd079e2368e843bb83459f1a494a3342def5860ccc4b7bff1 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
```


## task4
### 创建项目
```sui move new my_game```

### 构建、发布
```bash
sui move build
sui client publish --gas-budget=50000000 
```

输出：
```
    package id: 0x9bd43cf0419dcfbf0acc1ea83445efb0e1bae7a10a56f845c9bdca13e34d63b5
```

### play
```bash
sui client call --gas-budget 7500000 --package 0x9bd43cf0419dcfbf0acc1ea83445efb0e1bae7a10a56f845c9bdca13e34d63b5 --module my_game --function play --args 0 0x6
```


## task5
### 创建项目
```sui move new my_swap```

### 构建、发布
```bash
sui move build
sui client publish --gas-budget=50000000 
```

输出：
```
    package id： 0x8a3f4c8e381ea0590659504d44f6891b296caa5e611dcff560c88370df30da2e
    admin-cap： 0xc40acc422b5d2de3d88677e08d91019cf27db5b4ec3d64fe94c2293410b20707
```

### 初始化，要放点钱进去
```bash
# FAUCETCoin 0xfe1458e359b848cc712e6ebac282ef4d1a7b28e0875d870c4f290b1c617a285b::faucet_coin::FAUCET_COIN
# MYCoin 0xfe1458e359b848cc712e6ebac282ef4d1a7b28e0875d870c4f290b1c617a285b::mycoin::MYCOIN
```
```bash
sui client call --function initialize --module my_swap --package 0x8a3f4c8e381ea0590659504d44f6891b296caa5e611dcff560c88370df30da2e --args 0xc40acc422b5d2de3d88677e08d91019cf27db5b4ec3d64fe94c2293410b20707 0x2fa04343c3fe53c1920a386982750f0e8736265622ad9c863a9a95aad6c7bde0 0xd0fa5c8727f3aa593d20e047c1e824a95ad6ef14479c89dd1b0b0c5082072d3a 100 --type-args 0xfe1458e359b848cc712e6ebac282ef4d1a7b28e0875d870c4f290b1c617a285b::faucet_coin::FAUCET_COIN 0xfe1458e359b848cc712e6ebac282ef4d1a7b28e0875d870c4f290b1c617a285b::mycoin::MYCOIN --gas-budget 50000000
```

```bash
homeData: 0x9e77c7bbd9ce7549362e45a5b037a193b17f8b0ee25948dc43d5bb6d68926c70
```