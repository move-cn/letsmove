
/// Module: rayl_faucet
module rayl_faucet::rayl_faucet {

    use sui::coin::{Self, Coin, TreasuryCap};

    public struct RAYL_FAUCET has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: RAYL_FAUCET, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<RAYL_FAUCET>(
            witness,
            6,
            b"RLF",
            b"RayL Coin Faucet",
            b"faucet coin by RayL",
            option::none(),
            ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap)
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<RAYL_FAUCET>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }

}

