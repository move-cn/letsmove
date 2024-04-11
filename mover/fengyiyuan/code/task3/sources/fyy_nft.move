module task3::fyy_nft {

    use sui::url::{Self, Url};
    use sui::event;
    use std::string;



    public struct FyyNFT has key, store {
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


    public fun name(nft: &FyyNFT): &string::String {
        &nft.name
    }

     public fun description(nft: &FyyNFT): &string::String {
        &nft.description
    }

      public fun url(nft: &FyyNFT): &Url {
        &nft.url
    }


    public entry fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = FyyNFT {
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

    /// 转移NFT给新的所有者
    /// Transfer `nft` to `recipient`
    public entry fun transfer(
        nft: FyyNFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }

    /// 更新NFT的介绍
    /// Update the `description` of `nft` to `new_description`
    public entry fun update_description(
        nft: &mut FyyNFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

    /// 永久删除NFT
    /// Permanently delete `nft`
    public entry fun burn(nft: FyyNFT, _: &mut TxContext) {
        let FyyNFT { id, name: _, description: _, url: _ } = nft;
        object::delete(id)
    }


}

