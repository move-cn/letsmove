
// Module: task3
#[allow(duplicate_alias)]
module task3::task3 {
    use sui::url::{Url, Self};
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{TxContext, Self};

    public struct FirmaNFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

    public struct FirmaNftMintEvent has copy, drop  {
        object_id: ID,
        creator: address,
        name: string::String,
    }


    public fun description(nft: &FirmaNFT): string::String {
        nft.description
    }

    public fun url(nft: &FirmaNFT): Url {
        nft.url
    }
    public struct FirmaNftTransferEvent has copy, drop {
        object_id: ID,
        from: address,
        to: address,
    }

    public struct FirmaNftBurnEvent has copy, drop {
        object_id: ID,
    }

    public fun name(nft: &FirmaNFT): string::String {
        nft.name
    }

    public entry fun mint_nft(
        recipient: address,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = FirmaNFT {
            id: object::new(ctx),
            name: string::utf8(b"FirmaNft"),
            description: string::utf8(b"firma's NFT"),
            url: url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/2088807?v=4"),
        };

        event::emit(FirmaNftMintEvent {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, recipient);
    }

    public entry fun transfer(
        nft: FirmaNFT,
        recipient: address,
        _: &mut TxContext
    ) {
        event::emit(FirmaNftTransferEvent {
            object_id: object::id(&nft),
            from: tx_context::sender(_),
            to: recipient,
        });

        transfer::public_transfer(nft, recipient);
    }

    public entry fun update_description(
        nft: &mut FirmaNFT,
        description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(description);
    }

    public entry fun burn(
        nft: FirmaNFT,
        _: &mut TxContext
    ) {
        let FirmaNFT { id, name: _, description: _, url: _} = nft;

        event::emit(FirmaNftBurnEvent {
            object_id: object::uid_to_inner(&id),
        });

        object::delete(id);
    }
}

