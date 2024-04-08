
module task1::task1 {
    use sui::tx_context::sender;

    public struct Hello has key {
        id: UID
    }

    fun init(ctx: &mut TxContext) {
        transfer::transfer(Hello{
            id: object::new(ctx)
        }, sender(ctx))
    }

}
