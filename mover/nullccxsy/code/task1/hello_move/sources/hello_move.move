module hello_move::hello_move {
    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct HelloWorldObject has key, store {
        id: UID,
        text: string::String
    }

    public entry fun mint(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello, nullccxsy")
        };
        transfer::transfer(object, tx_context::sender(ctx));
    }

}

sui client call --function mint --module hello_move --package $0xe34bdcd4e0a8321448236e4d712e8903c1f52d0defede8d9bbc1e2f838aa05f2 --gas-budget 300000000
