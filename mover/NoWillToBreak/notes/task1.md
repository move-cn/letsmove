1. 安装 done
2. 发布合约
```
sui move new task_one
```
2.1 写入代码 
```
#task_one/sources/my_module
module task_one::my_module {

    // Part 1: Imports
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    // Part 2: Struct definitions
    struct Sword has key, store {
        id: UID,
        magic: u64,
        strength: u64,
    }

    struct Forge has key, store {
        id: UID,
        swords_created: u64,
    }

    // Part 3: Module initializer to be executed when this module is published
    fun init(ctx: &mut TxContext) {
        let admin = Forge {
            id: object::new(ctx),
            swords_created: 0,
        };
        // Transfer the forge object to the module/package publisher
        transfer::public_transfer(admin, tx_context::sender(ctx));
    }

    // Part 4: Accessors required to read the struct attributes
    public fun magic(self: &Sword): u64 {
        self.magic
    }

    public fun strength(self: &Sword): u64 {
        self.strength
    }

    public fun swords_created(self: &Forge): u64 {
        self.swords_created
    }

    // Part 5: Public/entry functions (introduced later in the tutorial)

    // Part 6: Private functions (if any)

}
```
```
2.2 build
```
sui move build
```
2.3 test
```
#[test]
public fun test_sword_create() {

    // Create a dummy TxContext for testing
    let ctx = tx_context::dummy();

    // Create a sword
    let sword = Sword {
        id: object::new(&mut ctx),
        magic: 42,
        strength: 7,
    };

    // Check if accessor functions return correct values
    assert!(magic(&sword) == 42 && strength(&sword) == 7, 1);
    let dummy_address = @0xCAFE;
transfer::transfer(sword, dummy_address);
```
```
sui move test
```
2.4 deploy
修改测试网配置
```
envs:
  - alias: test
    rpc: "https://fullnode.testnet.sui.io:443"
    ws: ~
active_env: test
```
领取测试水龙头
```
sui client publish ./  --gas 0xc96f4e556fef2dd1e5777a54794dbe3ad67276e0a31a128ee0c903f5d95db0fa  --gas-budget 10000000
Transaction Digest: 47ntwrJABaS2S2EQBG1AMmbWFdjm2iH6toengEWiqKuM
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                   │
│ Gas Owner: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                │
│ Gas Budget: 10000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xc96f4e556fef2dd1e5777a54794dbe3ad67276e0a31a128ee0c903f5d95db0fa                                    │
│  │ Version: 835342                                                                                           │
│  │ Digest: 4Bi3gQmzS6VBbiX7wkU38jE8wNiKSmdUCMwKEaHNkJqU                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────╮                                  │
│ │ Commands                                                                │                                  │
│ ├─────────────────────────────────────────────────────────────────────────┤                                  │
│ │ 0  Publish:                                                             │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Dependencies:                                                        │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000001 │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000002 │                                  │
│ │  └                                                                      │                                  │
│ │                                                                         │                                  │
│ │ 1  TransferObjects:                                                     │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Arguments:                                                           │                                  │
│ │  │   Result 0                                                           │                                  │
│ │  │ Address: Input  0                                                    │                                  │
│ │  └                                                                      │                                  │
│ ╰─────────────────────────────────────────────────────────────────────────╯                                  │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    4onxFAEnPK7lzMgRDQqUPQMuDf3HMRz5Cp/b2APNfljcDzFWjKLu+HYLo7+aZiE+ZbuM+LfDoY9YtHcMxeHqCA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 47ntwrJABaS2S2EQBG1AMmbWFdjm2iH6toengEWiqKuM                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 313                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1a2cdf4a3df479fa2d97f88562f632c1dad134503c456ed29b572c1dd9d9ce32                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 8nQpV2YAQry9HPRxAFecy7RomwKJL9Ay7dyrQjBNgYru                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xad9bbc737e5a157bc33f55333ed111b7abfaa91119828f3e9a899834596642a5                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 835343                                                                                │
│  │ Digest: 9fF6NvGcVurdMqht6neH2M888cKaZbEW7afh9Gzr7SNj                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb12546ab597c2b6e7d5d95868eceb20c0288cfceb9018d849c92f670c3ba7557                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 835343                                                                                │
│  │ Digest: 2CUidUydL3R5f7T3vNMpkaNu5MSo81gks8Zr6XYu6dky                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xc96f4e556fef2dd1e5777a54794dbe3ad67276e0a31a128ee0c903f5d95db0fa                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 835343                                                                                │
│  │ Digest: Bf9pRuMXxEffgf2Jk8c6UYVUNfDTcT9rJXmjVvwrREkK                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xc96f4e556fef2dd1e5777a54794dbe3ad67276e0a31a128ee0c903f5d95db0fa                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 835343                                                                                │
│  │ Digest: Bf9pRuMXxEffgf2Jk8c6UYVUNfDTcT9rJXmjVvwrREkK                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 9697600 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6LXfXXK9Eyc6kd6eh2kHAsrMuNM2kuA1WwZ78K63k2s8                                                   │
│    8WonJruducXyXj9Hz2syDBg188kjBfiZ8j88WVBLvEpM                                                   │
│    GZcMfNx5jvGHsfSKEHJD7jZss7yCHqEGfhVk8Jx8a2N1                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                     │
│  ┌──                                                                                                 │
│  │ ObjectID: 0xad9bbc737e5a157bc33f55333ed111b7abfaa91119828f3e9a899834596642a5                      │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                        │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )     │
│  │ ObjectType: 0x1a2cdf4a3df479fa2d97f88562f632c1dad134503c456ed29b572c1dd9d9ce32::my_module::Forge  │
│  │ Version: 835343                                                                                   │
│  │ Digest: 9fF6NvGcVurdMqht6neH2M888cKaZbEW7afh9Gzr7SNj                                              │
│  └──                                                                                                 │
│  ┌──                                                                                                 │
│  │ ObjectID: 0xb12546ab597c2b6e7d5d95868eceb20c0288cfceb9018d849c92f670c3ba7557                      │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                        │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )     │
│  │ ObjectType: 0x2::package::UpgradeCap                                                              │
│  │ Version: 835343                                                                                   │
│  │ Digest: 2CUidUydL3R5f7T3vNMpkaNu5MSo81gks8Zr6XYu6dky                                              │
│  └──                                                                                                 │
│ Mutated Objects:                                                                                     │
│  ┌──                                                                                                 │
│  │ ObjectID: 0xc96f4e556fef2dd1e5777a54794dbe3ad67276e0a31a128ee0c903f5d95db0fa                      │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                        │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )     │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                        │
│  │ Version: 835343                                                                                   │
│  │ Digest: Bf9pRuMXxEffgf2Jk8c6UYVUNfDTcT9rJXmjVvwrREkK                                              │
│  └──                                                                                                 │
│ Published Objects:                                                                                   │
│  ┌──                                                                                                 │
│  │ PackageID: 0x1a2cdf4a3df479fa2d97f88562f632c1dad134503c456ed29b572c1dd9d9ce32                     │
│  │ Version: 1                                                                                        │
│  │ Digest: 8nQpV2YAQry9HPRxAFecy7RomwKJL9Ay7dyrQjBNgYru                                              │
│  │ Modules: my_module                                                                                │
│  └──                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -9719480                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

2.4 交互
```
sui client ptb \
    --assign forge @0xad9bbc737e5a157bc33f55333ed111b7abfaa91119828f3e9a899834596642a5 \
    --move-call 0x1a2cdf4a3df479fa2d97f88562f632c1dad134503c456ed29b572c1dd9d9ce32::my_module::swords_created forge \
    --gas-budget 20000000
```
```
Transaction Digest: F8B2oMExh8Xt8R7UpzmXqydj3mDyJL7D66h6K3uWEow4
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                      │
│ Gas Owner: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                   │
│ Gas Budget: 20000000 MIST                                                                       │
│ Gas Price: 1000 MIST                                                                            │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x219dcb6bbe7722f2d982bab17ebeb9375ad8d4cad8e4e3c2aa034c53ad744691                       │
│  │ Version: 26345997                                                                            │
│  │ Digest: 9QYAN2LRGYoKwkRb1pG1tTWQL437bQBmzy7fHyuyHchE                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0xad9bbc737e5a157bc33f55333ed111b7abfaa91119828f3e9a899834596642a5 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  swords_created                                                     │            │
│ │  │ Module:    my_module                                                          │            │
│ │  │ Package:   0x1a2cdf4a3df479fa2d97f88562f632c1dad134503c456ed29b572c1dd9d9ce32 │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    BzT9ED8B0jEtMMkp4bs9s5aCH5qmfgHoxWImms9Xk5LYlSMPfG1NbCIuTAFskLbd87/d4cIEjfV9o9S+RfIWCg==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: F8B2oMExh8Xt8R7UpzmXqydj3mDyJL7D66h6K3uWEow4                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 313                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x219dcb6bbe7722f2d982bab17ebeb9375ad8d4cad8e4e3c2aa034c53ad744691                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 26345998                                                                              │
│  │ Digest: 9KTY2n2FcgDoCXYHdneQzihADVbP2xXRU4wgnBKAijRN                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xad9bbc737e5a157bc33f55333ed111b7abfaa91119828f3e9a899834596642a5                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 26345998                                                                              │
│  │ Digest: GGuY4WE8Z4b8gwNQC9xZrrqxMsr7X8nKHkW1yKxicXqd                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x219dcb6bbe7722f2d982bab17ebeb9375ad8d4cad8e4e3c2aa034c53ad744691                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 26345998                                                                              │
│  │ Digest: 9KTY2n2FcgDoCXYHdneQzihADVbP2xXRU4wgnBKAijRN                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2348400 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2324916 MIST                                                                   │
│    Non-refundable Storage Fee: 23484 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2BQQbe1gnYsbabhH6ZvYEYzx6hcnmRmhfrrSybonmgJG                                                   │
│    47ntwrJABaS2S2EQBG1AMmbWFdjm2iH6toengEWiqKuM                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                     │
│  ┌──                                                                                                 │
│  │ ObjectID: 0x219dcb6bbe7722f2d982bab17ebeb9375ad8d4cad8e4e3c2aa034c53ad744691                      │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                        │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )     │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                        │
│  │ Version: 26345998                                                                                 │
│  │ Digest: 9KTY2n2FcgDoCXYHdneQzihADVbP2xXRU4wgnBKAijRN                                              │
│  └──                                                                                                 │
│  ┌──                                                                                                 │
│  │ ObjectID: 0xad9bbc737e5a157bc33f55333ed111b7abfaa91119828f3e9a899834596642a5                      │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                        │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )     │
│  │ ObjectType: 0x1a2cdf4a3df479fa2d97f88562f632c1dad134503c456ed29b572c1dd9d9ce32::my_module::Forge  │
│  │ Version: 26345998                                                                                 │
│  │ Digest: GGuY4WE8Z4b8gwNQC9xZrrqxMsr7X8nKHkW1yKxicXqd                                              │
│  └──                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -1023484                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```