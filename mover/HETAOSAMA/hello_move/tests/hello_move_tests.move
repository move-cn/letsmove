#[test_only]
module hello_move::hello_move_tests {
    // uncomment this line to import the module
    use hello_move::hello;

    #[test]
    public fun test_mint() {
        let ctx = &mut sui::tx_context::dummy();
        hello::mint(ctx);
    
    }
}
