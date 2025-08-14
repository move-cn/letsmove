module task7::task7 {
    use std::ascii::{String, string};
    use std::bcs;
    use std::hash::sha3_256;
    use std::vector;
    use sui::event;
    use std::string;
    use std::string::to_ascii;

    public struct FlagString has copy,drop {
        str: String,
        vec: vector<u8>,
    }
    

    public entry fun getString(str: String, id: String, _: &mut TxContext) {
        let mut flag = bcs::to_bytes(&str);
        vector::append<u8>( &mut flag, *id.as_bytes());
        let str = FlagString {
            str: str,
            vec: sha3_256(flag),
        };

        
        event::emit(str);
    }
}

