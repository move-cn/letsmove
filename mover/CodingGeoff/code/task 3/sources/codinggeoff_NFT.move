module task3::CodingGeoff_NFT {
    use std::string;
    use sui::event;
    use sui::url::Url;
    use sui::url;
    public struct CODINGGEOFF_NFT has key, store{
        id: UID,
        name: string::String,
        description: string::String,
        image_url: Url
    }

    public struct Mint_NFT has drop, copy{
        object_id: ID,
        creator: address,
        name: string::String
    }

    public entry fun mint_NFT(ctx: &mut TxContext) {
        let nft = CODINGGEOFF_NFT {
            id: object::new(ctx),
            name: string::utf8(b"CodingGeoff_NFT"),
            description: string::utf8(b"CodingGeoff_NFT is awesome"),
            image_url: url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/120384385?v=4")
        };
        event::emit(Mint_NFT {
            object_id: object::id(&nft),
            creator: tx_context::sender(ctx),
            name: nft.name
        });
        transfer::public_transfer(nft, tx_context::sender(ctx));
    }
    public entry fun transfer_NFT(nft: CODINGGEOFF_NFT, recipient: address, _: &mut TxContext){
        transfer::public_transfer(nft, recipient);
}}
