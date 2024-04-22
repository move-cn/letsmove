
/// Module: my_game
module my_game::my_game {
    use sui::clock;
    use sui::clock::Clock;
    use my_game::PhigrosX::PHIGROSX;
    use sui::coin::TreasuryCap;
    use sui::object;
    use sui::object::{UID};
    use sui::random;
    use sui::random::Random;
    use sui::token;
    use sui::token::{Token};
    use sui::transfer;
    use sui::tx_context;
    use sui::tx_context::TxContext;

    // PackageID: 0x1ec8d31495d77b02df858458b604489a79ed10927b8898e5454147d3b3cdec5b
    // TreasuryCap: 0xc21b2ac195d1ee1258b6438a8a1c6116991e80528df1ea793f1cb7f68d785f53
    // getGEM: HSp8GRm8iTKb3RfHKLZ6vJ31RcMmPmC53ESKvYUgHBcd
    // buySword: 8vBzKvbXqWgksAFTH1icPqEJpmic6aW5E8moHfPLhqyj

    // create a sward which has different matrials
    public struct PhigrosX_Sword has key, store{
        id: UID,
        material: u8
    }

    const SWORDPRICE: u64 = 20;
    const BALANCENOTENOUGH: u64 = 111;
    const DIAMOND: u8 = 1;
    const GOLD: u8 = 2;
    const IRON: u8 = 3;

    // buy a sword, use the timestamp % 9 to get the random number
    entry public fun buySword(gems: Token<PHIGROSX>, clock: &Clock, treasuryCap: &mut TreasuryCap<PHIGROSX>, ctx: &mut TxContext){
        // make sure has enough gems first
        assert!(token::value(&gems) == SWORDPRICE, BALANCENOTENOUGH);
        // use the clock to get the current timestamp
        let time = clock::timestamp_ms(clock);
        // get the random number
        let rd = time % 9;
        if (rd == 0){
            transfer::public_transfer(PhigrosX_Sword{
                id: object::new(ctx),
                material: DIAMOND
            }, tx_context::sender(ctx));
        }else if(rd >= 1 && rd < 4 ){
            transfer::public_transfer(PhigrosX_Sword{
                id: object::new(ctx),
                material: GOLD
            }, tx_context::sender(ctx));
        }else {
            transfer::public_transfer(PhigrosX_Sword{
                id: object::new(ctx),
                material: IRON
            }, tx_context::sender(ctx));
        };
        let req = token::spend(gems, ctx);
        token::confirm_with_treasury_cap(treasuryCap, req, ctx);
    }

    #[test_only]
    public fun test_buy(gems: Token<PHIGROSX>, clock: &Clock, treasuryCap: &mut TreasuryCap<PHIGROSX>, ctx: &mut TxContext){
        buySword(gems, clock, treasuryCap, ctx);
    }
}


// create a in-game currency
module my_game::PhigrosX{
    use sui::coin;
    use sui::coin::{TreasuryCap, CoinMetadata};
    use sui::token;
    use sui::transfer;
    use sui::tx_context::{TxContext, sender};


    // OWT
    public struct PHIGROSX has drop{}

    //create the in-game currency
    fun init(owt: PHIGROSX, ctx: &mut TxContext){
        // create a common coin
        let mut treasuryCap; // mut needed
        let metadata;
        (treasuryCap, metadata) = coin::create_currency(
            owt,
            0,
            b"GME",
            b"game currency",
            b"in-game currency",
            option::none(),
            ctx
        );

        // make the coin become the specific token by adding policy
        let mut policy; // mut needed
        let capability;
        (policy, capability) = token::new_policy(&mut treasuryCap, ctx);
        // allow some specific use
        //token::allow(&mut policy, &capability, buy_action(), ctx);
        token::allow(&mut policy, &capability, token::spend_action(), ctx);

        // share the treasurycap to everyone so they can mint
        transfer::public_share_object(treasuryCap);
        // only the creator can govern the policy
        transfer::public_transfer(capability, sender(ctx));
        // share the policy to everyone
        token::share_policy(policy);
        transfer::public_freeze_object(metadata);
    }

    // use this function to get some gem coin
    entry public fun getSomeGme(treasuryCap: &mut TreasuryCap<PHIGROSX>, ctx: &mut TxContext){
        let amont = 20;
        // here we mint the specific token
        let my_token = token::mint(treasuryCap, amont, ctx);
        //let req = token::new_request<GEM>(buy_action(), 100, option::some(sender(ctx)), option::none(), ctx);
        let req = token::transfer(my_token, sender(ctx), ctx);
        token::confirm_with_treasury_cap(treasuryCap, req, ctx);
    }

    #[test_only]
    public fun test_init(ctx: &mut TxContext){
        init(PHIGROSX{}, ctx);
    }
    #[test_only]
    public fun test_get_gem(treasuryCap: &mut TreasuryCap<PHIGROSX>, ctx: &mut TxContext){
        getSomeGme(treasuryCap, ctx);
    }
}

