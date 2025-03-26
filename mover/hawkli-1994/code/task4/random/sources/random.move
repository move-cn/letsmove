/*
/// Module: random
module random::random;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module random::random {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::random;


    /// One-time witness for the module
    public struct RANDOM has drop {}

    /// Module initializer
    fun init(witness: RANDOM, ctx: &mut TxContext) {
        // Create a new Random object using the framework's function
        let random = random::create_random(ctx);
        
        // Share the Random object so it can be used by other contracts
        transfer::public_share_object(random);
    }
}


