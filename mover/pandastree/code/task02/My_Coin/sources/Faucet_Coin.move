module my_coin::Faucet_Coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct FAUCET_COIN has drop{}

    fun init(witness: FAUCET_COIN, ctx: &mut TxContext){
        let (treasury, metadata) = coin::create_currency(witness, 1, b"Faucet", b"Faucet_Coin", b"This is faucet coin", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    public fun mint_Faucet_Coin(treasury_cap: &mut TreasuryCap<FAUCET_COIN>, amount:u64, recipient: address, ctx: &mut TxContext){
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
    }

}