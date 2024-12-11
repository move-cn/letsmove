/*
/// Module: move_coin
module move_coin::move_coin;
*/
module move_coin::my_coin {
    use std::ascii::string;
    use std::debug;
    use sui::coin::{Self, Coin, TreasuryCap};

    public struct MY_COIN has drop {}

    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,
            b"MOON",
            b"CTIANMING_MY_COIN",
            b"MOON_COIN",
            option::none(),
            ctx,
        );
        debug::print(&string(b"init MY_COIN"));
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, ctx.sender())
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<MY_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        debug::print(&string(b"my_coin mint"));
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<MY_COIN>, coin: Coin<MY_COIN>) {
        debug::print(&string(b"burn"));
        coin::burn(treasury_cap, coin);
    }

    #[test_only]
    use sui::test_scenario as ts;

    #[test]
    fun test_self_mint() {
        let admin = @0xA;
        let mut scenario = ts::begin(admin);

        // init
        ts::next_tx(&mut scenario, admin);
        {
            init(MY_COIN {}, scenario.ctx());
        };

        // mint 100 coin => admin
        ts::next_tx(&mut scenario, admin);
        {
            let mut treasurycap = ts::take_from_sender<TreasuryCap<MY_COIN>>(&scenario);
            mint(&mut treasurycap, 100, admin, scenario.ctx());
            // ts::return_to_address<TreasuryCap<RMB_COIN>>(admin, treasurycap);
            ts::return_to_sender<TreasuryCap<MY_COIN>>(&scenario, treasurycap);
        };

        // query [admin] coin
        ts::next_tx(&mut scenario, admin);
        {
            let coin = ts::take_from_sender<Coin<MY_COIN>>(&scenario);
            debug::print(&coin::value(&coin));
            ts::return_to_sender<Coin<MY_COIN>>(&scenario, coin);
        };

        // burn
        ts::next_tx(&mut scenario, admin);
        {
            let coin = ts::take_from_sender<Coin<MY_COIN>>(&scenario);
            let mut treasurycap = ts::take_from_sender<TreasuryCap<MY_COIN>>(&scenario);

            burn(&mut treasurycap, coin);
            ts::return_to_address<TreasuryCap<MY_COIN>>(admin, treasurycap);
        };

        ts::end(scenario);
        // pass
    }

    #[test]
    fun test_another_mint() {
        let admin = @0xA;
        let user1 = @0xB;
        let mut scenario = ts::begin(admin);

        // init，注意这里使用admin初始化，因为独享所有权，所以后面的操作都必须切换回admin
        ts::next_tx(&mut scenario, admin);
        {
            init(MY_COIN {}, scenario.ctx());
        };

        // mint 100 coin => user1
        ts::next_tx(&mut scenario, admin); // if change to user1, failed!
        {
            let mut treasurycap = ts::take_from_sender<TreasuryCap<MY_COIN>>(&scenario);
            mint(&mut treasurycap, 100, user1, scenario.ctx());
            ts::return_to_sender<TreasuryCap<MY_COIN>>(&scenario, treasurycap);
        };

        // burn [user1] coin
        {
            // switch to user1
            ts::next_tx(&mut scenario, user1);
            let coin = ts::take_from_sender<Coin<MY_COIN>>(&scenario);
            debug::print(&coin::value(&coin));

            // switch to admin  独享所有权!
            ts::next_tx(&mut scenario, admin);
            let mut treasurycap = ts::take_from_sender<TreasuryCap<MY_COIN>>(&scenario);
            burn(&mut treasurycap, coin);
            ts::return_to_address<TreasuryCap<MY_COIN>>(admin, treasurycap);
        };

        ts::end(scenario);
        // pass
    }
}

module move_coin::faucet_coin {
    use std::ascii::string;
    use std::debug;
    use sui::coin::{Self, Coin, TreasuryCap};

    public struct FAUCET_COIN has drop {}

    fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,
            b"MOON",
            b"CTIANMING_FAUCET_COIN",
            b"MOON_COIN",
            option::none(),
            ctx,
        );
        debug::print(&string(b"init FAUCET_COIN"));
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury)
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        debug::print(&string(b"faucet_coin mint"));
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<FAUCET_COIN>, coin: Coin<FAUCET_COIN>) {
        debug::print(&string(b"burn"));
        coin::burn(treasury_cap, coin);
    }

    #[test_only]
    use sui::test_scenario as ts;

    #[test]
    fun test_faucet_coin() {
        let admin = @0xCAFE;
        let user0 = @0xFECA;
        let user1 = @0xABCD;
        let mut scenario = ts::begin(admin);

        // init
        ts::next_tx(&mut scenario, admin);
        {
            init(FAUCET_COIN {}, scenario.ctx());
        };

        // admin mint 100 coin
        ts::next_tx(&mut scenario, admin);
        {
            let mut treasurycap = ts::take_shared<TreasuryCap<FAUCET_COIN>>(&scenario);
            mint(&mut treasurycap, 100, admin, scenario.ctx());
            ts::return_shared<TreasuryCap<FAUCET_COIN>>(treasurycap);
        };

        // query [admin] coin
        ts::next_tx(&mut scenario, admin);
        {
            let coin = ts::take_from_sender<Coin<FAUCET_COIN>>(&scenario);
            debug::print(&coin::value(&coin));
            ts::return_to_sender<Coin<FAUCET_COIN>>(&scenario, coin);
        };

        // user1 mint 200 coin。注意，这里和独享所有权不同，不会报错，可以mint！
        ts::next_tx(&mut scenario, user1);
        {
            let mut treasurycap = ts::take_shared<TreasuryCap<FAUCET_COIN>>(&scenario);
            mint(&mut treasurycap, 200, user1, scenario.ctx());
            ts::return_shared<TreasuryCap<FAUCET_COIN>>(treasurycap);
        };

        // query [user1] coin
        ts::next_tx(&mut scenario, user0);
        {
            let coin = ts::take_from_sender<Coin<FAUCET_COIN>>(&scenario);
            debug::print(&coin::value(&coin));
            ts::return_to_sender<Coin<FAUCET_COIN>>(&scenario, coin);
        };

        // query [user1] coin
        ts::next_tx(&mut scenario, user1);
        {
            let coin = ts::take_from_sender<Coin<FAUCET_COIN>>(&scenario);
            debug::print(&coin::value(&coin));
            ts::return_to_sender<Coin<FAUCET_COIN>>(&scenario, coin);
        };

        // burn [admin] coin，共享所有权，可以分别对自己的coin操作！
        ts::next_tx(&mut scenario, admin);
        {
            let coin = ts::take_from_sender<Coin<FAUCET_COIN>>(&scenario);
            let mut treasurycap = ts::take_shared<TreasuryCap<FAUCET_COIN>>(&scenario);
            burn(&mut treasurycap, coin);
            ts::return_shared<TreasuryCap<FAUCET_COIN>>(treasurycap);
        };

        // burn [user0] coin，共享所有权，可以分别对自己的coin操作！
        ts::next_tx(&mut scenario, user0);
        {
            let coin = ts::take_from_sender<Coin<FAUCET_COIN>>(&scenario);
            let mut treasurycap = ts::take_shared<TreasuryCap<FAUCET_COIN>>(&scenario);
            burn(&mut treasurycap, coin);
            ts::return_shared<TreasuryCap<FAUCET_COIN>>(treasurycap);
        };

        // burn [user1] coin，共享所有权，可以分别对自己的coin操作！
        ts::next_tx(&mut scenario, user1);
        {
            let coin = ts::take_from_sender<Coin<FAUCET_COIN>>(&scenario);
            let mut treasurycap = ts::take_shared<TreasuryCap<FAUCET_COIN>>(&scenario);
            burn(&mut treasurycap, coin);
            ts::return_shared<TreasuryCap<FAUCET_COIN>>(treasurycap);
        };

        ts::end(scenario);
        // pass
    }
}
