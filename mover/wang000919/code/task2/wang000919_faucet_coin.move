module my_coin::wang000919_faucet_coin{
    use sui::coin::create_currency;
    use std::option::{Self, some, none};
    use sui::transfer::{public_share_object, public_freeze_object};
    use sui::url::{Self, Url};

    public struct WANG000919_FAUCET_COIN has drop{

    }
    
    fun init(wang000919_faucet_coin: WANG000919_FAUCET_COIN, ctx: &mut TxContext) {
      let url = url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/174563322");
      let yes = some<Url>(url);
      let (treasury, coin_metadata) = create_currency(
        wang000919_faucet_coin,
        8,
        b"WANG000919_FAUCET_COIN",
        b"WANG000919_FAUCET_COIN",
        b"This is my fauet coin",
        yes,
        ctx
      );
      public_freeze_object(coin_metadata);
      public_share_object(treasury);
    }
}