## 基本信息
- Sui钱包地址: `0x8dc5827a93398f03913f4df834907aa38a8397b31398f63682f44de1fab90d0f`
> 首次参与需要完成第一个任务注册好钱包地址才被合并，并且后续学习奖励会打入这个地址
- github: `vklo1`

## 个人简介
- 对Move感兴趣，想通过Move从web2转型web3

## 任务

##   01 hello move  
- [] package id: 0xb476489aafe02c0af66b86b7beb007e314c029be956b6a2abd377d1e76b79e17

源码
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
- [] Faucet package id : 0x5282b9adaa83a1cd1028ff6e1c83ffcf9c960bcd72b28239d7025e0d7c7917ad
- [] 转账 `My Coin` hash:HSyjmMNYFqLwQmpG8T94gXxeqKL5dQsaBzioMRyqNRWM

My Coin源码
```
module VKLO1::VKLO1 {
    use std::option;
    use sui::coin::{Self,Coin};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::balance::{Self,Supply};
    use sui::object;

    /// The type identifier of coin. The coin will have a type
    /// tag of kind: `Coin<package_object::mycoin::MYCOIN>`
    /// Make sure that the name of the type matches the module's name.
    public struct VKLO1 has drop {}

    public struct SupplyHold has store , key{
        id:object::UID,
        supply:Supply<VKLO1>
    }
    public fun mint(sup: &mut SupplyHold, amount: u64, ctx: &mut TxContext):Coin<VKLO1>{
        let coinbalance=balance::increase_supply(&mut sup.supply,amount);
        coin::from_balance(coinbalance,ctx)
    }
    /// Module initializer is called once on module publish. A treasury
    /// cap is sent to the publisher, who then controls minting and burning
    fun init(witness: VKLO1, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"VKLO1", b"", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        let supply=coin::treasury_into_supply(treasury);
        let supply_hold=SupplyHold{
            id:object::new(ctx),
            supply
        };

        transfer::transfer(supply_hold, tx_context::sender(ctx))
    }

    public entry fun mint_to(sup: &mut SupplyHold, amount: u64, to: address, ctx: &mut TxContext){
        let mycoin=mint(sup,amount,ctx);
        transfer::public_transfer(mycoin,to);
    }
}
```
Faucet源码
```
module VKLO1FAUCET::VKLO1FAUCET {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct VKLO1FAUCET has drop {}

    fun init(witness: VKLO1FAUCET, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<VKLO1FAUCET>(
            witness,
            3,
            b"VKLO1FAUCET",
            b"CA",
            b"learning for VKLO1FAUCET",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap);
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<VKLO1FAUCET>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<VKLO1FAUCET>, coin: Coin<VKLO1FAUCET>) {
        coin::burn(treasury_cap, coin);
    }
```

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
