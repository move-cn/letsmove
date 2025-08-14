
/// Module: smart_contract_test
module smart_contract_test::smart_contract_test {
    use sui::object::{Self, UID};
    use sui::table::{Self, Table};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct TestObject has key, store {
        id: UID,
        table: Table<address, bool>
    }//sui table栏位的底层是用动态栏位组成的

//下面转移到 来呼叫function的
    public entry fun create (ctx: &mut TxContext){

        let my_table = table::new(ctx);
        table::add(&mut my_table, tx_context::sender(ctx), true);

        let test_object = TestObject{
            id: object::new(ctx),
            table: my_table,
        };
        transfer::transfer(test_object, tx_context::sender(ctx));
    }
}
/*
部署智能合约的专案专属id:
PackageID: 0xcd8894df3fcc4e01899b9bcaca0ac87dfa96ee1f75ed932aad91b2099369a8b5  
如果要对智能合约升级的话，我要怎么知道你是合约的拥有者：
0x8e9674cd8741e4ecddf67318cc001fe0126ea298c24e9000e53a239105303344

dynamic_field:动态栏位:
动态栏objectID: 0xff18bd248e3c2b60508d32ced4668f1cf6e8beb925ec0ea8202042e26ee43633
动态栏所有者id：0xa9f41712728cd5fd4e0bf4fa7138a91aaac747fe837023f40dc17192b6bdbbec
下面转移到 来呼叫function的
0xfcc72d372e86c72187acc6a837c5794a73c9447b0f432d5ea54d7de0b2683b6c

*/
