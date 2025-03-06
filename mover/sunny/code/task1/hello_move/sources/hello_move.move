/*
/// Module: hello_move
module hello_move::hello_move;
*/

module hello_move::hello_move {
    use std::string::{Self, String};

    public fun hello_world(): String {
        string::utf8(b"hello world")
    }
}