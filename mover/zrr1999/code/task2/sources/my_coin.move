module my_coin::my_coin {

    use sui::balance::Supply;
    use sui::balance::{Self};
    use sui::coin::{Self, Coin, TreasuryCap};

    public struct MY_COIN has drop {}

    //can search can't transfer
    public struct MyCoinSupply has key {
        id: UID,
        supply: Supply<MY_COIN>
    }

    fun init(witness: MY_COIN, ctx: &mut TxContext){

        let (treasury_cap, metadata) =
            coin::create_currency<MY_COIN>(witness, 8, b"mc", b"MCoin", b"new coin name mc", option::none(),ctx);

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<MY_COIN>, amount: u64, recipient: address, ctx: &mut TxContext){
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public entry fun burn(managedCap: &mut TreasuryCap<MY_COIN>, c: Coin<MY_COIN>){
        coin::burn(managedCap, c);
    }

}