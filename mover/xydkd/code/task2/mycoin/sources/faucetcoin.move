#[allow(unused_use,duplicate_alias)]
module mycoin::faucetcoin {
    use sui::coin;
    use sui::coin::{mint_and_transfer,TreasuryCap};
    use sui::transfer::{public_share_object,public_freeze_object};
    use sui::tx_context::{Self, TxContext};

    public struct FAUCETCOIN has drop {}

    fun init(witness: FAUCETCOIN, ctx: &mut TxContext) {
        let (treasuryf, metadata) =
            coin::create_currency(witness, 6, b"faucetcoin", b"faucetcoin", b"faucetcoin", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasuryf);
    }
    public entry fun mint_to_anyone(trap:&mut TreasuryCap<FAUCETCOIN>,am:u64,recive:address,ctx:&mut TxContext){
       coin::mint_and_transfer(trap,am,recive,ctx);
    } 
}