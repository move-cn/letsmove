module task2::mycoin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self,Url};
    
    public struct MYCOIN has drop {}

    fun init(witness: MYCOIN, ctx: &mut TxContext) {
        let (cap, metadata) = coin::create_currency<MYCOIN>(
            witness,
            2, // decimals
            b"MYCOIN", // symbol
            b"yinheli's coin", // name
            b"hello coin for learning move", // description
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/235094")), // icon
            ctx, // context
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(cap, tx_context::sender(ctx))
    }

    public fun mint(
        cap: &mut TreasuryCap<MYCOIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(cap, amount, recipient, ctx)
    }

    public fun burn(cap: &mut TreasuryCap<MYCOIN>, coin: Coin<MYCOIN>) {
        coin::burn(cap, coin);
    }


    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        init(MYCOIN {}, ctx)
    }
}

#[test_only]
module task2::mycoin_tests {
    use task2::mycoin::{Self, MYCOIN};
    use sui::coin::{Coin, TreasuryCap};
    use sui::test_scenario::{Self, next_tx, ctx};

    #[test]
    fun it_works() {
        let addr1 = @0x0;

        let mut scenario = test_scenario::begin(addr1);

        {
            mycoin::test_init(ctx(&mut scenario));
        };

        next_tx(&mut scenario, addr1);

        {
            let mut cap = test_scenario::take_from_sender<TreasuryCap<MYCOIN>>(&scenario);
            mycoin::mint(&mut cap, 10, addr1, test_scenario::ctx(&mut scenario));
            test_scenario::return_to_address<TreasuryCap<MYCOIN>>(addr1, cap);
        };

        next_tx(&mut scenario, addr1);

        {
            let coin = test_scenario::take_from_sender<Coin<MYCOIN>>(&scenario);
            let mut cap = test_scenario::take_from_sender<TreasuryCap<MYCOIN>>(&scenario);
            mycoin::burn(&mut cap, coin);
            test_scenario::return_to_address<TreasuryCap<MYCOIN>>(addr1, cap);
        };

        test_scenario::end(scenario);
    }
}