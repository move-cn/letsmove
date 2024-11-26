module task3::my_nft;

use sui::url::{Url, Self};
use std::string;
use sui::object::{Self, ID, UID};
use sui::event;
use sui::transfer;
use sui::tx_context::{TxContext, Self};

public struct FlatflaxNFT has key, store {
    id: UID,
    name: string::String,
    description: string::String,
    url: Url,
}

public struct FlatflaxNFTMintEvent has copy, drop  {
    object_id: ID,
    creator: address,
    name: string::String,
}


public fun description(nft: &FlatflaxNFT): string::String {
    nft.description
}

public fun url(nft: &FlatflaxNFT): Url {
    nft.url
}
public struct FlatflaxNFTTransferEvent has copy, drop {
    object_id: ID,
    from: address,
    to: address,
}

public struct FlatflaxNFTBurnEvent has copy, drop {
    object_id: ID,
}

public fun name(nft: &FlatflaxNFT): string::String {
    nft.name
}

public entry fun mint_nft(
    recipient: address,
    ctx: &mut TxContext
) {
    let sender = tx_context::sender(ctx);
    let nft = FlatflaxNFT {
        id: object::new(ctx),
        name: string::utf8(b"FlatflaxNft"),
        description: string::utf8(b"flatflax's NFT"),
        url: url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/14267118?v=4"),
    };

    event::emit(FlatflaxNFTMintEvent {
        object_id: object::id(&nft),
        creator: sender,
        name: nft.name,
    });

    transfer::public_transfer(nft, recipient);
}

public entry fun transfer(
    nft: FlatflaxNFT,
    recipient: address,
    _: &mut TxContext
) {
    event::emit(FlatflaxNFTTransferEvent {
        object_id: object::id(&nft),
        from: tx_context::sender(_),
        to: recipient,
    });

    transfer::public_transfer(nft, recipient);
}

public entry fun update_description(
    nft: &mut FlatflaxNFT,
    description: vector<u8>,
    _: &mut TxContext
) {
    nft.description = string::utf8(description);
}

public entry fun burn(
    nft: FlatflaxNFT,
    _: &mut TxContext
) {
    let FlatflaxNFT { id, name: _, description: _, url: _} = nft;

    event::emit(FlatflaxNFTBurnEvent {
        object_id: object::uid_to_inner(&id),
    });

    object::delete(id);
}