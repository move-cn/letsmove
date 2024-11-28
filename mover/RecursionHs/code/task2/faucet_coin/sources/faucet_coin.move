module faucet_coin::alone {
    use std::option;
    use sui::coin;
    use sui::coin::TreasuryCap;
    use sui::url;

    const ERROR_CODE: u64 = 0;

    public struct ALONE has drop {}

    fun init(witness: ALONE, ctx: &mut TxContext) {
        let coin_url = url::new_unsafe_from_bytes(
            b"https://y.qq.com/music/photo_new/T002R300x300M000003vlbmf2UucSo_1.jpg?max_age=2592000"
        );

        let (treasury_cap, metadata) = coin::create_currency<ALONE>(
            witness,
            4,
            b"ALONE",
            b"ALONE",
            b"a private ALONE for sui network",
            option::some(coin_url),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap);
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<ALONE>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }
}