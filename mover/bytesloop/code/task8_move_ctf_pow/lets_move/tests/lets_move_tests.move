
#[test_only]
module lets_move::lets_move_tests {
    // uncomment this line to import the module
    use sui::bcs;
    use std::hash;
    const EPROOF: u64 = 0;
    const ENotImplemented: u64 = 0;

    #[test]
    fun test_lets_move() {
        let vect: vector<u8> = b"Hola mundo";
        let str: std::string::String = std::string::utf8(vect);
        std::debug::print(&vect); // [debug] 0x486f6c61206d756e646f
        std::debug::print(&str);  // [debug] "Hola mundo"

        // lets_move::getRandomString(@0x8, &mut ctx); // @0x8 = https://testnet.suivision.xyz/object/0x0000000000000000000000000000000000000000000000000000000000000008
        let mut ctx = tx_context::dummy();
        std::debug::print(&ctx); 
    }

    #[test, expected_failure(abort_code = ::lets_move::lets_move_tests::ENotImplemented)]
    fun test_lets_move_fail() {
        abort ENotImplemented
    }
}

