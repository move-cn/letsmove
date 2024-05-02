
/// Module: task3
module task3::lbiyou_nft {
    use sui::tx_context::{sender};
    use sui::url;
    use std::string;
    use sui::event;

    public struct LBiyouNFT has key, store {
        id: UID,
        creator: address,
        name: string::String,
        description: string::String,
        url: url::Url,
    }

    public struct LBiyouNFTMinted has copy, drop {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    public struct LBiyouNFTBurnEvent has copy, drop {
        object_id: ID,
    }

    public struct LBiyouNFTTransferEvent has copy, drop {
        object_id: ID,
        from: address,
        to: address,
    }

    public fun name(nft: &LBiyouNFT): &string::String {
        &nft.name
    }

    public fun description(nft: &LBiyouNFT): &string::String {
        &nft.description
    }

    public fun url(nft: &LBiyouNFT): &url::Url {
        &nft.url
    }

    // modify the description of nft
    public entry fun update_description(
        nft: &mut LBiyouNFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

     public entry fun mint_to_sender(name: vector<u8>, description: vector<u8>, url: vector<u8>, ctx: &mut TxContext) {
        // mint nft
        let nft = LBiyouNFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            creator: sender(ctx),
            url: url::new_unsafe_from_bytes(url)
        };

        // send mint event
        event::emit(LBiyouNFTMinted {
            object_id: object::id(&nft),
            creator: sender(ctx),
            name: nft.name,
        });

        // transfer nft to sender
        transfer::public_transfer(nft, sender(ctx));
    }


    public entry fun mint_to_recipient(name: vector<u8>, description: vector<u8>, url: vector<u8>, recipient: address, ctx: &mut TxContext) {
        // mint nft
        let nft = LBiyouNFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            creator: sender(ctx),
            url: url::new_unsafe_from_bytes(url)
        };

        // send mint event
        event::emit(LBiyouNFTMinted {
            object_id: object::id(&nft),
            creator: sender(ctx),
            name: nft.name,
        });

        // transfer nft to recipient
        transfer::public_transfer(nft, recipient);
    }
    public entry fun transfer(
        nft: LBiyouNFT, recipient: address, _: &mut TxContext
    ) {
        event::emit(LBiyouNFTTransferEvent {
            object_id: object::id(&nft), 
            from: tx_context::sender(_),
            to: recipient,
        });
        // transfer nft to recipient
        transfer::public_transfer(nft, recipient)
    }

    public entry fun burn(nft: LBiyouNFT, _: &mut TxContext) {
        let LBiyouNFT { id, name: _, description: _, url: _, creator: _} = nft;
        
        event::emit(LBiyouNFTBurnEvent {
            object_id: object::uid_to_inner(&id),
        });
        object::delete(id)
    }
}
