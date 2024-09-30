module helloworld::hello {

    use sui::event::emit;

    struct Hello has copy,drop {
        hello: vector<u8>,
    }
    
    fun init(ctx: &mut sui::tx_context::TxContext) {
        emit(Hello {
            hello: b"hello",
        })
    }
}