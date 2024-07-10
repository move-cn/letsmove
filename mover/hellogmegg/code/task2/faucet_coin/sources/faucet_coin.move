/// Module: faucet_coin
module faucet_coin::tmm_faucet {
    use sui::coin::{Self, Coin, TreasuryCap};

    public struct TMM_FAUCET has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: TMM_FAUCET, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"TMM_FAUCET", b"TMM_FAUCET", b"faucet coin is TMM_FAUCET", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<TMM_FAUCET>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }


}
