module qtq::qtq_coin;
use sui::coin;
use sui::coin::{create_currency, TreasuryCap, Coin};
use sui::url::Url;
use sui::transfer::{public_freeze_object, public_transfer};

public struct QTQ_COIN has drop {}

fun init(witness: QTQ_COIN, ctx: &mut TxContext)
{
    let (treasury, metadata) = create_currency(
        witness,
        6,
        b"QTQ_Coin",
        b"QTQ_Coin",
        b"this is a coin for qtq",
        option::none<Url>(),
        ctx
    );

    public_freeze_object(metadata);

    public_transfer(treasury, ctx.sender());
}

public entry fun mint(c: &mut TreasuryCap<QTQ_COIN>, amount: u64, recipient: address, ctx: &mut TxContext,)
{
    coin::mint_and_transfer(c, amount, recipient, ctx);
}

public entry fun brun(cap: &mut TreasuryCap<QTQ_COIN>, c: Coin<QTQ_COIN>)
{
    coin::burn(cap, c);
}
