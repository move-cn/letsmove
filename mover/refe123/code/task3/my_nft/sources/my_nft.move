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