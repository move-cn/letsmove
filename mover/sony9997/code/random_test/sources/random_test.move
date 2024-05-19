
/// Module: random-test
module random_test::random_test {
    use std::string::{Self, String};
    use sui::tx_context::{Self, TxContext};
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::event;
    use sui::random::{Self,new_generator,Random,RandomGenerator};
    
    public struct TrndExt has copy, drop {
        trnd_ext: u8,
    }

    public entry fun showrandom(r: &Random, ctx: &mut TxContext){
        
        let mut generator = new_generator(r, ctx);
        let v = random::generate_u8_in_range(&mut generator, 1, 100);

        event::emit(TrndExt{
            trnd_ext:v
        });
    }
}

