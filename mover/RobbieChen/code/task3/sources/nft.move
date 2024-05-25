module task3::nft{
    use std::string;
    use sui::event;
    use sui::object;
    use sui::object::{UID, ID};
    use sui::transfer;
    use sui::tx_context;
    use sui::tx_context::TxContext;
    use sui::url;
    use sui::url::Url;

    public struct NFT has key, store{
        id: UID,
        name: string::String,
        description: string::String,
        url: Url
    }

    public struct NFTMintedEvent has drop, copy{
        object_id: ID,
        creator: address,
        name: string::String
    }

    public struct SimpleNftTransferEvent has copy, drop {
        object_id: ID,
        from: address,
        to: address,
    }

    fun init(ctx: &mut TxContext){
        let sender = tx_context::sender(ctx);
        let name = b"RBNFT";
        let description = b"task3_RBNFT";
        let url = b"https://picx.zhimg.com/70/v2-02f89d05a781ffed9fd2e32654d93135_1440w.avis?source=172ae18b&biz_tag=Post";
        let nft = NFT{
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };

        event::emit(NFTMintedEvent{
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name
        });

        transfer::public_transfer(nft, sender);
    }

   entry public fun transferNFT(nft:NFT, recipient: address, _: &mut TxContext){

        event::emit(SimpleNftTransferEvent{
            object_id: object::id(&nft),
            from: tx_context::sender(_),
            to: recipient
        });
        transfer::public_transfer(nft, recipient);
    }
}