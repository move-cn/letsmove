# Task2

## mycoin
编写合约如下:
```move
module mycoin::mycoin {
    use sui::coin::{Self, TreasuryCap};

    public struct MYCOIN has drop {}

    fun init(witness: MYCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness, 
            6, 
            b"LingLingcc", 
            b"LingLingcc", 
            b"LingLingcc coin for test", 
            option::none(), 
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<MYCOIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }
}
```

然后进行本地编译，部署上链:
```bash
❯ sui move build     
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING mycoin
❯ sui client publish --gas-budget 30000000 .
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING mycoin
Successfully verified dependencies on-chain against source.
Transaction Digest: EW89QiwjK13sSLu5eeWKe87JmC25ByK33RF5vQk7YhTV
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                   │
│ Gas Owner: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                │
│ Gas Budget: 30000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                                    │
│  │ Version: 91908807                                                                                         │
│  │ Digest: 9QkuzLizhCXM7s4EZ2bkmaT3H91hra2sV4p1Dmxw4VaU                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645" │ │
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
│    D+C/WR27Vf29A/m1y9iDywWScQK/bseRi0gATb9JFkB7SWtT0HVk7Vt2/R+E5SqziGCKzr/ftMW5uwKt5wdAAg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: EW89QiwjK13sSLu5eeWKe87JmC25ByK33RF5vQk7YhTV                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 369                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x22b54c379e15b5a71f54804757cedd0e79ccdf7459d92afaa2bdb4836fbe0976                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908808                                                                              │
│  │ Digest: GBGDgBVG6nZT6wC3ScSv96HVXxhXDaE7vtxVKkbYQerz                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x47289c1a0ebde32ddb9abb13f3e786010e49ff4cfd229ab344ad2fdd0290b5cf                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908808                                                                              │
│  │ Digest: 2Hn75aLJZn4FQRb8ST9aMGd7f8VuryB8aMyrBDvWxdq4                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x5b4ed860c1ecf8fbeac07fba4f1daf28f6f588dd6b75e80ee7d259bf44fdd5f0                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 2nNh6mVPnDy8PBie7h54avYxE5H9VdanLucq21BYQvs7                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xa60e228846e4b65da7a65d4f451be9fb97318b9aad497ed92a83fe4ef74e5b6b                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 91908808                                                                              │
│  │ Digest: 5rnqpw4Qi6Yx7DKz2NHQK5m9Df8iPjB5pLqsenSNWV6a                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908808                                                                              │
│  │ Digest: CgCpyrmpwBh95Re9T485Gt2E9zJEFa4wBPzLVRo3iAUT                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908808                                                                              │
│  │ Digest: CgCpyrmpwBh95Re9T485Gt2E9zJEFa4wBPzLVRo3iAUT                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 13566000 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
│    CjAv3BUaBBxPAKmLfjAwSamDiVYEELbL6uzayCLCFowC                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                              │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                            │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x22b54c379e15b5a71f54804757cedd0e79ccdf7459d92afaa2bdb4836fbe0976                                             │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                               │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )                            │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x5b4ed860c1ecf8fbeac07fba4f1daf28f6f588dd6b75e80ee7d259bf44fdd5f0::mycoin::MYCOIN>   │
│  │ Version: 91908808                                                                                                        │
│  │ Digest: GBGDgBVG6nZT6wC3ScSv96HVXxhXDaE7vtxVKkbYQerz                                                                     │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x47289c1a0ebde32ddb9abb13f3e786010e49ff4cfd229ab344ad2fdd0290b5cf                                             │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                               │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )                            │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                     │
│  │ Version: 91908808                                                                                                        │
│  │ Digest: 2Hn75aLJZn4FQRb8ST9aMGd7f8VuryB8aMyrBDvWxdq4                                                                     │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0xa60e228846e4b65da7a65d4f451be9fb97318b9aad497ed92a83fe4ef74e5b6b                                             │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                               │
│  │ Owner: Immutable                                                                                                         │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x5b4ed860c1ecf8fbeac07fba4f1daf28f6f588dd6b75e80ee7d259bf44fdd5f0::mycoin::MYCOIN>  │
│  │ Version: 91908808                                                                                                        │
│  │ Digest: 5rnqpw4Qi6Yx7DKz2NHQK5m9Df8iPjB5pLqsenSNWV6a                                                                     │
│  └──                                                                                                                        │
│ Mutated Objects:                                                                                                            │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                                             │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                               │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )                            │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                               │
│  │ Version: 91908808                                                                                                        │
│  │ Digest: CgCpyrmpwBh95Re9T485Gt2E9zJEFa4wBPzLVRo3iAUT                                                                     │
│  └──                                                                                                                        │
│ Published Objects:                                                                                                          │
│  ┌──                                                                                                                        │
│  │ PackageID: 0x5b4ed860c1ecf8fbeac07fba4f1daf28f6f588dd6b75e80ee7d259bf44fdd5f0                                            │
│  │ Version: 1                                                                                                               │
│  │ Digest: 2nNh6mVPnDy8PBie7h54avYxE5H9VdanLucq21BYQvs7                                                                     │
│  │ Modules: mycoin                                                                                                          │
│  └──                                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -13337880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

为地址 `0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2` mint Mycoin:
```bash
❯ sui client call --package 0x5b4ed860c1ecf8fbeac07fba4f1daf28f6f588dd6b75e80ee7d259bf44fdd5f0 --module mycoin --function mint --args 0x22b54c379e15b5a71f54804757cedd0e79ccdf7459d92afaa2bdb4836fbe0976 1 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-
budget 30000000
Transaction Digest: 3zwVUsFkgMgWx26jEbJztUVgbYNjtFUdwxJMqrRfGQu3
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                   │
│ Gas Owner: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                │
│ Gas Budget: 30000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                                    │
│  │ Version: 91908809                                                                                         │
│  │ Digest: GCr8iJDD1X9uZkt4kPEm4FQRqggnANVksfzzatCsrejw                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x22b54c379e15b5a71f54804757cedd0e79ccdf7459d92afaa2bdb4836fbe0976              │ │
│ │ 1   Pure Arg: Type: u64, Value: "1"                                                                      │ │
│ │ 2   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    mycoin                                                             │                         │
│ │  │ Package:   0x5b4ed860c1ecf8fbeac07fba4f1daf28f6f588dd6b75e80ee7d259bf44fdd5f0 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    V7QXeQzN6eg0ZVE/8TsC3V9p1rPuGHu1TXV+kp1LCNakiDSMKnWlYUrMwXbV1oFeB/UNFOA9OFw/vi3WtUV/DQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 3zwVUsFkgMgWx26jEbJztUVgbYNjtFUdwxJMqrRfGQu3                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 369                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x6143be1b4afa4af693f169804fc32ea6f4b3d44b28ff568a82a641631a0664e9                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 91908810                                                                              │
│  │ Digest: 5g5bamTkCdbsC6yur5e3k3Pvs4bQV5E2uLmFM1LCFe3H                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908810                                                                              │
│  │ Digest: AGESvzU9vWRESAjUr4L6aCfeakeRddzJpBzAucB8FS6e                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x22b54c379e15b5a71f54804757cedd0e79ccdf7459d92afaa2bdb4836fbe0976                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908810                                                                              │
│  │ Digest: 2mGP9Byinq62QvLpg6yu448p7NHPpyAruXQ8YXYMZiC9                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908810                                                                              │
│  │ Digest: AGESvzU9vWRESAjUr4L6aCfeakeRddzJpBzAucB8FS6e                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4073600 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2693592 MIST                                                                   │
│    Non-refundable Storage Fee: 27208 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    AU5PkBoHmpgU8tHF5nbERTNBX3FsRjhCkWWVjTTpV4q5                                                   │
│    EW89QiwjK13sSLu5eeWKe87JmC25ByK33RF5vQk7YhTV                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                             │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                           │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x6143be1b4afa4af693f169804fc32ea6f4b3d44b28ff568a82a641631a0664e9                                            │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                              │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )                           │
│  │ ObjectType: 0x2::coin::Coin<0x5b4ed860c1ecf8fbeac07fba4f1daf28f6f588dd6b75e80ee7d259bf44fdd5f0::mycoin::MYCOIN>         │
│  │ Version: 91908810                                                                                                       │
│  │ Digest: 5g5bamTkCdbsC6yur5e3k3Pvs4bQV5E2uLmFM1LCFe3H                                                                    │
│  └──                                                                                                                       │
│ Mutated Objects:                                                                                                           │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                                            │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                              │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )                           │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                              │
│  │ Version: 91908810                                                                                                       │
│  │ Digest: AGESvzU9vWRESAjUr4L6aCfeakeRddzJpBzAucB8FS6e                                                                    │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x22b54c379e15b5a71f54804757cedd0e79ccdf7459d92afaa2bdb4836fbe0976                                            │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                              │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )                           │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x5b4ed860c1ecf8fbeac07fba4f1daf28f6f588dd6b75e80ee7d259bf44fdd5f0::mycoin::MYCOIN>  │
│  │ Version: 91908810                                                                                                       │
│  │ Digest: 2mGP9Byinq62QvLpg6yu448p7NHPpyAruXQ8YXYMZiC9                                                                    │
│  └──                                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ CoinType: 0x5b4ed860c1ecf8fbeac07fba4f1daf28f6f588dd6b75e80ee7d259bf44fdd5f0::mycoin::MYCOIN   │
│  │ Amount: 1                                                                                      │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2130008                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

## faucetcoin
编写合约如下:
```move
module faucetcoin::fcoin {
    use sui::coin::{Self, TreasuryCap};

    public struct FCOIN has drop {}

    fun init(witness: FCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness, 
            6, 
            b"LingLingccFaucet", 
            b"LingLingccFaucet", 
            b"faucet coin for test", 
            option::none(), 
            ctx
        );
        // freeze the currency
        transfer::public_freeze_object(metadata);
        // transfer the treasury to the sender
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<FCOIN>, recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap, 1000000, ctx);
        transfer::public_transfer(coin, recipient)
    }
}
```

本地编译并部署上链:
```bash
❯ sui move build         
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING faucetcoin
❯ sui client publish --gas-budget 30000000 .
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING faucetcoin
Successfully verified dependencies on-chain against source.
Transaction Digest: AU5PkBoHmpgU8tHF5nbERTNBX3FsRjhCkWWVjTTpV4q5
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                   │
│ Gas Owner: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                │
│ Gas Budget: 30000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                                    │
│  │ Version: 91908808                                                                                         │
│  │ Digest: CgCpyrmpwBh95Re9T485Gt2E9zJEFa4wBPzLVRo3iAUT                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645" │ │
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
│    55nosH20a38g84w5AxFk64m+r76tNUJl7WSN/H+vOBSjcT1cYP2O1Y98WTRRttawZdVseEdJJMCiDDnuar8UCQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: AU5PkBoHmpgU8tHF5nbERTNBX3FsRjhCkWWVjTTpV4q5                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 369                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x130fe1bb9ac8c2d74eea42287accb4ec511f64cfdcfccd29584eb7744691b2ff                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 91908809                                                                              │
│  │ Digest: 2LTJmWR79LkgXA9EUkLrZqafTuxcKteCUCrtPNhCjzNa                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x1317de35490b3321a3ac9ccea1dddd57933ba0f70197697cfb46fd381cbbef7d                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908809                                                                              │
│  │ Digest: 3aPVzfJ9DiX1A5ZY8HZ1uGip3cuYKNtYopXveVWWD4Dj                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x34da8d434422caec8b6524b6db9cb5c7f8070b9beac5297803c900d043681594                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908809                                                                              │
│  │ Digest: 6Q9Xq1HZADstKbh6HDsvyzGpPAhvGEbPyfjQhNE8Nb4i                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x8ff21d50fe7ec3524659f319945be183a92c2dbe9d119bed1f1ead21869f290c                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 6e8crNhvM2eveHu2MMRMHY89aFAQrw6C4TxkNjyXoGy3                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908809                                                                              │
│  │ Digest: GCr8iJDD1X9uZkt4kPEm4FQRqggnANVksfzzatCsrejw                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908809                                                                              │
│  │ Digest: GCr8iJDD1X9uZkt4kPEm4FQRqggnANVksfzzatCsrejw                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 13619200 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
│    EW89QiwjK13sSLu5eeWKe87JmC25ByK33RF5vQk7YhTV                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                            │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                          │
│  ┌──                                                                                                                      │
│  │ ObjectID: 0x130fe1bb9ac8c2d74eea42287accb4ec511f64cfdcfccd29584eb7744691b2ff                                           │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                             │
│  │ Owner: Immutable                                                                                                       │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x8ff21d50fe7ec3524659f319945be183a92c2dbe9d119bed1f1ead21869f290c::fcoin::FCOIN>  │
│  │ Version: 91908809                                                                                                      │
│  │ Digest: 2LTJmWR79LkgXA9EUkLrZqafTuxcKteCUCrtPNhCjzNa                                                                   │
│  └──                                                                                                                      │
│  ┌──                                                                                                                      │
│  │ ObjectID: 0x1317de35490b3321a3ac9ccea1dddd57933ba0f70197697cfb46fd381cbbef7d                                           │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                             │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )                          │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                   │
│  │ Version: 91908809                                                                                                      │
│  │ Digest: 3aPVzfJ9DiX1A5ZY8HZ1uGip3cuYKNtYopXveVWWD4Dj                                                                   │
│  └──                                                                                                                      │
│  ┌──                                                                                                                      │
│  │ ObjectID: 0x34da8d434422caec8b6524b6db9cb5c7f8070b9beac5297803c900d043681594                                           │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                             │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )                          │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x8ff21d50fe7ec3524659f319945be183a92c2dbe9d119bed1f1ead21869f290c::fcoin::FCOIN>   │
│  │ Version: 91908809                                                                                                      │
│  │ Digest: 6Q9Xq1HZADstKbh6HDsvyzGpPAhvGEbPyfjQhNE8Nb4i                                                                   │
│  └──                                                                                                                      │
│ Mutated Objects:                                                                                                          │
│  ┌──                                                                                                                      │
│  │ ObjectID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                                           │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                             │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )                          │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                             │
│  │ Version: 91908809                                                                                                      │
│  │ Digest: GCr8iJDD1X9uZkt4kPEm4FQRqggnANVksfzzatCsrejw                                                                   │
│  └──                                                                                                                      │
│ Published Objects:                                                                                                        │
│  ┌──                                                                                                                      │
│  │ PackageID: 0x8ff21d50fe7ec3524659f319945be183a92c2dbe9d119bed1f1ead21869f290c                                          │
│  │ Version: 1                                                                                                             │
│  │ Digest: 6e8crNhvM2eveHu2MMRMHY89aFAQrw6C4TxkNjyXoGy3                                                                   │
│  │ Modules: fcoin                                                                                                         │
│  └──                                                                                                                      │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -13391080                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

