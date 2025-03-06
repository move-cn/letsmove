module my_coin::faucet_coin;

use sui::balance::{Self, Balance};
use sui::coin::{Self, TreasuryCap};

public struct FAUCET_COIN has drop {}

public struct FaucetCoin has key, store {
    id: UID,
    coin: Balance<FAUCET_COIN>,
}

fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
    let (treasury_cap, metadata) = coin::create_currency<FAUCET_COIN>(
        witness,
        6,
        b"AKAKingFAUCET",
        b"AKAKingFAUCET",
        b"AKAKingFAUCET",
        option::none(),
        ctx,
    );
    transfer::public_freeze_object(metadata);
    transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    let faucet_coin = FaucetCoin {
        id: object::new(ctx),
        coin: balance::zero(),
    };
    transfer::public_share_object(faucet_coin);
}

public entry fun mint(
    treasury_cap: &mut TreasuryCap<FAUCET_COIN>,
    wallet: &mut FaucetCoin,
    amount: u64,
    ctx: &mut TxContext,
) {
    let coins = coin::mint(treasury_cap, amount, ctx);
    balance::join(&mut wallet.coin, coin::into_balance(coins));
}

public entry fun faucet(wallet: &mut FaucetCoin, ctx: &mut TxContext) {
    let coin2 = coin::take(&mut wallet.coin, 10000, ctx);
    transfer::public_transfer(coin2, tx_context::sender(ctx));
}
