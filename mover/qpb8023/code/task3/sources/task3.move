module task3::qpb8023nft {
    use std::string::String;
    use sui::event;

    public struct QPB8023NFT has key, store {
        id: UID,
   
        name: String,
       
        traits: vector<String>,
       
        url: String,
    }

    public struct QPB8023NFTMinted has copy, drop {
        id: ID,
        minted_by: address,
    }

    public entry fun mint(
        name: String,
        traits: vector<String>,
        url: String,
        ctx: &mut TxContext
    ) {
        let id = object::new(ctx);

        event::emit(QPB8023NFTMinted {
            id: id.to_inner(),
            minted_by: ctx.sender(),
        });

        let nft = QPB8023NFT { id, name, traits, url };
        let sender = tx_context::sender(ctx);
        transfer::public_transfer(nft, sender);
    }

    public fun add_trait(nft: &mut QPB8023NFT, trait: String) {
        nft.traits.push_back(trait);
    }

    public fun set_url(nft: &mut QPB8023NFT, url: String) {
        nft.url = url;
    }

    public fun destroy(nft: QPB8023NFT) {
        let QPB8023NFT { id, url: _, name: _, traits: _ } = nft;
        id.delete()
    }

    public fun name(nft: &QPB8023NFT): String { nft.name }

   
    public fun traits(nft: &QPB8023NFT): &vector<String> { &nft.traits }

  
    public fun url(nft: &QPB8023NFT): String { nft.url }
}
