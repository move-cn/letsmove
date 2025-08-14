module zeros_swap::global;

use std::ascii::into_bytes;
use std::string::{Self, String};
use std::type_name::{into_string, get};

use sui::object::{Self, UID, ID};
use sui::table;
use sui::transfer;
use sui::tx_context::{TxContext, sender};


public struct Global has key {
    id: UID,
    pools: table::Table<String, ID>,
}

/// init global config
fun init(ctx: &mut TxContext) {
    let global = Global {
        id: object::new(ctx),
        pools: table::new<String, ID>(ctx),
    };
    transfer::share_object(global)
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