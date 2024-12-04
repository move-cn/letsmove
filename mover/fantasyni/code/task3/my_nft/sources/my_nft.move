/// Module: my_nft
module my_nft::justin_nft {
    use sui::url::{Self, Url};
    use std::string;
    use sui::event;

    public struct JUSTIN_NFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

    public struct MintNFTEvent has copy, drop {
        object_id: ID,
        creator: address,
        recipient: address,
        name: string::String,
    }

    public entry fun mint_and_transfer(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let nft = JUSTIN_NFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };
        let sender = tx_context::sender(ctx);
        event::emit(MintNFTEvent {
            object_id: object::uid_to_inner(&nft.id),
            creator: sender,
            recipient: recipient,
            name: nft.name,
        });
        transfer::public_transfer(nft, recipient);
    }

    public entry fun update_description(
        nft: &mut JUSTIN_NFT,
        new_description: vector<u8>,
    ) {
        nft.description = string::utf8(new_description)
    }

    public entry fun burn(nft: JUSTIN_NFT) {
        let JUSTIN_NFT { id, name: _, description: _, url: _ } = nft;
        object::delete(id)
    }

    public fun name(nft: &JUSTIN_NFT): &string::String {
        &nft.name
    }

    public fun description(nft: &JUSTIN_NFT): &string::String {
        &nft.description
    }

    public fun url(nft: &JUSTIN_NFT): &Url {
        &nft.url
    }
}

/*
export PACKAGE_ID=0xffde5264e2ab0e36f79d880b3ae72a4b31594743c215ee094832a35cc7ecdcd2
export ADDRESS=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
sui client call --function mint_and_transfer --package $PACKAGE_ID --module justin_nft --args "justin_nft" "hello" "https://avatars.githubusercontent.com/u/1411347" $ADDRESS --gas-budget $GAS_BUDGET
*/