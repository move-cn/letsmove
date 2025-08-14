
#[test_only]
module my_game::my_game_tests {
    // uncomment this line to import the module
    use sui::clock;
    use sui::clock::Clock;
    use sui::clock_tests;
    use my_game::PhigrosX::PHIGROSX;
    use my_game::PhigrosX;
    use sui::coin::TreasuryCap;
    use sui::random;
    use sui::random::Random;
    use sui::test_scenario;
    use sui::test_scenario::{ctx, next_tx};
    use sui::token::Token;
    use my_game::my_game;
    const ENotImplemented: u64 = 0;

    #[test]
    fun test_my_game() {
        let addr = @0x0;
        let mut sce = test_scenario::begin(addr); //mut
        //test init
        {
            PhigrosX::test_init(ctx(&mut sce));
        };
        next_tx(&mut sce, addr);
        // test get gem
        {
            let mut treasuryCap = test_scenario::take_shared<TreasuryCap<PHIGROSX>>(&mut sce); //mut
            PhigrosX::test_get_gem(&mut treasuryCap, ctx(&mut sce));
            // remember to return
            test_scenario::return_shared(treasuryCap);
        };
        //test buy sword
        {
             //get clock
            let clock = clock::create_for_testing(ctx(&mut sce));
            next_tx(&mut sce, addr);
            //let clock = test_scenario::take_from_sender<Clock>(&mut sce);
            let gem = test_scenario::take_from_sender<Token<PHIGROSX>>(&mut sce);
            let mut treasuryCap = test_scenario::take_shared<TreasuryCap<PHIGROSX>>(&mut sce);//mut
            my_game::buySword(gem, &clock, &mut treasuryCap, ctx(&mut sce));
            //return
            test_scenario::return_shared(treasuryCap);
            clock::destroy_for_testing(clock);
        };
        test_scenario::end(sce);
    }
}

