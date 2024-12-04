# Task4

编写 `game.move` 如下：
```move
module game::mygame {
    use sui::coin;
    use sui::balance::{Self, Balance};
    use std::string::{Self, String};
    use sui::bcs;

    public struct Mora has drop {
        num: u8,
        symbol: String
    }

    public struct MYGAME has drop {}

    public struct GamePool has key, store {
        id: UID,
        balance: Balance<MYGAME>
    }

    fun init(witness: MYGAME, ctx: &mut TxContext) {
        let (mut treasury, metadata) = coin::create_currency(
            witness,
            6,
            b"LingLingcc",
            b"LingLingcc Coin",
            b"Game award coin",
            option::none(),
            ctx
        );
        transfer::public_freeze_object(metadata);
        let gamepool = GamePool {
            id: object::new(ctx),
            balance: coin::mint_balance(&mut treasury, 10000000)
        };
        transfer::public_transfer(treasury, tx_context::sender(ctx));
        transfer::share_object(gamepool);
    }

    public entry fun battle(pool: &mut GamePool, num: u8, ctx: &mut TxContext) {
        let mut s1 = string::utf8(b"");
        let num = num % 3;
        if (num == 0) {
            s1 = string::utf8(b"Rock");
        } else if (num == 1) {
            s1 = string::utf8(b"Scissors");
        } else if (num == 2) {
            s1 = string::utf8(b"Paper");
        };
        let user_mora = Mora {
            num: num,
            symbol: s1
        };
        let mut s2 = string::utf8(b"");
        let tx_digest = tx_context::digest(ctx);
        let num2 = (bcs::peel_u64(&mut bcs::new(*tx_digest)) % 3) as u8;
        if (num2 == 0) {
            s2 = string::utf8(b"Rock");
        } else if (num2 == 1) {
            s2 = string::utf8(b"Scissors");
        } else if (num2 == 2) {
            s2 = string::utf8(b"Paper");
        };
        let admin_mora = Mora {
            num: num2,
            symbol: s2
        };
        if ((admin_mora.num - user_mora.num) % 3 == 1) {
            let award = balance::split(&mut pool.balance, 1000000);
            let c = coin::from_balance(award, ctx);
            transfer::public_transfer(c, tx_context::sender(ctx));
        }
    }
}
```

本地编译合约并部署上链：
```bash
❯ sui move build                 
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING game
❯ sui client publish --gas-budget 30000000 .
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING game
Successfully verified dependencies on-chain against source.
Transaction Digest: 5XzZJQJ7k27PFQrFHxckiCDwnd6sh7MDgcTcAL3AwK24
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
│  │ Version: 91908812                                                                                         │
│  │ Digest: 9KNzbuxe2SSsMMajkMkTUdcnZQPtJdXxj6vA3szcA3VV                                                      │
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
│    hiHWRlO42N7TXOQsbOZNNIrPThts4b3VGZTqZo5gQCrKBYflqwRKfGkZtma43vzroeIE/ivO+Td4BLm+lFmvAQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 5XzZJQJ7k27PFQrFHxckiCDwnd6sh7MDgcTcAL3AwK24                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 376                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x038b0479f55f4584134f095650572fc9de717c259ce6bc99c6432c9bc11ae4d5                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908813                                                                              │
│  │ Digest: GJajMoGSUJ6FBRhoWjfEUNhQKVsTtxDGisgXomiMeegw                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x3e5c97ec389e968eb2f385743a90c5d8eac37b94513df19dfc774dc333c9c34c                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 91908813                                                                              │
│  │ Digest: 4jyYLrzCz6EoAqXZgeshjBFDxPaXcDa4LcmrAQkfHBSt                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x80690b3fbda3e20165a924859265841b209902a101dc40be10cfe3ad6fedf892                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 91908813                                                                              │
│  │ Digest: A8UKHVRwiJw9BUnvQTb1zZ1S3tGk5Pad3ak6dHDqbArY                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x836324381752d989b663ccc517eca490592b1d2d2306253b3566ea6650410cc4                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908813                                                                              │
│  │ Digest: nDjkwci2r6CLLLGtFVJUoKNsDerQb5GFv8un94gboAT                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xcc390a7456c69f86cd1f7fd287c8b8b262f526843eef8edf6947dd49b2a73c5c                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: DrMTMjeFAHsXQeRFq3GnktdofnTXy9XzrVMYZueN6joP                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908813                                                                              │
│  │ Digest: 9MPqxVwCFujRmC4ZTtKopciEfQaCUtCzWPfqiP2M36i                                            │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908813                                                                              │
│  │ Digest: 9MPqxVwCFujRmC4ZTtKopciEfQaCUtCzWPfqiP2M36i                                            │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 19980400 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
│    AMC7yXDUtu3J9j1pcYye9MHNDCM7qCmAMuJHq7uAGEeT                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                              │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                            │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x038b0479f55f4584134f095650572fc9de717c259ce6bc99c6432c9bc11ae4d5                                             │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                               │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )                            │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xcc390a7456c69f86cd1f7fd287c8b8b262f526843eef8edf6947dd49b2a73c5c::mygame::MYGAME>   │
│  │ Version: 91908813                                                                                                        │
│  │ Digest: GJajMoGSUJ6FBRhoWjfEUNhQKVsTtxDGisgXomiMeegw                                                                     │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x3e5c97ec389e968eb2f385743a90c5d8eac37b94513df19dfc774dc333c9c34c                                             │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                               │
│  │ Owner: Shared                                                                                                            │
│  │ ObjectType: 0xcc390a7456c69f86cd1f7fd287c8b8b262f526843eef8edf6947dd49b2a73c5c::mygame::GamePool                         │
│  │ Version: 91908813                                                                                                        │
│  │ Digest: 4jyYLrzCz6EoAqXZgeshjBFDxPaXcDa4LcmrAQkfHBSt                                                                     │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x80690b3fbda3e20165a924859265841b209902a101dc40be10cfe3ad6fedf892                                             │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                               │
│  │ Owner: Immutable                                                                                                         │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xcc390a7456c69f86cd1f7fd287c8b8b262f526843eef8edf6947dd49b2a73c5c::mygame::MYGAME>  │
│  │ Version: 91908813                                                                                                        │
│  │ Digest: A8UKHVRwiJw9BUnvQTb1zZ1S3tGk5Pad3ak6dHDqbArY                                                                     │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x836324381752d989b663ccc517eca490592b1d2d2306253b3566ea6650410cc4                                             │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                               │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )                            │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                     │
│  │ Version: 91908813                                                                                                        │
│  │ Digest: nDjkwci2r6CLLLGtFVJUoKNsDerQb5GFv8un94gboAT                                                                      │
│  └──                                                                                                                        │
│ Mutated Objects:                                                                                                            │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                                             │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                               │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )                            │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                               │
│  │ Version: 91908813                                                                                                        │
│  │ Digest: 9MPqxVwCFujRmC4ZTtKopciEfQaCUtCzWPfqiP2M36i                                                                      │
│  └──                                                                                                                        │
│ Published Objects:                                                                                                          │
│  ┌──                                                                                                                        │
│  │ PackageID: 0xcc390a7456c69f86cd1f7fd287c8b8b262f526843eef8edf6947dd49b2a73c5c                                            │
│  │ Version: 1                                                                                                               │
│  │ Digest: DrMTMjeFAHsXQeRFq3GnktdofnTXy9XzrVMYZueN6joP                                                                     │
│  │ Modules: mygame                                                                                                          │
│  └──                                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -19752280                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

调用 `battle` 函数参与 game：
```bash
❯ sui client call --package 0xcc390a7456c69f86cd1f7fd287c8b8b262f526843eef8edf6947dd49b2a73c5c --module mygame --function battle --args 0x3e5c97ec389e968eb2f385743a90c5d8eac37b94513df19dfc774dc333c9c34c 0 --gas-budget 30000000
Transaction Digest: BZCoANrNPUCbEwfmJ7a6L5hSzEt3zMdzckRjzQtQd54N
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                      │
│ Gas Owner: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                   │
│ Gas Budget: 30000000 MIST                                                                       │
│ Gas Price: 750 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                       │
│  │ Version: 91908813                                                                            │
│  │ Digest: 9MPqxVwCFujRmC4ZTtKopciEfQaCUtCzWPfqiP2M36i                                          │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0x3e5c97ec389e968eb2f385743a90c5d8eac37b94513df19dfc774dc333c9c34c │ │
│ │ 1   Pure Arg: Type: u8, Value: 0                                                            │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  battle                                                             │            │
│ │  │ Module:    mygame                                                             │            │
│ │  │ Package:   0xcc390a7456c69f86cd1f7fd287c8b8b262f526843eef8edf6947dd49b2a73c5c │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    8sPIYASwTSknYQZv1ObLKmbvmnw/7hf4bw5itD/mY0hYp1AlnGJtzpJ/K/NVhuezI45Y33qOr9wbwniKEZf6Dw==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: BZCoANrNPUCbEwfmJ7a6L5hSzEt3zMdzckRjzQtQd54N                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 376                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908814                                                                              │
│  │ Digest: EqJoryCX7ErSKM33n27TLnLxUScVVUuTNHRYuY7EuECi                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x3e5c97ec389e968eb2f385743a90c5d8eac37b94513df19dfc774dc333c9c34c                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 91908814                                                                              │
│  │ Digest: BySo7L9E25eGaXw2jWXhrMJYfGHHRwKJVomzvN6JNGHQ                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x3e5c97ec389e968eb2f385743a90c5d8eac37b94513df19dfc774dc333c9c34c                         │
│  │ Version: 91908813                                                                              │
│  │ Digest: 4jyYLrzCz6EoAqXZgeshjBFDxPaXcDa4LcmrAQkfHBSt                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908814                                                                              │
│  │ Digest: EqJoryCX7ErSKM33n27TLnLxUScVVUuTNHRYuY7EuECi                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2348400 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2324916 MIST                                                                   │
│    Non-refundable Storage Fee: 23484 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    5XzZJQJ7k27PFQrFHxckiCDwnd6sh7MDgcTcAL3AwK24                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                     │
│  ┌──                                                                                                 │
│  │ ObjectID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                      │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                        │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )     │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                        │
│  │ Version: 91908814                                                                                 │
│  │ Digest: EqJoryCX7ErSKM33n27TLnLxUScVVUuTNHRYuY7EuECi                                              │
│  └──                                                                                                 │
│  ┌──                                                                                                 │
│  │ ObjectID: 0x3e5c97ec389e968eb2f385743a90c5d8eac37b94513df19dfc774dc333c9c34c                      │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                        │
│  │ Owner: Shared                                                                                     │
│  │ ObjectType: 0xcc390a7456c69f86cd1f7fd287c8b8b262f526843eef8edf6947dd49b2a73c5c::mygame::GamePool  │
│  │ Version: 91908814                                                                                 │
│  │ Digest: BySo7L9E25eGaXw2jWXhrMJYfGHHRwKJVomzvN6JNGHQ                                              │
│  └──                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -773484                                                                                │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```