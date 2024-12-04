/*
/// Module: task3
*/

module task3::myNFT {
    use std::string::String;
    use sui::event;

    public struct MyNFT has key, store {
        id: UID,
        name: String,
        traits: vector<String>,
        url: String,
    }

    public struct MyNFTMinted has copy, drop {
        id: ID,
        minted_by: address,
    }

    public fun name (nft: &MyNFT) : String {
        nft.name
    }

    public fun traits (nft: &MyNFT): vector<String> {
        nft.traits
    }

    public fun url (nft: &MyNFT): String {
        nft.url
    }

    public fun set_url (nft: &mut MyNFT, url: String) {
        nft.url = url;
    }

    public fun destroy(nft: MyNFT) {
        let MyNFT { id, url: _, name: _, traits: _ } = nft;
        id.delete()
    }

    public fun add_trait(nft: &mut MyNFT, trait: String) {
        nft.traits.push_back(trait);
    }

    public entry fun mint (
        name: String,
        url: String,
        traits: vector<String>,
        ctx:&mut TxContext
    ) {
        let id = object::new(ctx);
        // event: when event emit can record what happend in smart contract
        event::emit(MyNFTMinted {
            id: id.to_inner(),
            minted_by: ctx.sender()
        });
        let nft = MyNFT {id, name, traits, url};
        let sender = tx_context::sender(ctx);
        transfer::public_transfer(nft, sender);
    }

    // add transfer for task3
    public entry fun transfer (nft: MyNFT, receive: address) {
        transfer::public_transfer(nft, receive);
    }
}
