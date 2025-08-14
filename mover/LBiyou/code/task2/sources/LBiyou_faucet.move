module task2::lbiyou_faucet {

    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self,Url};

    public struct LBIYOU_FAUCET has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: LBIYOU_FAUCET, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<LBIYOU_FAUCET>(
            witness,
            9,
            b"LBIYOU_FAUCET",
            b"LBIYOU_FAUCET",
            b"LBIYOU's faucet coin, everyone can apply.",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/104566270?v=4")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap)
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<LBIYOU_FAUCET>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<LBIYOU_FAUCET>, coin: Coin<LBIYOU_FAUCET>) {
        coin::burn(treasury_cap, coin);
    }
}