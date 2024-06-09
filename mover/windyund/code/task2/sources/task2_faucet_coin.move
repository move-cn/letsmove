module mycoin::faucetcoin {
    use std::option;
    use sui::coin;
    use sui::object::{Self, UID};
    use sui::coin::TreasuryCap;
    use sui::transfer;
    use sui::tx_context::{Self,TxContext};

    public struct TreasuryCapHolder has key{
       id: UID,
       treasury: TreasuryCap<FAUCETCOIN>,
    }

   public struct FAUCETCOIN has drop {}


    fun init(witness: FAUCETCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"MYFC", b"MyFaucetCoin", b"My Faucet Coin description", option::none(), ctx);
        let treasury_cap_holder =   TreasuryCapHolder{
            id: object::new(ctx),
            treasury,
        };
        transfer::public_freeze_object(metadata);
        //共享对象，方便其他人铸币
        transfer::share_object(treasury_cap_holder)
    }


    entry fun mint(treasury_cap_holder: &mut TreasuryCapHolder, ctx: &mut TxContext) {
       let treasury_cap = &mut treasury_cap_holder.treasury;
        //每次可以mint 100
       let coins = coin::mint(treasury_cap, 100_000_000, ctx);
       // 发给自己
       transfer::public_transfer(coins,tx_context::sender(ctx))
   }

}