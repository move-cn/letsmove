module task2::LBiyou_faucet {

    use sui::tx_context::{sender};
    use sui::coin::{Self, TreasuryCap};
    use sui::balance::{Self, Balance};

    public struct LBIYOU_FAUCET has drop {} 

    public struct Wallet has key {
        id: UID,
        coin: Balance<LBIYOU_FAUCET>
    }

    fun init(other: LBIYOU_FAUCET,  ctx: &mut TxContext){
        let (treasury_cap,metadata) = coin::create_currency(other, 6, 
            b"LBIYOUFAUCET", b"LBIYOUFAUCETCoin",
            b"LBIYOU FAUCET Coin is so useful", option::none(), ctx);

        //freeze the metadata to share immutabale objects
        transfer::public_freeze_object(metadata); 

        // public transfer, everyone can transfer the coin
        transfer::public_transfer(treasury_cap, sender(ctx));

        let wallet = Wallet{
            id: object::new(ctx),
            coin:balance::zero()
        };

        transfer::share_object(wallet)
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<LBIYOU_FAUCET>, 
        wallet:&mut Wallet,
        amount: u64, ctx: &mut TxContext){
        
        let coin = coin::mint(treasury_cap, amount, ctx);
        balance::join(&mut wallet.coin, coin::into_balance(coin));
    }

    public entry fun faucet(wallet: &mut Wallet, amount: u64, ctx: &mut TxContext) {
        let coin = coin::take(&mut wallet.coin, amount, ctx);
        transfer::public_transfer(coin, sender(ctx));
    }
}