/*
/// Module: task1
module task1::task1 {

}
*/
module task1::task1 {
    // Part 1: imports
    use sui::transfer;
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};

    // Part 2: struct definition
    public struct Counter has key {
        id: UID,
        value: u64,
    }

    // Part 3: transfer the counter object to the sender
    entry public fun getCounter(ctx: &mut TxContext) {
        // sender address
        let sender = tx_context::sender(ctx);
        let counter_obj = Counter {
            id: object::new(ctx),
            value: 0
        };
        transfer::transfer(counter_obj, sender);
    }

    // part 4: public/ entry functions
    public entry fun incr(counter: &mut Counter) {
        counter.value = counter.value + 1;
    } 
}