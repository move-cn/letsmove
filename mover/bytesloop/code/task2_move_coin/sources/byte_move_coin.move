/// Module: byte_move_coin
module task2_move_coin::byte_move_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Url, Self};

    public struct BYTE_MOVE_COIN has drop {}

    fun init(witness: BYTE_MOVE_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<BYTE_MOVE_COIN>(
            witness, 
            2, 
            b"BMC", //symbol
            b"BMC", //name
            b"byte move coin by bytesloop", //description
            option::some<Url>(url::new_unsafe_from_bytes(b"https://ivory-many-gull-876.mypinata.cloud/ipfs/QmNaaYJe5SFVEtXanV5iQJMwUgPycy4HXQWLqYaCuPA8db")), 
            ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    // 铸造代币
    public entry fun mint(treasury_cap: &mut TreasuryCap<BYTE_MOVE_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    // 销毁代币
    public entry fun burn(treasury_cap: &mut TreasuryCap<BYTE_MOVE_COIN>, coin: Coin<BYTE_MOVE_COIN>) {
        coin::burn(treasury_cap, coin);
    }
}

