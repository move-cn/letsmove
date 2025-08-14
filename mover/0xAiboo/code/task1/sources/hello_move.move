module hello_move::hello_move {
    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    public struct HelloMoveGitHubId has key, store {
        id: UID,
        text: string::String
    }

    public entry fun mint(ctx: &mut TxContext) {
        let object = HelloMoveGitHubId{
            id: object::new(ctx),
            text: string::utf8(b"0xAiboo")
        };
        transfer::transfer(object, tx_context::sender(ctx));
    }
}
