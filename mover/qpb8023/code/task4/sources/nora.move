module task5::task5 {
    // use sui::random;
    // use sui::random::{new_generator};
    use std::string;
    use sui::event;
    use sui::clock;

    const EInvalidInput: u64 = 0;

    public struct PlayEvent has copy, drop {
        user_input: u8,
        random_number: u8,
        result: string::String,
    }

    public entry fun mora(clock: &clock::Clock,user_input: u8,_ctx: &mut TxContext ) {
        assert!(user_input >= 1 && user_input <= 3, EInvalidInput);
        // let mut generator = new_generator(r, ctx);
        // let rm = random::generate_u8_in_range(&mut generator, 1, 3);

        let rm = get_random_number(clock);
        if (user_input == rm){
            event::emit(PlayEvent { user_input: user_input,random_number:rm,result:b"You win. My github id is qpb8023".to_string() });
        }else {
            event::emit(PlayEvent { user_input: user_input,random_number:rm,result:b"You lose.".to_string() });
        
        }
    }

    fun get_random_number(clock: &clock::Clock): u8 {
        let random_value = ((clock::timestamp_ms(clock) % 3) as u8) + 1;
        random_value
    }
}