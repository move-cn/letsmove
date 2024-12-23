module own_coin::turkey {
    use std::option;
    use sui::coin;
    use sui::coin::TreasuryCap;
    use sui::transfer;
    use sui::url;

    const ERROR_CODE: u64 = 0;

    public struct TURKEY has drop {}

    fun init(witness: TURKEY, ctx: &mut TxContext) {
        let coin_url = url::new_unsafe_from_bytes(
            b"https://a3-q.mafengwo.net/s9/M00/8C/0F/wKgBs1eyywmAVMsjAAmQf3sPcBY62.jpeg?imageView2/2/w/800/q/90/format/jpeg"
        );

        let (treasury_cap, metadata) = coin::create_currency<TURKEY>(
            witness,
            4,
            b"TURKEY",
            b"TURKEY",
            b"a private TURKEY for sui network",
            option::some(coin_url),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, ctx.sender());
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<TURKEY>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }
}