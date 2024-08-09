/// Module: faucet_coin
module task02::faucet_coin {
    //use std::option;
    use sui::coin::{Self,Coin,TreasuryCap};
    //use sui::transfer;
    //use sui::tx_context::{Self,TxContext};
    
    //结构体 代币类型  FAUCET_COIN
    public struct FAUCET_COIN has drop {}

 /*
    public struct MySupply has key, store {
        id: UID,
        supply: balance::Supply<FAUCET_COIN>
    }

 */  
    //初始化函数 实现：铸造 权限分配
    //一次性见证 协议层规范：和模块名相关，大写
    #[allow(lint(share_owned))]
    fun init(waitness: FAUCET_COIN, ctx: &mut sui::tx_context::TxContext) {
        let (treasuryCap, meta) = coin::create_currency( //国库权限 元数据
        //代币基础数据

            waitness,
            9, 
            b"FAUCET_COIN",//符号
            b"FC", //名称
            b"faucet coin",//描述
            option::none(),
            ctx
            );
        transfer::public_freeze_object(meta);  //冻结，只能读不能改
        //transfer::public_transfer(treasuryCap, tx_context::sender(ctx));
        //public_transfer 独享 mint权限 public_share_object 共享 mint权限
        transfer::public_share_object(treasuryCap);
    }
    
    //铸造 四个函数： 国库权限  数量  给谁铸造
    public entry fun mint(treasuryCap: &mut TreasuryCap<FAUCET_COIN>, value: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasuryCap, value, recipient, ctx);
    }

    public entry fun burn(treasuryCap: &mut TreasuryCap<FAUCET_COIN>, coin : Coin<FAUCET_COIN>, _ctx: &mut TxContext) {
        coin::burn(treasuryCap, coin);
    }
}
