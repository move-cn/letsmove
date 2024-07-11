## task 1

module hello_world::hello_world {
    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct HelloWorldObject has key, store {
        id: UID,
        text: string::String,
    }

    public fun mint(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello tzy168")
        };
        transfer::transfer(object, tx_context::sender(ctx));
    }
}


## task2
  ## mycoin
  module my_coin::mycoin { 
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap}; 
    use sui::transfer; 
    use sui::tx_context::{Self, TxContext};

public struct MYCOIN has drop {}

fun init(witness: MYCOIN, ctx: &mut TxContext) {
    let (treasury_cap, metadata) = coin::create_currency<MYCOIN>(
        witness, 2, 
        b"tzy Coin", 
        b"TC", b"", 
        option::none(), 
        ctx);
    transfer::public_freeze_object(metadata);
    transfer::public_transfer(treasury_cap, tx_context::sender(ctx)) //
}

public entry fun mint(
    treasury_cap: &mut TreasuryCap<MYCOIN>, 
    amount: u64, 
    recipient: address, 
    ctx: &mut TxContext) {
    coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
}

public entry fun burn(
    treasury_cap: &mut TreasuryCap<MYCOIN>, 
    coin: Coin<MYCOIN>) {
    coin::burn(treasury_cap, coin);
}
}

  ## faucetcoin
  module faucet_coin::faucetcoin { 
    use std::option; 
    use sui::coin::{Self, Coin, TreasuryCap}; 
    use sui::transfer; 
    use sui::tx_context::{Self, TxContext};


public struct FAUCETCOIN has drop {}


fun init(witness: FAUCETCOIN, ctx: &mut TxContext) {
    let (treasury_cap, metadata) = coin::create_currency<FAUCETCOIN>(witness, 2, b"TzyFaucet Coin", b"TFC", b"", option::none(), ctx);
    transfer::public_freeze_object(metadata);
    transfer::public_share_object(treasury_cap) //
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


## task3
module my_nft::mynft { 
    use sui::url::{Self, Url}; 
    use std::string; 
    use sui::object::{Self, ID, UID}; 
    use sui::event; 
    use sui::transfer; 
    use sui::tx_context::{Self, TxContext};

public struct MyNft has key, store {
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

public fun name(nft: &MyNft): &string::String {
    &nft.name
}

public fun description(nft: &MyNft): &string::String {
    &nft.description
}

public fun url(nft: &MyNft): &Url {
    &nft.url
}

public entry fun mint_to_sender(
    name: vector<u8>,
    description: vector<u8>,
    url: vector<u8>,
    ctx: &mut TxContext
) {
    let sender = tx_context::sender(ctx);
    let nft = MyNft {
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
    nft: MyNft, recipient: address, _: &mut TxContext
) {
    transfer::public_transfer(nft, recipient)
}

public entry fun update_description(
    nft: &mut MyNft,
    new_description: vector<u8>,
    _: &mut TxContext
) {
    nft.description = string::utf8(new_description)
}

public entry fun burn(nft: MyNft, _: &mut TxContext) {
    let MyNft { id, name: _, description: _, url: _ } = nft;
    object::delete(id)
}
}