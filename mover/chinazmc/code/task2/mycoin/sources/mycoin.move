/*
/// Module: mycoin
module mycoin::mycoin;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module mycoin::mycoin {
    use sui::coin::{Self,Coin,TreasuryCap};

    public struct MYCOIN has drop{}
    fun init(witness: MYCOIN,ctx: &mut TxContext){
        let (treasury,metadata) = coin::create_currency<MYCOIN>(
            witness,6,b"zmc",b"zmc coin",b"zmc coin",option::none(),ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury,ctx.sender());
    }

    public fun mint(treasury_cap: &mut TreasuryCap<MYCOIN>,amount:u64,recipient: address,ctx: &mut TxContext){
        coin::mint_and_transfer(treasury_cap,amount,recipient,ctx)
    }
    public fun burn(treasury_cap: &mut TreasuryCap<MYCOIN>,coin: Coin<MYCOIN>) {
        coin::burn(treasury_cap,coin);
    }

    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        init(MYCOIN {}, ctx)
    }
}
// txblock是 27naZXYAjq9FqUVXxTNj8yL4qPe49jw1Gk3wFvopvuvH
//treasury_cap id是 0x2ede94506b75d273b69251f628fbbcaefc8f7fff90aef8d282fc3b4f47184251
// package id 是 0xfd84f883d3f329c2f6000ee378a924ed0c116822918bf78f0d0acdd28d8408d5

//给地址：0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2  发代币的txblock CRqhsbGR63YFKjHuqWNC6ABtRcZjj6qNgzgQryTNBYKi