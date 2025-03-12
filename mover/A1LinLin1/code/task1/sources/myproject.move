module 0x0::myproject {
    use sui::object;
    use sui::transfer;
    use sui::tx_context;

    public struct MyObject has key {
        id: object::UID, // 使用完整路径
        value: u64,
    }

    public entry fun create(value: u64, ctx: &mut tx_context::TxContext) {
        let obj = MyObject {
            id: object::new(ctx),
            value
        };
        transfer::transfer(obj, tx_context::sender(ctx));
    }
}
