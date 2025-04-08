module SuiNFTProject::nft_module {



public struct NFT has key, store {
        id: UID,
        name: vector<u8>,
        description: vector<u8>,
        image_url: vector<u8>
    }

public entry fun mint_nft(
        name: vector<u8>,
        description: vector<u8>,
        image_url: vector<u8>,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let nft = NFT {
            id: object::new(ctx),
            name:name,
            description:description,
            image_url:image_url
        };
        transfer::transfer(nft, recipient);
    }
}
