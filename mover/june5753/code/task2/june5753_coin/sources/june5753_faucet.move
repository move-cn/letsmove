 /// Module: task2 水龙头
module task2::june5753_faucet  {
    // 依赖
    use sui::tx_context::{sender};
    use sui::coin::{Self,TreasuryCap};
    use sui::balance::{Self, Balance};
    // 结构体
    public struct JUNE5753_FAUCET  has drop {}

     public struct Wallet has key {
         id: UID,
         coin: Balance<JUNE5753_FAUCET>
     }

    // 初始化
    fun init(witness: JUNE5753_FAUCET, ctx:&mut TxContext){
        let (treasury_cap,metadata) = coin::create_currency(
            witness,
            9,
            b"BRF", //代币的名称
            b"june5753Faucet",
            b"June5753 facet is so cool",
            option::none(),ctx);

        //freeze the metadata to share immutabale objects
        transfer::public_freeze_object(metadata);
        // public transfer, everyone can transfer the coin
        transfer::public_transfer(treasury_cap, sender(ctx));
        let wallet = Wallet {
            id : object::new(ctx),
            coin:balance::zero()
        };
        transfer::share_object(wallet)
    }

    // 铸造
    public entry fun mint(treasury_cap: &mut TreasuryCap<JUNE5753_FAUCET>,
                          wallet:&mut Wallet,
                          amount: u64, ctx: &mut TxContext){

        let coin = coin::mint(treasury_cap, amount, ctx);
        balance::join(&mut wallet.coin,coin::into_balance(coin));
    }

     public entry fun faucet(wallet: &mut Wallet, amount: u64, ctx: &mut TxContext) {
         let coin = coin::take(&mut wallet.coin, amount, ctx);
         transfer::public_transfer(coin, sender(ctx));
     }
}

