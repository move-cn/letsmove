module nft_study::nft {
    use sui::object::{Self, UID};
    use sui::tx_context::TxContext;
    use std::string::{Self, String};
    use sui::url::{Self, Url};
    use sui::transfer;

    struct WuKongNFT has key, store {
        id: UID,
        name: String,
        description: String,
        url: Url,
    }

    entry fun mint(name: vector<u8>, description: vector<u8>, url: vector<u8>, recipient: address, ctx: &mut TxContext) {
        let nft = WuKongNFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url),
        };
        transfer::transfer(nft, recipient);
    }
}