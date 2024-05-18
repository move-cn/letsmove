
#[test_only]
module hello_move::hello_move_tests {
    use hello_move::hello_move::{Self};
    use sui::test_scenario::{Self, next_tx, ctx};

    #[test]
    fun say_hello() {
        let addr1 = @0xA;

        // Begins a multi transaction scenario with addr1 as the sender
        let scenario = test_scenario::begin(addr1);
        
        next_tx(&mut scenario, addr1);
        {
            hello_move::test_say_hello(test_scenario::ctx(&mut scenario));
        };
         // Cleans up the scenario object
        test_scenario::end(scenario);
    }
}