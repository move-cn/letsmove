
module halo_world::wureny_halo_world {
    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct Wureny_HaloWorldObject has key,store {
        id : UID,
        msg : string::String
    }

    public fun mint(ctx: &mut TxContext) {
        let obj = Wureny_HaloWorldObject {
            id: object::new(ctx),
            msg: string::utf8(b"halo world")
        };
        transfer::public_transfer(obj, tx_context::sender(ctx));
    }
}