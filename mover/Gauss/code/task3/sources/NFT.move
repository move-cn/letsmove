module task3::NFT {

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

    public struct NFTMinted has drop, copy{
        object_id: ID,
        creator: address,
        name: string::String
    }

    entry  public fun mint_NFT(ctx: &mut TxContext){
        let sender = tx_context::sender(ctx);
        let name = b"ShallWeKissForeverNFT";
        let description = b"task3 NFT";
        let url = b"https://s21.ax1x.com/2024/04/23/pk97xY9.jpg";
        let nft = NFT{
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };

        event::emit(NFTMinted{
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name
        });

        transfer::public_transfer(nft, sender);
    }

   entry public fun transferNFT(nft: NFT, recipient: address, _: &mut TxContext){
        transfer::public_transfer(nft, recipient);
    }

}