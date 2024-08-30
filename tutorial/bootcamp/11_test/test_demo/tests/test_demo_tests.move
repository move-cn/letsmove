#[test_only]
module test_demo::test_demo_tests {

    use sui::test_scenario::{ctx, begin, end, next_tx};
    use test_demo::test_demo::test_for_init;

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_init() {

        let my_address = @0x88888;
        let my_address = @0x111111;

        let  mut scenario =    begin(my_address);
        let my_ctx = ctx(&mut scenario);
        test_for_init(my_ctx);

        // 模拟钱包签名发到链 但是真实的是发到内存里面
      // let transaction_effects =   next_tx(&mut scenario, my_address);

        end(scenario);
    }


    // #[test, expected_failure(abort_code = ::test_demo::test_demo_tests::ENotImplemented)]
    // fun test_test_demo_fail() {
    //     abort ENotImplemented
    // }
}

