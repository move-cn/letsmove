module task2::billa_github2016_faucet_coin {
    use std::ascii::string;
    use sui::coin::{ Self, TreasuryCap };
    use sui::url;

    public struct BILLA_GITHUB2016_FAUCET_COIN has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: BILLA_GITHUB2016_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metaData) = coin::create_currency(
            witness,
            9,
            b"BGF",
            b"BILLA_GITHUB2016_FAUCET_COIN",
            b"this is a faucet coin",
            option::some(url::new_unsafe(string(b"https://avatars.githubusercontent.com/u/9780825?v=4"))),
            ctx);
        transfer::public_freeze_object(metaData);
        transfer::public_share_object(treasury);
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<BILLA_GITHUB2016_FAUCET_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
}