/// Module: task2
module task3::nft_5255b64 {
    use std::string;
    use sui::object::UID;
    use sui::url::{Self,Url};

    public struct NFT_5255b64 has drop{}
    
    // A simple NFT that can be minted by anyone
    public struct MY_NFT has key, store {
        // unique id of the NFT
        id: UID, 
        // name of the NFT
        name: string::String, 
        // description of the NFT
        description: string::String,
        url: Url,
    }

    // create and mint a new NFT
    public entry fun mint(name: vector<u8>, description: vector<u8>, url: vector<u8>, ctx: &mut TxContext) {
        // create the new NFT
        let nft = MY_NFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };
        // mint and send the NFT to the caller
        let sender = tx_context::sender(ctx);
        // transfer the NFT to the caller
        transfer::public_transfer(nft, sender);
    }

    // transfer an NFT to another address
    public entry fun transfer(nft: MY_NFT, recipient: address) {
        transfer::transfer(nft, recipient);
    }
    
    public entry fun burn(nft: MY_NFT) {
        let MY_NFT { id, name: _, description: _, url:_} = nft;

        object::delete(id);
    }
    
    #[test]
    fun test_display(){
        use sui::test_scenario;
        use sui::display;
        use sui::package;

        let mut test = test_scenario::begin(@0x2);
        let pub = package::test_claim(NFT_5255b64 {}, test.ctx());

        // create a new display object
        let mut display = display::new<MY_NFT>(&pub, test.ctx());

        display.add(b"name".to_string(), b"MY_NFT {name}".to_string());
        display.add(b"link".to_string(), b"https://ntf.com/{id}".to_string());
        display.add(b"image_url".to_string(), b"https://ntf.com/{id}.svg".to_string());
        display.add(b"description".to_string(), b"{description}".to_string());

        pub.burn_publisher();
        transfer::public_transfer(display, @0x2);
        test.end();
    }
}
