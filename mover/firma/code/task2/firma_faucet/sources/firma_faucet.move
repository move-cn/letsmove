// Module: firma_faucet
#[allow(duplicate_alias)]
module firma_faucet::firma_faucet {
    use std::option;
    use sui::coin::{Self, TreasuryCap, Coin};
    use sui::transfer;
    use sui::tx_context::{TxContext};
    use sui::event;

    public struct MintEvent has copy, drop {
        amount: u64,
        recipient: address,
    }

    public struct FIRMA_FAUCET has drop {}

    #[allow(unused_const)]
    const EFaucetDry: u64 = 1;

    #[allow(lint(share_owned))]
    fun init(witness: FIRMA_FAUCET, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<FIRMA_FAUCET>(
            witness,
            10,
            b"FIRMA Faucet",
            b"FIRMA Faucet Coins",
            b"Get some free coin",
            option::none(),
            ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap);
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<FIRMA_FAUCET>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext) {
        let coins = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coins, recipient);
        event::emit(MintEvent{ amount, recipient });
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<FIRMA_FAUCET>, coin: Coin<FIRMA_FAUCET>) {
        coin::burn(treasury_cap, coin);
    }
}

