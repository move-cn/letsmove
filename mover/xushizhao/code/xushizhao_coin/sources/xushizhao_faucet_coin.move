module xushizhao_coin::xushizhao_faucet_coin {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use std::string::String;
    use std::vector;
    use sui::coin::{Self, TreasuryCap, Coin};
    use std::debug::print;
    
    public struct XUSHIZHAO_FAUCET_COIN has drop {}


    public struct MyCoinTreasuryCap has key {
        id: UID,
        treasury_cap: TreasuryCap<XUSHIZHAO_FAUCET_COIN>,
    }
 
    fun init(otw: XUSHIZHAO_FAUCET_COIN, ctx: &mut TxContext) {

        let (treasury_cap, metadata) = coin::create_currency(
            otw,
            9,
            b"xuCoin",
            b"xushizhao faucet Coin",
            b"xushizhao tow Coin",
            option::none(),
            ctx,
        );

        transfer::public_share_object(treasury_cap);
        transfer::public_freeze_object(metadata);

        // transfer::public_transfer(treasury_cap, tx_context::sender(ctx));      
        // transfer::public_share_object(metadata);

        // let mycoin_treasurycap =  MyCoinTreasuryCap {
        //     id: object::new(ctx),
        //     treasury_cap,
        // };
        // transfer::share_object(mycoin_treasurycap);
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<XUSHIZHAO_FAUCET_COIN>, amount: u64, to: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, to , ctx);          
    }


    
}
