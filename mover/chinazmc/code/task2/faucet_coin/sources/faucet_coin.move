/*
/// Module: faucet_coin
module faucet_coin::faucet_coin;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module faucet_coin::faucet_coin{
    use sui::coin::{Self, Coin, TreasuryCap};

    public struct FAUCET_COIN has drop{}

    fun init(witness:FAUCET_COIN,ctx:&mut TxContext){
        let(treasury_cap,metadata)=coin::create_currency<FAUCET_COIN>(
            witness,6,b"zmc",b"zmc faucet coin",b"zmc faucet coin",option::none(),ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap);
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<FAUCET_COIN>,
        amount:u64,
        recipient:address,
        ctx:&mut TxContext
    ){
        let coin = coin::mint(treasury_cap,amount,ctx);
        transfer::public_transfer(coin,recipient);
    }
    public entry fun burn(treasury_cap: &mut TreasuryCap<FAUCET_COIN>,coin:Coin<FAUCET_COIN>){
        coin::burn(treasury_cap,coin);
    }

}
//合约发布的txblock 73oZSV4usJDPRJdsnQwY7VBeRLVEhnXuSfcU6cjqymVF
//package id是 0xad326729307cb3d4bd56c23d9620b6d60ef6c2d786c52206a5bd078e7d55ee88
//share treasury_cap 的id是 0xb72e570db3e73b0bf6dda705e4ca7b689857a9cacdf33eaa0f91dad0cd76e42f