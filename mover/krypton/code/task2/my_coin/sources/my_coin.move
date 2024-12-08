module my_coin::krypton_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self, Url};

    public struct KRYPTON_COIN has drop {}

    fun init(witness: KRYPTON_COIN,ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency(
            witness,
            9,
            b"krypton",
            b"KRYPTON_COIN",
            b"Krypton Coin",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/154910746?v=4")),
            ctx
        );
        //冻结metadata对象，阻止后续修改
        transfer::public_freeze_object(metadata);

        //将铸币权限转至sender
        transfer::public_transfer(treasury_cap,tx_context::sender(ctx))
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<KRYPTON_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
}

