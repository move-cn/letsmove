/// Module: task3
module task3::github_medal {
    use sui::url::{Self, Url};
    use std::string;
    use sui::event;

    /// This NFT can be minted by anybody
    public struct GithubMedal has key, store {
        id: UID,
        name: string::String,           // name of the NFT
        email: string::String,          // email of the NFT
        description: string::String,    // description of the NFT
        url: Url,
    }

    // ===== Events =====

    public struct EventMint has copy, drop {
        object_id: ID,
        creator: address,
        name: string::String, // name of the NFT
    }

    // ===== Public view functions =====

    /// Get the NFT's `name`
    public fun name(nft: &GithubMedal): &string::String {
        &nft.name
    }

    /// Get the NFT's `email`
    public fun email(nft: &GithubMedal): &string::String {
        &nft.email
    }

    /// Get the NFT's `description`
    public fun description(nft: &GithubMedal): &string::String {
        &nft.description
    }

    /// Get the NFT's `url`
    public fun url(nft: &GithubMedal): &Url {
        &nft.url
    }

    // ===== Entrypoints =====

    /// Mint a new GithubMedal to sender
    public entry fun mint(
        name: vector<u8>,
        email: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = GithubMedal {
            id: object::new(ctx),
            name: string::utf8(name),
            email: string::utf8(email),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };

        event::emit(EventMint {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }

    /// Set the `email` of `nft` to `new_email`
    public fun set_email(nft: &mut GithubMedal,  new_email: vector<u8>, _: &mut TxContext) {
        nft.email = string::utf8(new_email)
    }

    /// Set the `description` of `nft` to `new_description`
    public fun set_description(nft: &mut GithubMedal,  new_description: vector<u8>, _: &mut TxContext) {
        nft.description = string::utf8(new_description)
    }

    /// Transfer `nft` to `recipient`
    public fun transfer(nft: GithubMedal, recipient: address, _: &mut TxContext) {
        transfer::public_transfer(nft, recipient)
    }

    /// Permanently delete `nft`
    public fun burn(nft: GithubMedal, _: &mut TxContext) {
        let GithubMedal { id, name: _, email: _, description: _, url: _ } = nft;
        object::delete(id)
    }
}


