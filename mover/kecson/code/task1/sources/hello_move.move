module helloMove::hello {
    // Libraries being used
    use sui::object;
    use sui::object::UID;
    use sui::transfer;
    use sui::tx_context;
    use sui::tx_context::TxContext;

    /// The one of a kind - created in the module initializer.
    struct CreatorCapability has key {
        id: UID
    }

    fun init(ctx: &mut TxContext) {
        let cap = CreatorCapability {
            id: object::new(ctx),
        };
        transfer::transfer(cap, tx_context::sender(ctx))
    }
}