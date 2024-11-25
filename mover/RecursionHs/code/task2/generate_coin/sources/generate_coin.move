module generate_coin::btc {
    use std::option;
    use sui::coin;
    use sui::coin::TreasuryCap;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct BTC has drop {}

    fun init(witness: BTC, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<BTC>(
            witness,
            12,
            b"BTC",
            b"btc",
            b"a btc for sui network",
            option::some(url::new_unsafe(string(
                b"https://img2.baidu.com/it/u=3431641757,2792955841&fm=253&fmt=auto?w=506&h=285"
            ))
            ),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<BTC>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }
}