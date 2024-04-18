module task3::jeasonnow_nft {
    use sui::tx_context::{sender};
    use sui::url;
    use std::string;
    use sui::event;

    public struct JeasonnowNft has key, store {
        id: UID,
        creator: address,
        name: string::String,
        description: string::String,
        url: url::Url,
    }

    public struct JeasonnowNftMinted has copy, drop {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    public fun name(nft: &JeasonnowNft): &string::String {
        &nft.name
    }

    public fun description(nft: &JeasonnowNft): &string::String {
        &nft.description
    }

     public fun url(nft: &JeasonnowNft): &url::Url {
        &nft.url
    }

    public entry fun mint_to_sender(name: vector<u8>, description: vector<u8>, url: vector<u8>, ctx: &mut TxContext) {
        // mint nft
        let nft = JeasonnowNft {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            creator: sender(ctx),
            url: url::new_unsafe_from_bytes(url)
        };

        // send mint event
        event::emit(JeasonnowNftMinted {
            object_id: object::id(&nft),
            creator: sender(ctx),
            name: nft.name,
        });

        // transfer nft to sender
        transfer::public_transfer(nft, sender(ctx));
    }

    public entry fun transfer(
        nft: JeasonnowNft, recipient: address, _: &mut TxContext
    ) {
        // transfer nft to recipient
        transfer::public_transfer(nft, recipient)
    }

    /// Update the `description` of `nft` to `new_description`
    public entry fun update_description(
        nft: &mut JeasonnowNft,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

    /// Permanently delete `nft`
    public entry fun burn(nft: JeasonnowNft, _: &mut TxContext) {
        let JeasonnowNft { id, name: _, description: _, url: _, creator: _} = nft;
        object::delete(id)
    }
}