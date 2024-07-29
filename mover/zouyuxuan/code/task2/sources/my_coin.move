module task2::my_coin{
   
    use sui::coin::{Self,Coin,TreasuryCap};

    // 定义一次性见证
    public struct MY_COIN has drop{}
    
    fun init(otw:MY_COIN,ctx:&mut TxContext){
        let (treasury_cap,metedata) = 
        coin::create_currency<MY_COIN>(otw,8,b"mc",b"Mcoin",b"new coin name mc",option::none(),ctx);
        transfer::public_freeze_object(metedata);
        transfer::public_transfer(treasury_cap,tx_context::sender(ctx))
    }
    public entry fun mint(treasury_cap:& mut TreasuryCap<MY_COIN>,amount:u64,recipient:address,ctx:& mut TxContext){
        coin::mint_and_transfer(treasury_cap,amount,recipient,ctx)
    }
    public entry fun burn(managedCap:&mut TreasuryCap<MY_COIN>,c:Coin<MY_COIN>){
        coin::burn(managedCap,c);
    }
    
}