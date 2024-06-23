/// Module: my_coin
module my_coin::my_coin {
    use sui::coin::{Self, TreasuryCap};

    public struct MY_COIN has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"Q_MC", b"Q_MC", b"Move coin by isQyoung", option::none(), ctx);
        transfer::public_share_object(metadata);
        transfer::public_transfer(treasury, ctx.sender())
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<MY_COIN>, 
        amount: u64, 
        recipient: address, 
        ctx: &mut TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }
}

