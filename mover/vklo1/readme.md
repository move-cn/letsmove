## 基本信息
- Sui钱包地址: `0x8dc5827a93398f03913f4df834907aa38a8397b31398f63682f44de1fab90d0f`
> 首次参与需要完成第一个任务注册好钱包地址才被合并，并且后续学习奖励会打入这个地址
- github: `vklo1`

## 个人简介
- 对Move感兴趣，想通过Move从web2转型web3

## 任务

##   01 hello move  
- [] package id: 0xb476489aafe02c0af66b86b7beb007e314c029be956b6a2abd377d1e76b79e17

- 源码
  ```
  module hello_move::hello {
    use sui::tx_context::{TxContext, sender};
    use sui::transfer;
    use std::string;
    use std::string::String;
    use sui::object;
    use sui::object::UID;
    public struct HelloMove has key,store{
        id: UID,
        hello:String
    }
    
    fun init(ctx:&mut TxContext){
        let hello  = string::utf8(b"Hello vklo1");
        transfer::public_transfer(HelloMove{id:object::new(ctx),hello:hello},sender(ctx));
    }

}
  ```

##   02 move coin
- [] My Coin package id : 0xfd3db8fda2153f0278df1190c99d2f4149d1769ccbfdce0bf22b866bd58579dd
- [] Faucet package id : 0xc26cfb83c268b0ddc956ac5dbcc6471fba7b6ae1463b6f31e670b8ad1c3b79ea
- [] 转账 `My Coin` hash:8Dkd9uc5zd2aj3cnT4i39gqfGnk3x7KPvCZ24TJQRq2T

##   03 move NFT
- [] nft package id :
- [] nft object id : 
- [] 转账 nft  hash:

##   04 Move Game
- [] game package id :
- [] call game hash:

##   05 Move Swap
- [] swap package id :
- [] call swap hash:

##   06 SDK PTB
- [] save hash :
