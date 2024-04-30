/// Module: byte_faucet_coin
module task2_move_coin::byte_faucet_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Url, Self};

    public struct BYTE_FAUCET_COIN has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: BYTE_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<BYTE_FAUCET_COIN>(
            witness, 
            2, 
            b"BFC", //symbol
            b"BFC", //name
            b"byte faucet coin by bytesloop", //description
            option::some<Url>(url::new_unsafe_from_bytes(b"https://ivory-many-gull-876.mypinata.cloud/ipfs/QmNaaYJe5SFVEtXanV5iQJMwUgPycy4HXQWLqYaCuPA8db")), 
            ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap);
    }

    // 铸造代币
    public entry fun mint(treasury_cap: &mut TreasuryCap<BYTE_FAUCET_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    // 销毁代币
    public entry fun burn(treasury_cap: &mut TreasuryCap<BYTE_FAUCET_COIN>, coin: Coin<BYTE_FAUCET_COIN>) {
        coin::burn(treasury_cap, coin);
    }
}

