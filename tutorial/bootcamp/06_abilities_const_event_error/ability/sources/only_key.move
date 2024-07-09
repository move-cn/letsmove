/// Module: ability
module ability::only_key {

    use sui::object;
    use sui::object::UID;
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};


    public struct KeyName has key {
        id: UID,
    }


    public struct OnlyKey has key {
        id: UID,
        age: u8,
    }


    public fun mint(ctx: &mut TxContext) {
        let only = OnlyKey {
            id: object::new(ctx),
            age: 10,
        };

        transfer(only, sender(ctx));
    }


    public fun del(only: OnlyKey, ctx: &mut TxContext) {
        let OnlyKey { id, age } = only;
        object::delete(id);
        let _ = age;
    }

    public fun my_transfer(only: OnlyKey, addr: address) {
        if (only.age > 10) {
            transfer(only, addr);
        }else {
            abort 10u64
        }
    }
}

