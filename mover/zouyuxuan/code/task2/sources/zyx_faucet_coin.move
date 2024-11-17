module task2::zyx_faucet_coin{

    use sui::coin::{Self,Coin,TreasuryCap};
    use sui::url::{Self,Url};

    public struct ZYX_FAUCET_COIN has drop{}

    fun init(otw:ZYX_FAUCET_COIN,ctx: &mut TxContext){
       let(treasury_cap ,metedata) =  coin::create_currency<ZYX_FAUCET_COIN>(
        otw,
            9,
            b"ZYX_FAUCET",
            b"ZYX_FAUCET",
            b"zyx's faucet coin, everyone can access and mutate.",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/33485252?s=400&u=65637567260caf13c84d5df70b2b725d375de5eb&v=4")),
            ctx
       );
       transfer::public_freeze_object(metedata);
       transfer::public_share_object(treasury_cap);

    }
    public  fun mint(treasury_cap: &mut TreasuryCap<ZYX_FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext){
            coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
        }

    public fun burn(
        treasury_cap: &mut TreasuryCap<ZYX_FAUCET_COIN>, 
        coin: Coin<ZYX_FAUCET_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
        
}