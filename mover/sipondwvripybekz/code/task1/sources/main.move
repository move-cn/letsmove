module task1::hellomove{
    use std::string;
    use sui::object::{Self,UID};
    use sui::tx_context::{Self,TxContext};
    use sui::transfer;

    struct HelloMoveObject has key,store {
        id: UID,
        text: string::String
    }

    public entry fun mint(ctx:&mut TxContext) {
        let object = HelloMoveObject{
            id: object::new(ctx),
            text: string::utf8(b"Hello Move")
        };
        transfer::transfer(object,tx_context::sender(ctx));
    }
}