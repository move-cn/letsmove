module qtq_faucet_coin::qtq_faucet_coin;
use std::option;
use sui::coin;
use sui::coin::{create_currency, TreasuryCap, Coin};
use sui::url::Url;
use sui::transfer::{public_freeze_object, public_share_object};

public struct QTQ_FAUCET_COIN has drop {}

fun init(witness: QTQ_FAUCET_COIN, ctx: &mut TxContext)
{
    let (treasury, metadata) = create_currency(
        witness,
        6,
        b"QTQ_Faucet_Coin",
        b"QTQ_Faucet_Coin",
        b"this is a coin for qtq_faucet",
        option::none<Url>(),
        ctx
    );
    public_freeze_object(metadata);
    public_share_object(treasury);
}

public entry fun mint(c: &mut TreasuryCap<QTQ_FAUCET_COIN>, amount: u64, recipient: address, ctx: &mut TxContext)
{
    coin::mint_and_transfer(c, amount, recipient, ctx);
}

public entry fun burn(cap: &mut TreasuryCap<QTQ_FAUCET_COIN>, c: Coin<QTQ_FAUCET_COIN>)
{
    coin::burn(cap, c);
}
