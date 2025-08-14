module mycoin::mycoin {
    use sui::coin;

    public struct MYCOIN has drop{}

    fun init (witness: MYCOIN, ctx: &mut TxContext) {
        let (mut cap, meta) = coin::create_currency<MYCOIN>(
            witness,
            8,
            b"xG0Ian",
            b"xG0Ian",
            b"",
            option::none(),
            ctx);
        transfer::public_share_object(meta);
        coin::mint_and_transfer<MYCOIN>(&mut cap, 0xffffffff, tx_context::sender(ctx), ctx);
        transfer::public_transfer(cap, tx_context::sender(ctx));
    }

    public entry fun mint(cap: &mut coin::TreasuryCap<MYCOIN>, amount: u64, recv: address, ctx: &mut TxContext) {
        coin::mint_and_transfer<MYCOIN>(cap, amount, recv, ctx);
    }

}
