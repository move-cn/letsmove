#[allow(duplicate_alias)]
/// Module: task_02
module task_02::rmb_coin {
    use std::debug;
    use std::ascii::string;
    use std::option;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::new_unsafe;

    public struct RMB_COIN has drop {}

    #[lint_allow(self_transfer)]
    fun init(
        witness: RMB_COIN,
        ctx: &mut TxContext
    ) {
        debug::print(&string(b"init RMB_COIN"));
        let url_obj = new_unsafe(std::ascii::string(b"https://avatars.githubusercontent.com/u/36093027?v=4"));
        let (treasury, metadata) = coin::create_currency(
            witness,
            8, // decimals
            b"SuiRMB", // symbol
            b"Sui RMB", // name
            b"My first coin", // description
            option::some(url_obj), // icon url
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    #[lint_allow(self_transfer)]
    #[allow(unused_variable)]
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<RMB_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        debug::print(&string(b"mint"));
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<RMB_COIN>,
        coin: Coin<RMB_COIN>
    ) {
        debug::print(&string(b"burn"));
        coin::burn(treasury_cap, coin);
    }


    // === Tests ===
    #[test_only]
    use sui::test_scenario as ts;

    #[test]
    fun test_self_mint() {
        let admin = @0xA;
        let mut scenario = ts::begin(admin);

        // init
        ts::next_tx(&mut scenario, admin);
        {
            init(RMB_COIN {}, scenario.ctx());
        };

        // mint 100 coin => admin
        ts::next_tx(&mut scenario, admin);
        {
            let mut treasurycap = ts::take_from_sender<TreasuryCap<RMB_COIN>>(&scenario);
            mint(&mut treasurycap, 100, admin, scenario.ctx());
            // ts::return_to_address<TreasuryCap<RMB_COIN>>(admin, treasurycap);
            ts::return_to_sender<TreasuryCap<RMB_COIN>>(&scenario, treasurycap);
        };

        // query [admin] coin
        ts::next_tx(&mut scenario, admin);
        {
            let coin = ts::take_from_sender<Coin<RMB_COIN>>(&scenario);
            debug::print(&coin::value(&coin));
            ts::return_to_sender<Coin<RMB_COIN>>(&scenario, coin);
        };

        // burn
        ts::next_tx(&mut scenario, admin);
        {
            let coin = ts::take_from_sender<Coin<RMB_COIN>>(&scenario);
            let mut treasurycap = ts::take_from_sender<TreasuryCap<RMB_COIN>>(&scenario);

            burn(&mut treasurycap, coin);
            ts::return_to_address<TreasuryCap<RMB_COIN>>(admin, treasurycap);
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
            init(RMB_COIN {}, scenario.ctx());
        };

        // mint 100 coin => user1
        ts::next_tx(&mut scenario, admin);  // if change to user1, failed!
        {
            let mut treasurycap = ts::take_from_sender<TreasuryCap<RMB_COIN>>(&scenario);
            mint(&mut treasurycap, 100, user1, scenario.ctx());
            ts::return_to_sender<TreasuryCap<RMB_COIN>>(&scenario, treasurycap);
        };

        // burn [user1] coin
        {
            // switch to user1
            ts::next_tx(&mut scenario, user1);
            let coin = ts::take_from_sender<Coin<RMB_COIN>>(&scenario);
            debug::print(&coin::value(&coin));

            // switch to admin  独享所有权!
            ts::next_tx(&mut scenario, admin);
            let mut treasurycap = ts::take_from_sender<TreasuryCap<RMB_COIN>>(&scenario);
            burn(&mut treasurycap, coin);
            ts::return_to_address<TreasuryCap<RMB_COIN>>(admin, treasurycap);
            // ts::return_to_sender<TreasuryCap<RMB_COIN>>(&scenario, treasurycap);
        };

        ts::end(scenario);
        // pass
    }
}
