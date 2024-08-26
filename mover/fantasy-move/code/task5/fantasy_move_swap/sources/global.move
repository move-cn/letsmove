module fantasy_move_swap::global {
    use std::ascii::into_bytes;
    use std::string::{Self, String};
    use std::type_name::{into_string, get};

    use sui::object::{Self, UID, ID};
    use sui::table;
    use sui::transfer;
    use sui::tx_context::{TxContext, sender};

    const ENotAdmin: u64 = 1;

    public struct Global has key{
        id: UID,
        pools: table::Table<String, ID>,
        withdraw_address: address,
        manager_address_1: address,
        manager_address_2: address,
    }

    /// init global config
    fun init(ctx: &mut TxContext){
        let address = sender(ctx);
        let global = Global{
            id: object::new(ctx),
            pools: table::new<String, ID>(ctx),
            withdraw_address: address,
            manager_address_1: address,
            manager_address_2: address
        };

        transfer::share_object(global)
    }

    public fun get_withdraw_address(g: &Global): address {
        g.withdraw_address
    }

    public entry fun set_withdraw_address(g: &mut Global, addr: address, ctx: &mut TxContext) {
        assert!(sender(ctx) == @admin_address, ENotAdmin);
        g.withdraw_address = addr;
    }

    public entry fun set_manager_address_1(g: &mut Global, addr: address, ctx: &mut TxContext) {
        assert!(sender(ctx) == @admin_address, ENotAdmin);
        g.manager_address_1 = addr;
    }

    public entry fun set_manager_address_2(g: &mut Global, addr: address, ctx: &mut TxContext) {
        assert!(sender(ctx) == @admin_address, ENotAdmin);
        g.manager_address_2 = addr;
    }

    public fun get_manager_address(g: &Global): (address, address) {
        (g.manager_address_1, g.manager_address_2)
    }


    public fun exist_pool<X, Y>(g: &Global): bool {
        table::contains(&g.pools, get_pool_name<X, Y>())
    }


    public(package) fun add_pool_flag<X, Y>(g: &mut Global, id: ID) {
        table::add(&mut g.pools, get_pool_name<X, Y>(), id);
    }


    public fun get_pool_name<X, Y>(): String {
        let mut lp_name = string::utf8(b"");
        string::append_utf8(&mut lp_name, into_bytes(into_string(get<X>())));
        string::append_utf8(&mut lp_name, b"-");
        string::append_utf8(&mut lp_name, into_bytes(into_string(get<Y>())));
        lp_name
    }

}
