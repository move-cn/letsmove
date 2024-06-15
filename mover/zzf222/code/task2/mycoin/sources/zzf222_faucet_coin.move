module mycoin::zzf222_faucet_coin {
    use std::option;
    use sui::coin::{Self,Coin,TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct ZZF222_FAUCET_COIN has drop {}

    public struct MintEvent has copy, drop{
        amount: u64,
        recipient: address
    }

    fun init(witness: ZZF222_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency(witness, 6, b"FAUCET_COIN", b"", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap);
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<ZZF222_FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<ZZF222_FAUCET_COIN>, 
        coin:coin::Coin<ZZF222_FAUCET_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}