module faucet_coin::faucet_coin {
  use sui::coin::{Self,Coin,TreasuryCap};
  use sui::transfer;
  use sui::tx_context::{Self,TxContext};

  public struct MY_COIN has drop{}

  fun init(witness:MY_COIN,ctx:&mut TxContext){
    let (transfer,metadata) = sui::create_currency(witness,6,b"NB",b"BULL_COIN",b"this is BULL_COIN",b"",ctx); 
  }
  
}

