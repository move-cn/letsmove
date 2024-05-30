module task2::faucet_coin {
    use sui::coin;
    use sui::url::new_unsafe_from_bytes;

    public struct FAUCET_COIN has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency(
            witness,
            9,
            b"FAUCET",
            b"FAUCET COIN",
            b"One Faucet Coin",
            option::some(new_unsafe_from_bytes(b"https://cxoevc6nxqzhidpbr2h67eyyujeeyazwipodezy35nhxqxd52sya.arweave.net/FdxKi828MnQN4Y6P75MYokhMAzZD3DJnG-tPeFx91LA")),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap);
    }
}
