module faucet::faucet {
    use sui::coin;

    public struct FAUCET has drop{}

    fun init (witness: FAUCET, ctx: &mut TxContext) {
        let (cap, meta) = coin::create_currency<FAUCET>(
            witness,
            8,
            b"xG0Ian Faucet",
            b"xG0Ian",
            b"",
            option::none(),
            ctx);
        transfer::public_share_object(meta);
        // coin::mint_and_transfer<FAUCET>(&mut cap, 0xffffffff, tx_context::sender(ctx), ctx);
        transfer::public_share_object(cap);
    }

    public entry fun faucet(cap: &mut coin::TreasuryCap<FAUCET>, amount: u64, recv: address, ctx: &mut TxContext) {
        coin::mint_and_transfer<FAUCET>(cap, amount, recv, ctx);
    }

}
