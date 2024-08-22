#[test_only]
module task4::task4_tests {
    use std::debug::print;
    use sui::kiosk_test_utils::ctx;
    use sui::tx_context;
    use task4::game::{get_spin_result, get1, SpinResult};

    // uncomment this line to import the module
    const ENotImplemented: u64 = 0;

    #[test]
    fun test_task4() {
        let mut ctx = tx_context::new(@0x4324, b"7R3o261jgegFmgWCVBubF4JqD6xrsrrP",1,1,1);
        let  s:SpinResult = get_spin_result(&mut ctx);
        print(&get1(&s))
    }
}
