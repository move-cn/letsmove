module faucet_coin::faucet_coin{
    use std::option;
    use sui::coin;
    use sui::coin::{mint_and_transfer,TreasuryCap};
    use sui::transfer::{public_share_object,public_freeze_object};
    use sui::tx_context::TxContext;

    //一次性见证者的名字是模块名的大写，如模块名为faucet_coin,则一次性见证者的名字则为FAUCET_COIN。一次性见证者只拥有drop能力
    public struct FAUCET_COIN has drop{}

    fun init (witness:FAUCET_COIN,ctx:&mut TxContext){
        //treasury_cap,faucet_coin分别是指代币的铸币权和代币信息
        //从左往右输入的参数依次是一次性见证者，代币的精度（例如微信最低是分），代币符号,代币名称，代币描述，代币图标的链接，特殊参数（不需要指定）
        let (treasury_cap,faucet_coin) = coin::create_currency(witness,8,b"Helen2022a_faucet",b"Helen2022a_faucet_coin",b"First faucet coin created by Helen2022a", option::none(),ctx);
        
        //使用冻结函数确保faucet_coin的信息不更改
        public_freeze_object(faucet_coin);
        //权限转移，faucet_coin的铸造权通过 public_share_object函数共享给每个人
        public_share_object(treasury_cap);
    }

    public entry fun mint_and_send(treasury_cap:&mut TreasuryCap<FAUCET_COIN>,amount:u64,recipient:address,ctx:&mut TxContext){
        //先铸造再发送
        mint_and_transfer(treasury_cap,amount,recipient,ctx);
    }
}
