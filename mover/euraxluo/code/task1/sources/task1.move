/// Module: task1
module task1::hello_world {
    use std::string;
    use sui::event::emit;
    public struct HelloWorldObject has key, store{
        id: UID,
        text: string::String
    }

    public struct NewHelloWorld has copy, drop {
        id: ID,
    }

    #[lint_allow(self_transfer)]
    public entry fun mint(ctx: &mut TxContext) {
        let id = object::new(ctx);
        let emit_id = object::uid_to_inner(&id);
        let object = HelloWorldObject {
            id: id,
            text: string::utf8(b"Hello Euraxluo!")
        };
        emit(NewHelloWorld {
            id: emit_id,
        });
        
        transfer::public_transfer(object, tx_context::sender(ctx));
    }
}

