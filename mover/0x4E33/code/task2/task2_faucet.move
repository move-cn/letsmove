module my_first_package::Ox4e33Faucet {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self,Url};

    public struct OX4E33FAUCET has drop {}

    fun init(witness: OX4E33FAUCET, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency<OX4E33FAUCET>(
            witness,
            18,
            b"0x4E33Faucet",
            b"",
            b"",
            option::none(),
            ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury)
    }
    public entry fun mint(
        treasury: &mut TreasuryCap<OX4E33FAUCET>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury, amount, recipient, ctx);
    }
    public fun burn(
        treasury: &mut TreasuryCap<OX4E33FAUCET>, 
        coin: Coin<OX4E33FAUCET>
    ) {
        coin::burn(treasury, coin);
    }
}