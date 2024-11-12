/*
/// Module: hellomove
module hellomove::hellomove;
*/
module HelloMove::hellomove {
    use std::string::String;

    entry fun hello_move(): String {
        b"Hello, narnona!".to_string()
    }
}
