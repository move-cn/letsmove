module my_coin::my_coin {
    use sui::coin::{Self, TreasuryCap};
    use sui::url::{new_unsafe};

    public struct MY_COIN has drop {}

    fun init(otw: MY_COIN, ctx: &mut sui::tx_context::TxContext) {
        let url_obj = new_unsafe(std::ascii::string(b"https://avatars.githubusercontent.com/u/153002627?v=4"));
        let (treasury_cap, meta) = coin::create_currency(
            otw,
            8,
            b"do0X0ob",
            b"do0X0ob",
            b"do0x0ob",
            option::some(url_obj),
            ctx
        );
        transfer::public_freeze_object(meta);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<MY_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        coin::mint_and_transfer(
            treasury_cap,
            amount,
            recipient,
            ctx
        )
    }

}

