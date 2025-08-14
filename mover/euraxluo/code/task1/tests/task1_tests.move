#[test_only]
module task1::task1_tests {
    // uncomment this line to import the module
    // use task1::hello_world;
    #[test]
    fun test_task1() {
        // Create a dummy TxContext for testing
        let mut ctx = tx_context::dummy();
        task1::hello_world::mint(&mut ctx);
    }
}