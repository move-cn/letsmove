# Task5

编写 swap 合约如下：
```move
module linglingcc::myswap {
    use sui::balance;
    use sui::coin;

    public struct Pool<phantom LingLingcc, phantom LingLingccFaucet> has store, key {
        id: UID,
        llc_coin: balance::Balance<LingLingcc>,
        llc_faucet_coin: balance::Balance<LingLingccFaucet>,
        owner: address
    }

    const ONLYOWNER: u64 = 1;

    public entry fun create<LingLingcc, LingLingccFaucet>(ctx: &mut TxContext){
        let pool = Pool<LingLingcc, LingLingccFaucet>{
            id: object::new(ctx),
            llc_coin: balance::zero<LingLingcc>(),
            llc_faucet_coin: balance::zero<LingLingccFaucet>(),
            owner: tx_context::sender(ctx)
        };
        transfer::public_share_object(pool);
    }

    public entry fun addLiquid<LingLingcc, LingLingccFaucet>(pool: &mut Pool<LingLingcc, LingLingccFaucet>, mut llc: coin::Coin<LingLingcc>, mut llfc: coin::Coin<LingLingccFaucet>, llc_amount: u64, llfc_amount: u64, ctx: &mut TxContext){
        assert!(pool.owner == tx_context::sender(ctx), ONLYOWNER);
        let llc_input = coin::split(&mut llc, llc_amount, ctx);
        coin::put(&mut pool.llc_coin, llc_input);
        let llfc_input = coin::split(&mut llfc, llfc_amount, ctx);
        coin::put(&mut pool.llc_faucet_coin, llfc_input);
        transfer::public_transfer(llc, tx_context::sender(ctx));
        transfer::public_transfer(llfc, tx_context::sender(ctx));
    }

    public entry fun swap_llfc_to_llc<LingLingcc, LingLingccFaucet>(pool: &mut Pool<LingLingcc, LingLingccFaucet>, mut llfc: coin::Coin<LingLingccFaucet>, llfc_amount:u64, ctx: &mut TxContext){
        let coin_input = coin::split(&mut llfc, llfc_amount, ctx);
        coin::put(&mut pool.llc_faucet_coin, coin_input);
        let to_coin = coin::take(&mut pool.llc_coin, llfc_amount, ctx);
        transfer::public_transfer(to_coin, tx_context::sender(ctx));
        transfer::public_transfer(llfc, tx_context::sender(ctx));
    }

    public entry fun swap_llc_to_llfc<LingLingcc, LingLingccFaucet>(pool: &mut Pool<LingLingcc, LingLingccFaucet>, mut llc: coin::Coin<LingLingcc>, llc_amount:u64, ctx: &mut TxContext){
        let coin_input = coin::split(&mut llc, llc_amount, ctx);
        coin::put(&mut pool.llc_coin, coin_input);
        let to_coin = coin::take(&mut pool.llc_faucet_coin, llc_amount, ctx);
        transfer::public_transfer(to_coin, tx_context::sender(ctx));
        transfer::public_transfer(llc, tx_context::sender(ctx));
    }
}
```

本地编译合约并部署上链：
```bash
❯ sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING LingLingcc
❯ sui client publish --gas-budget 30000000 .
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING LingLingcc
Successfully verified dependencies on-chain against source.
Transaction Digest: 3WDiGikNapQHaMhxHA6oB7PrASv8aRQDtJhY98zgtQ7y
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
│  │ Version: 91908816                                                                                         │
│  │ Digest: H3p2Wb9SiDJJL6i6ZWgtoyY8LY8WhAE9DiFwBRTADS6N                                                      │
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
│    ChiV6gdDAzPqzf31NM5tMzIiyZvaAtaEjf2rf0lccoDVLBH69raaTVSpvaf0nJ1IQGnhGanFoxYQioWb+dy3CQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 3WDiGikNapQHaMhxHA6oB7PrASv8aRQDtJhY98zgtQ7y                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 376                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0310ca04fa1fd7c7db3b9c6b61d299c02dd37f856fdf36c96b75e5f71f37b410                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908817                                                                              │
│  │ Digest: 24J7ctvsCqP8D5VtWYJ7yTbnk8DcFYbTxbVDvzYBrQYn                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe4eb4b839fc2befc771566e48ea866f0dd590e5f1693212c5787ae2816d19f00                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: ArJAgkMj4hLYsxvgdpCtvT4U6X8BGAdQxeKm1ttrduET                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908817                                                                              │
│  │ Digest: 6XChPrL7LRMDhUFEJrtbryvqNYz8UMxyycLfNU9NXxyv                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908817                                                                              │
│  │ Digest: 6XChPrL7LRMDhUFEJrtbryvqNYz8UMxyycLfNU9NXxyv                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 11643200 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    guMwm7Yyd9YDUDojijuQRRNVPv4oSx1BwxCrh582VPW                                                    │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x0310ca04fa1fd7c7db3b9c6b61d299c02dd37f856fdf36c96b75e5f71f37b410                  │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                    │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 91908817                                                                             │
│  │ Digest: 24J7ctvsCqP8D5VtWYJ7yTbnk8DcFYbTxbVDvzYBrQYn                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                  │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                    │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 91908817                                                                             │
│  │ Digest: 6XChPrL7LRMDhUFEJrtbryvqNYz8UMxyycLfNU9NXxyv                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xe4eb4b839fc2befc771566e48ea866f0dd590e5f1693212c5787ae2816d19f00                 │
│  │ Version: 1                                                                                    │
│  │ Digest: ArJAgkMj4hLYsxvgdpCtvT4U6X8BGAdQxeKm1ttrduET                                          │
│  │ Modules: myswap                                                                               │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -11415080                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

创建资金池：
```bash
❯ sui client call --package 0xe4eb4b839fc2befc771566e48ea866f0dd590e5f1693212c5787ae2816d19f00 --module myswap --function create --type-args "0x5b4ed860c1ecf8fbeac07fba4f1daf28f6f588dd6b75e80ee7d259bf44fdd5f0::mycoin::MYCOIN" "0x8ff21d50fe7ec3524659f319945be183a92c2dbe9d119bed1f1ead21869f290c::fcoin::FCOIN" --gas-budget 30000000 
Transaction Digest: 8gBRpj4wMHcvre4bK7K6PYUBy3rJb1uXrCRrCgj2tRxx
╭─────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                  │
│ Gas Owner: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645               │
│ Gas Budget: 30000000 MIST                                                                   │
│ Gas Price: 750 MIST                                                                         │
│ Gas Payment:                                                                                │
│  ┌──                                                                                        │
│  │ ID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                   │
│  │ Version: 91908819                                                                        │
│  │ Digest: ANbNSvFqrWxK5kG4qNjqjs4dhZjQNvi7RNsoqQkWhqhX                                     │
│  └──                                                                                        │
│                                                                                             │
│ Transaction Kind: Programmable                                                              │
│   No input objects for this transaction                                                     │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Commands                                                                                │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0  MoveCall:                                                                            │ │
│ │  ┌                                                                                      │ │
│ │  │ Function:  create                                                                    │ │
│ │  │ Module:    myswap                                                                    │ │
│ │  │ Package:   0xe4eb4b839fc2befc771566e48ea866f0dd590e5f1693212c5787ae2816d19f00        │ │
│ │  │ Type Arguments:                                                                      │ │
│ │  │   0x5b4ed860c1ecf8fbeac07fba4f1daf28f6f588dd6b75e80ee7d259bf44fdd5f0::mycoin::MYCOIN │ │
│ │  │   0x8ff21d50fe7ec3524659f319945be183a92c2dbe9d119bed1f1ead21869f290c::fcoin::FCOIN   │ │
│ │  └                                                                                      │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────╯ │
│                                                                                             │
│ Signatures:                                                                                 │
│    CfQe2zPyuYrKf7dPX0LPYbDF26IX9CEF+IGyZwcNrSvmiDJwtFmQkD+JtVP6fOE6q9N2q9yTG2aHUk2PIue6AA== │
│                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 8gBRpj4wMHcvre4bK7K6PYUBy3rJb1uXrCRrCgj2tRxx                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 376                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xe27835fb6f147d78eb6234a29008071f19ba5976e67e7ce3a6de4edc0e09118f                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 91908820                                                                              │
│  │ Digest: 2ePmnK1L6yUSo2T3CqrjiNinCc5TJyKazMjFUKRLXWc7                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908820                                                                              │
│  │ Digest: 4tNdmw5bD61rm5dTwCirHongUMQSXwh4PzNCssCbkAWB                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908820                                                                              │
│  │ Digest: 4tNdmw5bD61rm5dTwCirHongUMQSXwh4PzNCssCbkAWB                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3336400 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    3WDiGikNapQHaMhxHA6oB7PrASv8aRQDtJhY98zgtQ7y                                                   │
│    7jQYZC9xkJszkNyYcmwffvrmxbYMCjPDZi7GHZm2Wj3w                                                   │
│    AU5PkBoHmpgU8tHF5nbERTNBX3FsRjhCkWWVjTTpV4q5                                                   │
│    EW89QiwjK13sSLu5eeWKe87JmC25ByK33RF5vQk7YhTV                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                                                                                                                         │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                                                                                                                                       │
│  ┌──                                                                                                                                                                                                                                                                   │
│  │ ObjectID: 0xe27835fb6f147d78eb6234a29008071f19ba5976e67e7ce3a6de4edc0e09118f                                                                                                                                                                                        │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                                                                                                                                                                          │
│  │ Owner: Shared                                                                                                                                                                                                                                                       │
│  │ ObjectType: 0xe4eb4b839fc2befc771566e48ea866f0dd590e5f1693212c5787ae2816d19f00::myswap::Pool<0x5b4ed860c1ecf8fbeac07fba4f1daf28f6f588dd6b75e80ee7d259bf44fdd5f0::mycoin::MYCOIN, 0x8ff21d50fe7ec3524659f319945be183a92c2dbe9d119bed1f1ead21869f290c::fcoin::FCOIN>  │
│  │ Version: 91908820                                                                                                                                                                                                                                                   │
│  │ Digest: 2ePmnK1L6yUSo2T3CqrjiNinCc5TJyKazMjFUKRLXWc7                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                                   │
│ Mutated Objects:                                                                                                                                                                                                                                                       │
│  ┌──                                                                                                                                                                                                                                                                   │
│  │ ObjectID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                                                                                                                                                                                        │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                                                                                                                                                                          │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )                                                                                                                                                                       │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                                                                                                                          │
│  │ Version: 91908820                                                                                                                                                                                                                                                   │
│  │ Digest: 4tNdmw5bD61rm5dTwCirHongUMQSXwh4PzNCssCbkAWB                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                                   │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -3108280                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

添加流动性：
```bash
❯ sui client call --package 0xe4eb4b839fc2befc771566e48ea866f0dd590e5f1693212c5787ae2816d19f00 --module myswap --function addLiquid --args 0xe27835fb6f147d78eb6234a29008071f19ba5976e67e7ce3a6de4edc0e09118f 0x92770efb9ef180b4b18b6f7460732b3266f40da027004e956bad5b05317db758 0x77d41a61df928936aa5e42619b0b7738064b46aaa9637713ffba216230781c89 1 1 --type-args "0x5b4ed860c1ecf8fbeac07fba4f1daf28f6f588dd6b75e80ee7d259bf44fdd5f0::mycoin::MYCOIN" "0x8ff21d50fe7ec3524659f319945be183a92c2dbe9d119bed1f1ead21869f290c::fcoin::FCOIN" --gas-budget 30000000
Transaction Digest: CDEXSjPfaQiQY6pp81m86Us7mdLNLLme5dtwSWDtabVn
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
│  │ Version: 91908821                                                                            │
│  │ Digest: 6vrGyKT7yjBh593DcSsgZQXHzVRwq7m42BE3K9sGigvw                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0xe27835fb6f147d78eb6234a29008071f19ba5976e67e7ce3a6de4edc0e09118f │ │
│ │ 1   Imm/Owned Object ID: 0x92770efb9ef180b4b18b6f7460732b3266f40da027004e956bad5b05317db758 │ │
│ │ 2   Imm/Owned Object ID: 0x77d41a61df928936aa5e42619b0b7738064b46aaa9637713ffba216230781c89 │ │
│ │ 3   Pure Arg: Type: u64, Value: "1"                                                         │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────╮     │
│ │ Commands                                                                                │     │
│ ├─────────────────────────────────────────────────────────────────────────────────────────┤     │
│ │ 0  MoveCall:                                                                            │     │
│ │  ┌                                                                                      │     │
│ │  │ Function:  addLiquid                                                                 │     │
│ │  │ Module:    myswap                                                                    │     │
│ │  │ Package:   0xe4eb4b839fc2befc771566e48ea866f0dd590e5f1693212c5787ae2816d19f00        │     │
│ │  │ Type Arguments:                                                                      │     │
│ │  │   0x5b4ed860c1ecf8fbeac07fba4f1daf28f6f588dd6b75e80ee7d259bf44fdd5f0::mycoin::MYCOIN │     │
│ │  │   0x8ff21d50fe7ec3524659f319945be183a92c2dbe9d119bed1f1ead21869f290c::fcoin::FCOIN   │     │
│ │  │ Arguments:                                                                           │     │
│ │  │   Input  0                                                                           │     │
│ │  │   Input  1                                                                           │     │
│ │  │   Input  2                                                                           │     │
│ │  │   Input  3                                                                           │     │
│ │  │   Input  3                                                                           │     │
│ │  └                                                                                      │     │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────╯     │
│                                                                                                 │
│ Signatures:                                                                                     │
│    iqFRkAnvwnEqSxook9awaANIuEx8YmLV7x35lLa7RUWovSqrmLrUnsWynolzrV2q2OjRnTA/0USe8Xj1Qb9eDg==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: CDEXSjPfaQiQY6pp81m86Us7mdLNLLme5dtwSWDtabVn                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 376                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908822                                                                              │
│  │ Digest: CVP6n1DHxFNrGQxX2cqWMr86TTXtANmKnAk7BroN6F9g                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x77d41a61df928936aa5e42619b0b7738064b46aaa9637713ffba216230781c89                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908822                                                                              │
│  │ Digest: 3qb6zAG2TNUfeYBUThcv5D78mA3GQjJZZz18yNSDmhf7                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x92770efb9ef180b4b18b6f7460732b3266f40da027004e956bad5b05317db758                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908822                                                                              │
│  │ Digest: 2721PDokZTNJKJxPN2awGmB9CsXU5VmsvWtekhgD6XCe                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe27835fb6f147d78eb6234a29008071f19ba5976e67e7ce3a6de4edc0e09118f                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 91908822                                                                              │
│  │ Digest: EkoSAyLxhx9yQZsN7nXhrQ5yyMY77b2kVvKxKagYAid4                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0xe27835fb6f147d78eb6234a29008071f19ba5976e67e7ce3a6de4edc0e09118f                         │
│  │ Version: 91908820                                                                              │
│  │ Digest: 2ePmnK1L6yUSo2T3CqrjiNinCc5TJyKazMjFUKRLXWc7                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908822                                                                              │
│  │ Digest: CVP6n1DHxFNrGQxX2cqWMr86TTXtANmKnAk7BroN6F9g                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 6026800 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 5966532 MIST                                                                   │
│    Non-refundable Storage Fee: 60268 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    3WDiGikNapQHaMhxHA6oB7PrASv8aRQDtJhY98zgtQ7y                                                   │
│    8gBRpj4wMHcvre4bK7K6PYUBy3rJb1uXrCRrCgj2tRxx                                                   │
│    AU5PkBoHmpgU8tHF5nbERTNBX3FsRjhCkWWVjTTpV4q5                                                   │
│    EW89QiwjK13sSLu5eeWKe87JmC25ByK33RF5vQk7YhTV                                                   │
│    H2XbSGjsX4P7Q4WmW8Truuh35WoYBA1UMtpZfdmpJGM6                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                                                                                                                         │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                                                                                                                                                                                       │
│  ┌──                                                                                                                                                                                                                                                                   │
│  │ ObjectID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                                                                                                                                                                                        │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                                                                                                                                                                          │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )                                                                                                                                                                       │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                                                                                                                          │
│  │ Version: 91908822                                                                                                                                                                                                                                                   │
│  │ Digest: CVP6n1DHxFNrGQxX2cqWMr86TTXtANmKnAk7BroN6F9g                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                                   │
│  ┌──                                                                                                                                                                                                                                                                   │
│  │ ObjectID: 0x77d41a61df928936aa5e42619b0b7738064b46aaa9637713ffba216230781c89                                                                                                                                                                                        │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                                                                                                                                                                          │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )                                                                                                                                                                       │
│  │ ObjectType: 0x2::coin::Coin<0x8ff21d50fe7ec3524659f319945be183a92c2dbe9d119bed1f1ead21869f290c::fcoin::FCOIN>                                                                                                                                                       │
│  │ Version: 91908822                                                                                                                                                                                                                                                   │
│  │ Digest: 3qb6zAG2TNUfeYBUThcv5D78mA3GQjJZZz18yNSDmhf7                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                                   │
│  ┌──                                                                                                                                                                                                                                                                   │
│  │ ObjectID: 0x92770efb9ef180b4b18b6f7460732b3266f40da027004e956bad5b05317db758                                                                                                                                                                                        │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                                                                                                                                                                          │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )                                                                                                                                                                       │
│  │ ObjectType: 0x2::coin::Coin<0x5b4ed860c1ecf8fbeac07fba4f1daf28f6f588dd6b75e80ee7d259bf44fdd5f0::mycoin::MYCOIN>                                                                                                                                                     │
│  │ Version: 91908822                                                                                                                                                                                                                                                   │
│  │ Digest: 2721PDokZTNJKJxPN2awGmB9CsXU5VmsvWtekhgD6XCe                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                                   │
│  ┌──                                                                                                                                                                                                                                                                   │
│  │ ObjectID: 0xe27835fb6f147d78eb6234a29008071f19ba5976e67e7ce3a6de4edc0e09118f                                                                                                                                                                                        │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                                                                                                                                                                          │
│  │ Owner: Shared                                                                                                                                                                                                                                                       │
│  │ ObjectType: 0xe4eb4b839fc2befc771566e48ea866f0dd590e5f1693212c5787ae2816d19f00::myswap::Pool<0x5b4ed860c1ecf8fbeac07fba4f1daf28f6f588dd6b75e80ee7d259bf44fdd5f0::mycoin::MYCOIN, 0x8ff21d50fe7ec3524659f319945be183a92c2dbe9d119bed1f1ead21869f290c::fcoin::FCOIN>  │
│  │ Version: 91908822                                                                                                                                                                                                                                                   │
│  │ Digest: EkoSAyLxhx9yQZsN7nXhrQ5yyMY77b2kVvKxKagYAid4                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                                   │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -810268                                                                                │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ CoinType: 0x5b4ed860c1ecf8fbeac07fba4f1daf28f6f588dd6b75e80ee7d259bf44fdd5f0::mycoin::MYCOIN   │
│  │ Amount: -1                                                                                     │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ CoinType: 0x8ff21d50fe7ec3524659f319945be183a92c2dbe9d119bed1f1ead21869f290c::fcoin::FCOIN     │
│  │ Amount: -1                                                                                     │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

进行 swap：
```bash
❯ sui client call --package 0xe4eb4b839fc2befc771566e48ea866f0dd590e5f1693212c5787ae2816d19f00 --module myswap --function swap_llfc_to_llc --args 0xe27835fb6f147d78eb6234a29008071f19ba5976e67e7ce3a6de4edc0e09118f 0x77d41a61df928936aa5e42619b0b7738064b46aaa9637713ffba216230781c89 1 --type-args "0x5b4ed860c1ecf8fbeac07fba4f1daf28f6f588dd6b75e80ee7d259bf44fdd5f0::mycoin::MYCOIN" "0x8ff21d50fe7ec3524659f319945be183a92c2dbe9d119bed1f1ead21869f290c::fcoin::FCOIN" --gas-budget 30000000 
Transaction Digest: JBUi9VMomZBdVE2MNUWVQkCc4Ur3nsx3FPAKvGYaxSGq
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
│  │ Version: 91908822                                                                            │
│  │ Digest: CVP6n1DHxFNrGQxX2cqWMr86TTXtANmKnAk7BroN6F9g                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0xe27835fb6f147d78eb6234a29008071f19ba5976e67e7ce3a6de4edc0e09118f │ │
│ │ 1   Imm/Owned Object ID: 0x77d41a61df928936aa5e42619b0b7738064b46aaa9637713ffba216230781c89 │ │
│ │ 2   Pure Arg: Type: u64, Value: "1"                                                         │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────╮     │
│ │ Commands                                                                                │     │
│ ├─────────────────────────────────────────────────────────────────────────────────────────┤     │
│ │ 0  MoveCall:                                                                            │     │
│ │  ┌                                                                                      │     │
│ │  │ Function:  swap_llfc_to_llc                                                          │     │
│ │  │ Module:    myswap                                                                    │     │
│ │  │ Package:   0xe4eb4b839fc2befc771566e48ea866f0dd590e5f1693212c5787ae2816d19f00        │     │
│ │  │ Type Arguments:                                                                      │     │
│ │  │   0x5b4ed860c1ecf8fbeac07fba4f1daf28f6f588dd6b75e80ee7d259bf44fdd5f0::mycoin::MYCOIN │     │
│ │  │   0x8ff21d50fe7ec3524659f319945be183a92c2dbe9d119bed1f1ead21869f290c::fcoin::FCOIN   │     │
│ │  │ Arguments:                                                                           │     │
│ │  │   Input  0                                                                           │     │
│ │  │   Input  1                                                                           │     │
│ │  │   Input  2                                                                           │     │
│ │  └                                                                                      │     │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────╯     │
│                                                                                                 │
│ Signatures:                                                                                     │
│    z3mz9ssoJP6AoM0cy1RTLIEwWJG7V73WbJ1rDN4Zwe+NI4+C0iPW2yf6UbTpSvnufVyPnS4u2gseb03mC699Cw==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: JBUi9VMomZBdVE2MNUWVQkCc4Ur3nsx3FPAKvGYaxSGq                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 376                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x3c75b70d72dc985954af47fd0103fdfa8b51e82316a50a51b6ee043b87c9939b                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908823                                                                              │
│  │ Digest: FfXrmjJnhr5YComHMUWnaPupzfg6Muf9ZUGmjKcxqTqs                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908823                                                                              │
│  │ Digest: CicGyMDnyCHM2NDiAtDj7k2sc4XrgMr2b6UMdETC6Lhb                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x77d41a61df928936aa5e42619b0b7738064b46aaa9637713ffba216230781c89                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908823                                                                              │
│  │ Digest: EbsWq6EvKmd2cqdEFs1H37MD4AA1FhFFHpqXchyyYfPi                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe27835fb6f147d78eb6234a29008071f19ba5976e67e7ce3a6de4edc0e09118f                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 91908823                                                                              │
│  │ Digest: 3We6CHgZ4SneCpcMefbu1R6SL99AcvZmx5s1DiaEMye3                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0xe27835fb6f147d78eb6234a29008071f19ba5976e67e7ce3a6de4edc0e09118f                         │
│  │ Version: 91908822                                                                              │
│  │ Digest: EkoSAyLxhx9yQZsN7nXhrQ5yyMY77b2kVvKxKagYAid4                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 91908823                                                                              │
│  │ Digest: CicGyMDnyCHM2NDiAtDj7k2sc4XrgMr2b6UMdETC6Lhb                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 6026800 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 4627260 MIST                                                                   │
│    Non-refundable Storage Fee: 46740 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    3WDiGikNapQHaMhxHA6oB7PrASv8aRQDtJhY98zgtQ7y                                                   │
│    AU5PkBoHmpgU8tHF5nbERTNBX3FsRjhCkWWVjTTpV4q5                                                   │
│    CDEXSjPfaQiQY6pp81m86Us7mdLNLLme5dtwSWDtabVn                                                   │
│    EW89QiwjK13sSLu5eeWKe87JmC25ByK33RF5vQk7YhTV                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                                                                                                                         │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                                                                                                                                       │
│  ┌──                                                                                                                                                                                                                                                                   │
│  │ ObjectID: 0x3c75b70d72dc985954af47fd0103fdfa8b51e82316a50a51b6ee043b87c9939b                                                                                                                                                                                        │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                                                                                                                                                                          │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )                                                                                                                                                                       │
│  │ ObjectType: 0x2::coin::Coin<0x5b4ed860c1ecf8fbeac07fba4f1daf28f6f588dd6b75e80ee7d259bf44fdd5f0::mycoin::MYCOIN>                                                                                                                                                     │
│  │ Version: 91908823                                                                                                                                                                                                                                                   │
│  │ Digest: FfXrmjJnhr5YComHMUWnaPupzfg6Muf9ZUGmjKcxqTqs                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                                   │
│ Mutated Objects:                                                                                                                                                                                                                                                       │
│  ┌──                                                                                                                                                                                                                                                                   │
│  │ ObjectID: 0x06bc1317bfd21cad14338d6a122d12ebef715bd6825487bb587b3752f2df477f                                                                                                                                                                                        │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                                                                                                                                                                          │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )                                                                                                                                                                       │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                                                                                                                          │
│  │ Version: 91908823                                                                                                                                                                                                                                                   │
│  │ Digest: CicGyMDnyCHM2NDiAtDj7k2sc4XrgMr2b6UMdETC6Lhb                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                                   │
│  ┌──                                                                                                                                                                                                                                                                   │
│  │ ObjectID: 0x77d41a61df928936aa5e42619b0b7738064b46aaa9637713ffba216230781c89                                                                                                                                                                                        │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                                                                                                                                                                          │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )                                                                                                                                                                       │
│  │ ObjectType: 0x2::coin::Coin<0x8ff21d50fe7ec3524659f319945be183a92c2dbe9d119bed1f1ead21869f290c::fcoin::FCOIN>                                                                                                                                                       │
│  │ Version: 91908823                                                                                                                                                                                                                                                   │
│  │ Digest: EbsWq6EvKmd2cqdEFs1H37MD4AA1FhFFHpqXchyyYfPi                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                                   │
│  ┌──                                                                                                                                                                                                                                                                   │
│  │ ObjectID: 0xe27835fb6f147d78eb6234a29008071f19ba5976e67e7ce3a6de4edc0e09118f                                                                                                                                                                                        │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                                                                                                                                                                          │
│  │ Owner: Shared                                                                                                                                                                                                                                                       │
│  │ ObjectType: 0xe4eb4b839fc2befc771566e48ea866f0dd590e5f1693212c5787ae2816d19f00::myswap::Pool<0x5b4ed860c1ecf8fbeac07fba4f1daf28f6f588dd6b75e80ee7d259bf44fdd5f0::mycoin::MYCOIN, 0x8ff21d50fe7ec3524659f319945be183a92c2dbe9d119bed1f1ead21869f290c::fcoin::FCOIN>  │
│  │ Version: 91908823                                                                                                                                                                                                                                                   │
│  │ Digest: 3We6CHgZ4SneCpcMefbu1R6SL99AcvZmx5s1DiaEMye3                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                                   │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2149540                                                                               │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ CoinType: 0x5b4ed860c1ecf8fbeac07fba4f1daf28f6f588dd6b75e80ee7d259bf44fdd5f0::mycoin::MYCOIN   │
│  │ Amount: 1                                                                                      │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ CoinType: 0x8ff21d50fe7ec3524659f319945be183a92c2dbe9d119bed1f1ead21869f290c::fcoin::FCOIN     │
│  │ Amount: -1                                                                                     │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```