module design::item {
    use std::string::String;


    public struct AdminCap has key { id: UID }


    public struct Item has key, store { id: UID, name: String }

    fun init(ctx: &mut TxContext) {
        let my_address =  ctx.sender();

        let addmin_cap = AdminCap {
            id: object::new(ctx)
        };

        transfer::transfer(addmin_cap, my_address);

        let addmin_cap2 = AdminCap {
            id: object::new(ctx)
        };
        transfer::transfer(addmin_cap2, @0x1111);

    }


    //
    public fun create_and_send(
        _: &AdminCap, name: vector<u8>, to: address, ctx: &mut TxContext
    ) {
        transfer::transfer(Item {
            id: object::new(ctx),
            name: name.to_string()
        }, to)
    }
}