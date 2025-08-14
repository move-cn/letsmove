module xushizhao_coin::xushizhao_coin {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use std::string::String;
    use std::vector;
    use sui::coin::{Self, TreasuryCap, Coin};
    use std::debug::print;
    
    public struct XUSHIZHAO_COIN has drop {}


    public struct MyCoinTreasuryCap has key {
        id: UID,
        treasury_cap: TreasuryCap<XUSHIZHAO_COIN>,
    }
 
    fun init(otw: XUSHIZHAO_COIN, ctx: &mut TxContext) {

        let (treasury_cap, metadata) = coin::create_currency(
            otw,
            9,
            b"xuCoin",
            b"xushizhao Coin",
            b"My first Coin",
            option::none(),
            ctx,
        );

        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));      
        transfer::public_share_object(metadata);

        // let mycoin_treasurycap =  MyCoinTreasuryCap {
        //     id: object::new(ctx),
        //     treasury_cap,
        // };
        // transfer::share_object(mycoin_treasurycap);
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<XUSHIZHAO_COIN>, amount: u64, to: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, to , ctx);          
    }

    public entry fun getCoin() {
        let c :u8= 1;
        print(&c);                 
    } 

    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        init(XUSHIZHAO_COIN {}, ctx);
    }

    
}
