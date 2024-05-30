#[test_only]
#[allow(unused_use, duplicate_alias)]
module task_02::task_02_tests {
    // uncomment this line to import the module
    use std::debug;
    use sui::tx_context::TxContext;
    use task_02::rmb_coin;
    use sui::coin;
    use sui::coin::TreasuryCap;

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_coin_mint() {
       // pass
    }

    #[test]
    #[allow(duplicate_alias)]
    fun test_for_init() {
        let mut _ctx = tx_context::dummy();
        rmb_coin::test_for_init(&mut _ctx);
       // pass
    }

    #[test, expected_failure(abort_code = ::task_02::task_02_tests::ENotImplemented)]
    fun test_task_02_fail() {
        abort ENotImplemented
    }
}

