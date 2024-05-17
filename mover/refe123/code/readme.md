# task1
module hello_move::hello {
    use std::ascii::{String, string};
    use sui::object::{Self,UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct Hello has key{
        id:UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_move = Hello {
            id:object::new(ctx),
            say: string(b"hello refe123"),
        };
        transfer(hello_move, sender(ctx));
    }
}

# task2
mycoin:
module my_coin::refecoin { 
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap}; 
    use sui::transfer; 
    use sui::tx_context::{Self, TxContext};

public struct REFECOIN has drop {}

fun init(witness: REFECOIN, ctx: &mut TxContext) {
    let (treasury_cap, metadata) = coin::create_currency<REFECOIN>(
        witness, 2, 
        b"refe Coin", 
        b"RC", b"", 
        option::none(), 
        ctx);
    transfer::public_freeze_object(metadata);
    transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
}

public entry fun mint(
    treasury_cap: &mut TreasuryCap<REFECOIN>, 
    amount: u64, 
    recipient: address, 
    ctx: &mut TxContext) {
    coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
}

public entry fun burn(
    treasury_cap: &mut TreasuryCap<REFECOIN>, 
    coin: Coin<REFECOIN>) {
    coin::burn(treasury_cap, coin);
}
}

faucet_coin:
module faucet_coin::faucetcoin { 
    use std::option; 
    use sui::coin::{Self, Coin, TreasuryCap}; 
    use sui::transfer; 
    use sui::tx_context::{Self, TxContext};


public struct FAUCETCOIN has drop {}


fun init(witness: FAUCETCOIN, ctx: &mut TxContext) {
    let (treasury_cap, metadata) = coin::create_currency<FAUCETCOIN>(witness, 2, b"refe123 Faucet Coin", b"REFC", b"", option::none(), ctx);
    transfer::public_freeze_object(metadata);
    transfer::public_share_object(treasury_cap)
}


entry fun mint(
    treasury_cap: &mut TreasuryCap<FAUCETCOIN>, amount: u64, recipient: address, ctx: &mut TxContext
) {
    coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
}


public entry fun burn(treasury_cap: &mut TreasuryCap<FAUCETCOIN>, coin: Coin<FAUCETCOIN>) {
    coin::burn(treasury_cap, coin);
}

}
# task3
module my_nft::refenft { 
    use sui::url::{Self, Url}; 
    use std::string; 
    use sui::object::{Self, ID, UID}; 
    use sui::event; 
    use sui::transfer; 
    use sui::tx_context::{Self, TxContext};

public struct REFENFT has key, store {
    id: UID,
    name: string::String,
    description: string::String,
    url: Url,
}

public struct NFTMinted has copy, drop {
    object_id: ID,
    creator: address,
    name: string::String,
}

public fun name(nft: &REFENFT): &string::String {
    &nft.name
}

public fun description(nft: &REFENFT): &string::String {
    &nft.description
}

public fun url(nft: &REFENFT): &Url {
    &nft.url
}

public entry fun mint_to_sender(
    name: vector<u8>,
    description: vector<u8>,
    url: vector<u8>,
    ctx: &mut TxContext
) {
    let sender = tx_context::sender(ctx);
    let nft = REFENFT {
        id: object::new(ctx),
        name: string::utf8(name),
        description: string::utf8(description),
        url: url::new_unsafe_from_bytes(url)
    };

    event::emit(NFTMinted {
        object_id: object::id(&nft),
        creator: sender,
        name: nft.name,
    });

    transfer::public_transfer(nft, sender);
}

public entry fun transfer(
    nft: REFENFT, recipient: address, _: &mut TxContext
) {
    transfer::public_transfer(nft, recipient)
}

public entry fun update_description(
    nft: &mut REFENFT,
    new_description: vector<u8>,
    _: &mut TxContext
) {
    nft.description = string::utf8(new_description)
}

public entry fun burn(nft: REFENFT, _: &mut TxContext) {
    let REFENFT { id, name: _, description: _, url: _ } = nft;
    object::delete(id)
}
}