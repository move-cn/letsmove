#[allow(duplicate_alias, unused_use)]
/// Module: faucetcoin
module faucetcoin::faucet_coin {
    use std::debug;
    use std::ascii::string;
    use std::option;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::new_unsafe;

    public struct FAUCET_COIN has drop {}

    #[lint_allow(self_transfer)]
    #[allow(lint(share_owned))]
    fun init(
        witness: FAUCET_COIN,
        ctx: &mut TxContext
    ) {
        debug::print(&string(b"init FAUCET_COIN"));
        let url_obj = new_unsafe(std::ascii::string(b"https://avatars.githubusercontent.com/u/36093027?v=4"));
        let (treasury, metadata) = coin::create_currency(
            witness,
            8,                // decimals
            b"SuiFaucetRMB",           // symbol
            b"Sui Faucet RMB",       // name
            b"My faucet coin", // description
            option::some(url_obj),   // icon url
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    #[lint_allow(self_transfer)]
    #[allow(unused_variable)]
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        debug::print(&string(b"faucet mint"));
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<FAUCET_COIN>,
        coin: Coin<FAUCET_COIN>
    ) {
        debug::print(&string(b"burn"));
        coin::burn(treasury_cap, coin);
    }


    // === Tests ===
    #[test_only]
    use sui::test_scenario as ts;

    #[test]
    fun test_faucet_coin() {
        let admin = @0xA;
        let user1 = @0xB;
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
