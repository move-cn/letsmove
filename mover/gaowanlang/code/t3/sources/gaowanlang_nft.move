module t3::gaowanlang_nft {
    use std::string::{String, utf8};
    use sui::event;
    use sui::object::{ new, delete, uid_to_inner, id};
    use sui::transfer::public_transfer;
    use sui::url::{Url, new_unsafe_from_bytes};

    public struct GaowanlangNFT has key, store {
        id: UID,
        name: String,
        description: String,
        url: Url
    }

    //铸造事件
    public struct GaowanlangNFTMintEvent has copy, drop {
        object_id: ID,
        creator: address,
        name: String,
    }

    //转账事件
    public struct GaowanlangNFTTransferEvent has copy, drop {
        object_id: ID,
        from: address,
        to: address,
    }

    //销毁事件
    public struct GaowanlangNFTBurnEvent has copy, drop {
        object_id: ID,
    }

    public fun name(nft: &GaowanlangNFT): String {
        nft.name
    }

    public fun description(nft: &GaowanlangNFT): String {
        nft.description
    }

    public fun url(nft: &GaowanlangNFT): Url {
        nft.url
    }

    //铸造NFT
    public entry fun mint_nft(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = ctx.sender();
        let nft = GaowanlangNFT {
            id: new(ctx),
            name: utf8(name),
            description: utf8(description),
            url: new_unsafe_from_bytes(url)
        };
        event::emit(GaowanlangNFTMintEvent {
            object_id: id(&nft),
            creator: sender,
            name: nft.name,
        });
        public_transfer(nft, sender)
    }

    //转移NFT
    public entry fun transfer_nft(
        nft: GaowanlangNFT,
        recipient: address,
        ctx: &mut TxContext
    ) {
        event::emit(GaowanlangNFTTransferEvent {
            object_id: id(&nft),
            from: ctx.sender(),
            to: recipient,
        });
        public_transfer(nft, recipient);
    }

    //更新说明
    public entry fun update_description(
        nft: &mut GaowanlangNFT,
        description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = utf8(description);
    }

    //销毁NFT
    public entry fun burn_nft(
        nft: GaowanlangNFT,
        _: &mut TxContext
    ) {
        let GaowanlangNFT { id, name: _, description: _, url: _ } = nft;
        event::emit(GaowanlangNFTBurnEvent {
            object_id: uid_to_inner(&id),
        });
        delete(id);
    }
}
