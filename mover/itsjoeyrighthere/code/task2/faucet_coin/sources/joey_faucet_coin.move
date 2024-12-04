
/// Module: faucet_coin
module faucet_coin::joeyfaucetcoin {
    use sui::coin::{Self};
    use sui::url::{Url,Self};

    public struct JOEYFAUCETCOIN has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: JOEYFAUCETCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            9,                // decimals
            b"JOEYF",           // symbol
            b"Joey Faucet Coin",       // name
            b"itsjoeyrighthere", // description
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/48686956")), // icon url
            ctx
        );
        
        transfer::public_freeze_object(metadata);
        
        transfer::public_share_object(treasury)
    }

    public entry fun mint(
        treasury_cap: &mut coin::TreasuryCap<JOEYFAUCETCOIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public entry fun burn(treasury_cap: &mut coin::TreasuryCap<JOEYFAUCETCOIN>, target: coin::Coin<JOEYFAUCETCOIN>) {
        coin::burn(treasury_cap, target);
    }
}
