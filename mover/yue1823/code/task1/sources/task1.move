/*
/// Module: task1
module task1::task1;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module sui::task1{
    use sui::object::{Self, UID};
    use sui::tx_context::{TxContext, fresh_object_address};

    // Use this dependency to get a type wrapper for UTF-8 strings
    use std::string::{Self, String};
    use sui::address;

    public  struct Hello has key ,store{
        id:UID,
        message:String
    }


    public entry fun hello_world(ctx:&mut TxContext){

        let new = Hello{
            id:object::new(ctx),
            message:string::utf8(b"hello world")
        };
       transfer::transfer(new,fresh_object_address(ctx))

    }
}
