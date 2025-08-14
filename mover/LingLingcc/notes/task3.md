# Task3

编写合约如下：
```move
module nft::mynft {
    use sui::display;
    use sui::package;
    use std::string::{String, utf8};

    public struct MYNFT has drop {}

    public struct LingLingcc has key, store {
        id: UID,
        name: String,
        description: String,
    }

    fun init(otw: MYNFT, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"description"),
            utf8(b"image_url")
        ];
        let values = vector[
            utf8(b"LingLingcc"),
            utf8(b"sample NFT for LingLingcc"),
            utf8(b"https://avatars.githubusercontent.com/u/167002362?s=400&u=d58cd662ae807d2e23b42f060ed48d6ed316b3ea&v=4")
        ];
        let publisher = package::claim(otw, ctx);
        let mut display = display::new_with_fields<LingLingcc>(&publisher, keys, values, ctx);
        display::update_version(&mut display);

        let deployer = tx_context::sender(ctx);
        transfer::public_transfer(publisher, deployer);
        transfer::public_transfer(display, deployer);
    }

    public entry fun mint(name: vector<u8>, description: vector<u8>, recipient: address, ctx: &mut TxContext) {
        let nft = LingLingcc {
            id: object::new(ctx),
            name: utf8(name),
            description: utf8(description),
        };
        transfer::public_transfer(nft, recipient);
    }
}
```

本地编译并部署上链：
```bash
❯ sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING nft
❯ sui client publish --gas-budget 30000000 .
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING nft
Successfully verified dependencies on-chain against source.
Transaction Digest: 6n49qAVWrtjYMhkk73LYpGAB9Hn9bUTBiqXSnRrw3x3L
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
│  │ Version: 91908810                                                                                         │
│  │ Digest: AGESvzU9vWRESAjUr4L6aCfeakeRddzJpBzAucB8FS6e                                                      │
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
│    JNRotUAL2+vbUdLTU3fWIvvwTDpD5xpdD4W00tOBAJAF4zukgj/8yntib0BEIxpsDw6sU5dxd1uZFnqX8sKoAQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 6n49qAVWrtjYMhkk73LYpGAB9Hn9bUTBiqXSnRrw3x3L                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 369                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0ee8646d12ccef90872b14aa727ddab7a9f65d4045c2769807dc47d1da99a950                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 3R45eA5eUh5bwcJDqaV8D6KMtvCxDcNJ8RQfWLi4sb7E                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x143348b95aacf0a4957415a4ac6ab618230f2c0672e0f21d270285e616a2d8b7                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908811                                                                              │
│  │ Digest: jf7a3puEYtm13XPq7ZD74cQYvDoJmpucMG2RRsSUuJy                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x2d46b41450549f74b1b0d5affb272cc342fd137e318fb06c7cbda94a9d33da96                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908811                                                                              │
│  │ Digest: JCRmwh8jU2rDmioJjmBXkudTUVEwnPoJcFV1Pko9jhn1                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x7e82fe8d232b5ed6b66391eb183507c44bf68a2fad7f9b54f5980861c9c97f9e                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908811                                                                              │
│  │ Digest: 3vhr7abNAUcGsb887W4owF9BbpExxEhFJtkN566dbZvo                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908811                                                                              │
│  │ Digest: BureT3uHaNbk2GFkpkn8qZjJqZVgZcLMpj3cgWGNiCRh                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908811                                                                              │
│  │ Digest: BureT3uHaNbk2GFkpkn8qZjJqZVgZcLMpj3cgWGNiCRh                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 16750400 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    3zwVUsFkgMgWx26jEbJztUVgbYNjtFUdwxJMqrRfGQu3                                                   │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                                                     │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                                         │
│  │ EventID: 6n49qAVWrtjYMhkk73LYpGAB9Hn9bUTBiqXSnRrw3x3L:0                                                                                   │
│  │ PackageID: 0x0ee8646d12ccef90872b14aa727ddab7a9f65d4045c2769807dc47d1da99a950                                                             │
│  │ Transaction Module: mynft                                                                                                                 │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                                                │
│  │ EventType: 0x2::display::DisplayCreated<0xee8646d12ccef90872b14aa727ddab7a9f65d4045c2769807dc47d1da99a950::mynft::LingLingcc>             │
│  │ ParsedJSON:                                                                                                                               │
│  │   ┌────┬────────────────────────────────────────────────────────────────────┐                                                             │
│  │   │ id │ 0x2d46b41450549f74b1b0d5affb272cc342fd137e318fb06c7cbda94a9d33da96 │                                                             │
│  │   └────┴────────────────────────────────────────────────────────────────────┘                                                             │
│  └──                                                                                                                                         │
│  ┌──                                                                                                                                         │
│  │ EventID: 6n49qAVWrtjYMhkk73LYpGAB9Hn9bUTBiqXSnRrw3x3L:1                                                                                   │
│  │ PackageID: 0x0ee8646d12ccef90872b14aa727ddab7a9f65d4045c2769807dc47d1da99a950                                                             │
│  │ Transaction Module: mynft                                                                                                                 │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                                                │
│  │ EventType: 0x2::display::VersionUpdated<0xee8646d12ccef90872b14aa727ddab7a9f65d4045c2769807dc47d1da99a950::mynft::LingLingcc>             │
│  │ ParsedJSON:                                                                                                                               │
│  │   ┌─────────┬──────────┬───────┬────────────────────────────────────────────────────────────────────────────────────────────────────────┐ │
│  │   │ fields  │ contents │ key   │ name                                                                                                   │ │
│  │   │         │          ├───────┼────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│  │   │         │          │ value │ LingLingcc                                                                                             │ │
│  │   │         │          ├───────┼────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│  │   │         │          │ key   │ description                                                                                            │ │
│  │   │         │          ├───────┼────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│  │   │         │          │ value │ sample NFT for LingLingcc                                                                              │ │
│  │   │         │          ├───────┼────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│  │   │         │          │ key   │ image_url                                                                                              │ │
│  │   │         │          ├───────┼────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│  │   │         │          │ value │ https://avatars.githubusercontent.com/u/167002362?s=400&u=d58cd662ae807d2e23b42f060ed48d6ed316b3ea&v=4 │ │
│  │   ├─────────┼──────────┴───────┴────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│  │   │ id      │ 0x2d46b41450549f74b1b0d5affb272cc342fd137e318fb06c7cbda94a9d33da96                                                        │ │
│  │   ├─────────┼───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│  │   │ version │ 1                                                                                                                         │ │
│  │   └─────────┴───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘ │
│  └──                                                                                                                                         │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                              │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                            │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x143348b95aacf0a4957415a4ac6ab618230f2c0672e0f21d270285e616a2d8b7                                             │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                               │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )                            │
│  │ ObjectType: 0x2::package::Publisher                                                                                      │
│  │ Version: 91908811                                                                                                        │
│  │ Digest: jf7a3puEYtm13XPq7ZD74cQYvDoJmpucMG2RRsSUuJy                                                                      │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x2d46b41450549f74b1b0d5affb272cc342fd137e318fb06c7cbda94a9d33da96                                             │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                               │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )                            │
│  │ ObjectType: 0x2::display::Display<0xee8646d12ccef90872b14aa727ddab7a9f65d4045c2769807dc47d1da99a950::mynft::LingLingcc>  │
│  │ Version: 91908811                                                                                                        │
│  │ Digest: JCRmwh8jU2rDmioJjmBXkudTUVEwnPoJcFV1Pko9jhn1                                                                     │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x7e82fe8d232b5ed6b66391eb183507c44bf68a2fad7f9b54f5980861c9c97f9e                                             │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                               │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )                            │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                     │
│  │ Version: 91908811                                                                                                        │
│  │ Digest: 3vhr7abNAUcGsb887W4owF9BbpExxEhFJtkN566dbZvo                                                                     │
│  └──                                                                                                                        │
│ Mutated Objects:                                                                                                            │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                                             │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                               │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )                            │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                               │
│  │ Version: 91908811                                                                                                        │
│  │ Digest: BureT3uHaNbk2GFkpkn8qZjJqZVgZcLMpj3cgWGNiCRh                                                                     │
│  └──                                                                                                                        │
│ Published Objects:                                                                                                          │
│  ┌──                                                                                                                        │
│  │ PackageID: 0x0ee8646d12ccef90872b14aa727ddab7a9f65d4045c2769807dc47d1da99a950                                            │
│  │ Version: 1                                                                                                               │
│  │ Digest: 3R45eA5eUh5bwcJDqaV8D6KMtvCxDcNJ8RQfWLi4sb7E                                                                     │
│  │ Modules: mynft                                                                                                           │
│  └──                                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -16522280                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

mint 一个 NFT 给 `0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`：
```bash
❯ sui client call --package 0x0ee8646d12ccef90872b14aa727ddab7a9f65d4045c2769807dc47d1da99a950 --module mynft --function mint --args "LingLingcc" "sample NFT" 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 30000000
Transaction Digest: AMC7yXDUtu3J9j1pcYye9MHNDCM7qCmAMuJHq7uAGEeT
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
│  │ Version: 91908811                                                                                         │
│  │ Digest: BureT3uHaNbk2GFkpkn8qZjJqZVgZcLMpj3cgWGNiCRh                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: vector<u8>, Value: "LingLingcc"                                                      │ │
│ │ 1   Pure Arg: Type: vector<u8>, Value: "sample NFT"                                                      │ │
│ │ 2   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    mynft                                                              │                         │
│ │  │ Package:   0x0ee8646d12ccef90872b14aa727ddab7a9f65d4045c2769807dc47d1da99a950 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    tAKMa8BqoSLhaUy0TL3ItnVuAhvkGHylpUFUvnXOBfm1RlPxaAO+euZo8db2hGeoG+Kxh3LkPdaDX/iLXgkdCg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: AMC7yXDUtu3J9j1pcYye9MHNDCM7qCmAMuJHq7uAGEeT                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 369                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x31586814763b93e3b10f63115029d4696c30a28fe4b0c8ae5dd5cb0711a9c49f                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 91908812                                                                              │
│  │ Digest: 5V9FKqrXoWcSsCe7YSSrSJtw7tvwHXkkN6qLZVARecMP                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908812                                                                              │
│  │ Digest: 9KNzbuxe2SSsMMajkMkTUdcnZQPtJdXxj6vA3szcA3VV                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908812                                                                              │
│  │ Digest: 9KNzbuxe2SSsMMajkMkTUdcnZQPtJdXxj6vA3szcA3VV                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2462400 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6n49qAVWrtjYMhkk73LYpGAB9Hn9bUTBiqXSnRrw3x3L                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                     │
│  ┌──                                                                                                 │
│  │ ObjectID: 0x31586814763b93e3b10f63115029d4696c30a28fe4b0c8ae5dd5cb0711a9c49f                      │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                        │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )     │
│  │ ObjectType: 0xee8646d12ccef90872b14aa727ddab7a9f65d4045c2769807dc47d1da99a950::mynft::LingLingcc  │
│  │ Version: 91908812                                                                                 │
│  │ Digest: 5V9FKqrXoWcSsCe7YSSrSJtw7tvwHXkkN6qLZVARecMP                                              │
│  └──                                                                                                 │
│ Mutated Objects:                                                                                     │
│  ┌──                                                                                                 │
│  │ ObjectID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                      │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                        │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )     │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                        │
│  │ Version: 91908812                                                                                 │
│  │ Digest: 9KNzbuxe2SSsMMajkMkTUdcnZQPtJdXxj6vA3szcA3VV                                              │
│  └──                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2234280                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```