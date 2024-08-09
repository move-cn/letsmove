module faucet_coin::faucet_coin {
  use sui::coin::{Self,Coin,TreasuryCap};
  use sui::transfer;
  use sui::tx_context::{Self,TxContext};
  use sui::url::new_unsafe_from_bytes;

  public struct FAUCET_COIN has drop{}

  fun init(witness:FAUCET_COIN,ctx:&mut TxContext){
    let (treasury,metadata) = coin::create_currency(
      witness,
      6,
      b"NB",
      b"BULL_COIN",
      b"this is BULL_COIN",
      option::some(new_unsafe_from_bytes(b"https://github.com/reainbow/letsmove/blob/main/mover/rainbow/images/nb.png")),
      ctx
    ); 
    transfer::public_freeze_object(metadata);
    transfer::public_share_object(treasury);
  }

  //铸造coin
  public fun mint(treasury_cap:&mut TreasuryCap<FAUCET_COIN>,amount:u64,recipient:address,ctx:&mut TxContext){
    coin::mint_and_transfer(treasury_cap,amount,recipient,ctx);
  }

  //销毁coin
  public fun burn(treasury_cap:&mut TreasuryCap<FAUCET_COIN>,coin:Coin<FAUCET_COIN>){
    coin::burn(treasury_cap,coin);
  }
  
}

