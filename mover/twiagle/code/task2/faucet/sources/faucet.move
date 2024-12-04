module faucet::twiaglefaucet {
    use std::ascii::{String, string};
    use sui::object::{Self,UID};
    use sui::transfer;
    use sui::tx_context::{TxContext, sender};
    use sui::coin::{Self, Coin, TreasuryCap};
    use std::option;

    public struct TWIAGLEFAUCET has drop{}

    fun init(witness: TWIAGLEFAUCET, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"twiagleFaucet", b"", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    public entry fun mint_and_transfer(treasure_cap: &mut TreasuryCap<TWIAGLEFAUCET>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasure_cap, amount, recipient, ctx);
    }
}