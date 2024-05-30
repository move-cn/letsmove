module my_first_package::Ox4e33token {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct OX4E33TOKEN has drop {}

    fun init(witness: OX4E33TOKEN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness,
        18,
        b"0x4E33Token",
        b"",
        b"",
        option::none(),
        ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    public fun mint(
        treasury: &mut TreasuryCap<OX4E33TOKEN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ){
        let coin = coin::mint(treasury,amount,ctx);
        transfer::public_transfer(coin,recipient)
    }

    public fun burn(
        treasury: &mut TreasuryCap<OX4E33TOKEN>,
        coin: Coin<OX4E33TOKEN>,
    ){
        coin::burn(treasury,coin);
    }
}