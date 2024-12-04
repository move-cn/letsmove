module task3::Yunjude_NFT {
    use sui::tx_context::{sender};
    use sui::url;
    use std::string;
    use sui::event;

    public struct YunjudeNFT has key, store {
        id: UID,
        creator: address,
        name: string::String,
        description: string::String,
        url: url::Url,
    }

    public struct YunjudeNFTMinted has copy, drop {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    public struct YunjudeNFTBurnEvent has copy, drop {
        object_id: ID,
    }

    public struct YunjudeNFTTransferEvent has copy, drop {
        object_id: ID,
        from: address,
        to: address,
    }

    public fun name(nft: &YunjudeNFT): &string::String {
        &nft.name
    }

    public fun description(nft: &YunjudeNFT): &string::String {
        &nft.description
    }

    public fun url(nft: &YunjudeNFT): &url::Url {
        &nft.url
    }

    // modify the description of nft
    public entry fun update_description(
        nft: &mut YunjudeNFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

     public entry fun mint_to_sender(name: vector<u8>, description: vector<u8>, url: vector<u8>, ctx: &mut TxContext) {
        // mint nft
        let nft = YunjudeNFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            creator: sender(ctx),
            url: url::new_unsafe_from_bytes(url)
        };

        // send mint event
        event::emit(YunjudeNFTMinted {
            object_id: object::id(&nft),
            creator: sender(ctx),
            name: nft.name,
        });

        // transfer nft to sender
        transfer::public_transfer(nft, sender(ctx));
    }

    public entry fun transfer(
        nft: YunjudeNFT, recipient: address, _: &mut TxContext
    ) {
        event::emit(YunjudeNFTTransferEvent {
            object_id: object::id(&nft),
            from: tx_context::sender(_),
            to: recipient,
        });
        // transfer nft to recipient
        transfer::public_transfer(nft, recipient)
    }

    public entry fun burn(nft: YunjudeNFT, _: &mut TxContext) {
        let YunjudeNFT { id, name: _, description: _, url: _, creator: _} = nft;

        event::emit(YunjudeNFTBurnEvent {
            object_id: object::uid_to_inner(&id),
        });
        object::delete(id)
    }
}