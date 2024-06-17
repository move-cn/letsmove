### task1
```move

/// Module: my_first_package
module my_first_package::hello_PINKPIG {
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};
    use std::string::{Self, String};
    use sui::transfer;

    public struct Hello has key {
        id: UID,
        str: String,
    }

    public fun say_hello(ctx: &mut TxContext) {
        let word = Hello {
            id: object::new(ctx),
            str: string::utf8(b"Hello PINKPIG"),
        };
        transfer::transfer(word, tx_context::sender(ctx));
    }
}

```
`package_id:` 0x47a03fd4bd836f3aec1472c76bdcbcb833f379b9dafc3ffddf1fff233efd0736

`sui version:`sui 1.27.0-e5f080922d56-dirty

`sui address:`0xc9984d356bcf6455491993ebf6b875ed76d527acf44c4e413b1e7cef37dfafc0

### task2
```move
#[allow(duplicate_alias)]
/// Module: my_coin
module task_02::rmb_coin {
    use std::debug;
    use std::ascii::string;
    use std::option;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::new_unsafe;

    public struct RMB_COIN has drop {}

    #[lint_allow(self_transfer)]
    fun init(
        witness: RMB_COIN,
        ctx: &mut TxContext
    ) {
        debug::print(&string(b"init RMB_COIN"));
        let url_obj = new_unsafe(std::ascii::string(b"https://avatars.githubusercontent.com/u/36093027?v=4"));
        let (treasury, metadata) = coin::create_currency(
            witness,
            8, // decimals
            b"SuiRMB", // symbol
            b"Sui RMB", // name
            b"My first coin", // description
            option::some(url_obj), // icon url
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    #[lint_allow(self_transfer)]
    #[allow(unused_variable)]
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<RMB_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        debug::print(&string(b"mint"));
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<RMB_COIN>,
        coin: Coin<RMB_COIN>
    ) {
        debug::print(&string(b"burn"));
        coin::burn(treasury_cap, coin);
    }
}
```

```move
#[allow(duplicate_alias, unused_use)]
/// Module: faucetcoin
module faucetcoin::faucet_coin {
    use std::debug;
    use std::ascii::string;
    use std::option;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::new_unsafe;

    public struct FAUCET_COIN has drop {}

    #[lint_allow(self_transfer)]
    #[allow(lint(share_owned))]
    fun init(
        witness: FAUCET_COIN,
        ctx: &mut TxContext
    ) {
        debug::print(&string(b"init FAUCET_COIN"));
        let url_obj = new_unsafe(std::ascii::string(b"https://avatars.githubusercontent.com/u/36093027?v=4"));
        let (treasury, metadata) = coin::create_currency(
            witness,
            8,                // decimals
            b"SuiFaucetRMB",           // symbol
            b"Sui Faucet RMB",       // name
            b"My faucet coin", // description
            option::some(url_obj),   // icon url
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    #[lint_allow(self_transfer)]
    #[allow(unused_variable)]
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        debug::print(&string(b"faucet mint"));
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<FAUCET_COIN>,
        coin: Coin<FAUCET_COIN>
    ) {
        debug::print(&string(b"burn"));
        coin::burn(treasury_cap, coin);
    }
}

```