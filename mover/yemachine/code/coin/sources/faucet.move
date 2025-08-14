module coin::yemachine_faucet_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self,Url};

    public struct YEMACHINE_FAUCET_COIN has drop {}

    fun init(witness: YEMACHINE_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<YEMACHINE_FAUCET_COIN>(
            witness,
            9,
            b"YEMACHINE_FAUCET",
            b"YEMACHINE_FAUCET",
            b"yemachine's first faucet coin",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/167276459")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap)
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<YEMACHINE_FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<YEMACHINE_FAUCET_COIN>, 
        coin: Coin<YEMACHINE_FAUCET_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}