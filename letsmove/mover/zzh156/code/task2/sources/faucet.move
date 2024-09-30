module task2::zzh156_FAUCET{
    use sui::coin::{Self,Coin,TreasuryCap};
    public struct ZZH156_FAUCET has drop{

    }

    fun init(witness:ZZH156_FAUCET,ctx: &mut TxContext){
      let (treasure_cap,metadata) = coin::create_currency<ZZH156_FAUCET>(
        witness,
        7,
        b"zzh156_FAUCET",
        b"zzh156_FAUCET",
        b"",
        option::none(),
        ctx
      );
      transfer::public_freeze_object(metadata);
      transfer::public_share_object(treasure_cap);
    }

    public entry fun mint(
        treasure_cap:&mut TreasuryCap<ZZH156_FAUCET>,amount:u64,ctx:&mut TxContext
    ){
        let coin = coin::mint<ZZH156_FAUCET>(treasure_cap,amount,ctx);
        transfer::public_transfer(coin,tx_context::sender(ctx));
    }
    public fun burn(treasure_cap:&mut TreasuryCap<ZZH156_FAUCET>,coin:Coin<ZZH156_FAUCET>){
        coin::burn(treasure_cap,coin);
    }

}