// file: my_coin.move
module my_coin_faucet::yunfaucet {
    use sui::coin::{Self, Coin, TreasuryCap};

     public struct YUNFAUCET has drop {}

    fun init(witness: YUNFAUCET, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<YUNFAUCET>(
            witness,
            2,
            b"Azhan",
            b"YUNFAUCET",
            b"this is a test coin",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap);
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<YUNFAUCET>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<YUNFAUCET>, coin: Coin<YUNFAUCET>) {
        coin::burn(treasury_cap, coin);
    }

}
