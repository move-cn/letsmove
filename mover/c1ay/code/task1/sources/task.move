module task1::task {

    use std::string;
    use sui::tx_context::{TxContext};
    use sui::object::{Self, UID};

    struct Greeting has key, store {
        id: UID,
        message: string::String
    }

	fun init(_ctx:&mut TxContext){
    }

    public fun create_greeting(message: string::String, ctx:&mut TxContext,): Greeting {
        let id = object::new(ctx);
        Greeting{
            id: id,
            message: message
        }
    }

    #[test]
    fun test_create_greeting() {
        let ctx = &mut tx_context::dummy();
        let message = string::utf8(b"Hello, Move!");
        let greeting = create_greeting(message, ctx);
        let Greeting { id, message: msg } = greeting;
        object::delete(id);
        assert!(msg == message, 0);
    }
}