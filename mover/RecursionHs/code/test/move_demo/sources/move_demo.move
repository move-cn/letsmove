module move_demo::move_demo {
    use sui::object::UID;
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;

    public struct MD has key, store {
        id: UID,
        name: std::string::String
    }

    public entry fun mint(name: vector<u8>,ctx: &mut TxContext) {
        let md = MD {
            id: object::new(ctx),
            name: std::string::utf8(name)
        };
        transfer::public_transfer(md, ctx.sender());
    }
}