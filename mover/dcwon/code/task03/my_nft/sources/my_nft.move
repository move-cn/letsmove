/// Module: my_nft
module my_nft::my_nft {
    use sui::url::{Self, Url};
    use std::string::{Self, String};
    use sui::event;

    /// ===== Define NFT =====
    public struct MyNFT has key, store {
        id: UID,
        name: String,
        description: String,
        url: Url,
    }

    // ===== Events =====
    public struct NFTMinted has copy, drop {
        // The Object ID of the NFT
        object_id: ID,
        // The creator of the NFT
        creator: address,
        // The name of the NFT
        name: String,
    }

    public struct NFTBurned has copy, drop {
        // The Object ID of the NFT
        object_id: ID,
        // The destroyer of the NFT
        destroyer: address,
        // The name of the NFT
        name: String,
    }

    // ===== Public view functions =====
    public fun get_name(nft: &MyNFT): &String {
        &nft.name 
    }

    public fun get_description(nft: &MyNFT): &String {
        &nft.description
    }

    public fun get_url(nft: &MyNFT): &Url {
        &nft.url
    }

    // ===== Entrypoints =====
    public fun mint_to_sender(
        name: vector<u8>,
        descriptrion: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = MyNFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(descriptrion),
            url: url::new_unsafe_from_bytes(url)
        };
        // send event
        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name
        });
        // transfer to sender
        transfer::public_transfer(nft, sender);
    }

    public fun burn(nft:MyNFT, ctx: &mut TxContext) {
        let MyNFT{id, name, description: _, url: _} = nft;
        // send event
        event::emit(NFTBurned {
            object_id: object::uid_to_inner(&id),
            destroyer: tx_context::sender(ctx),
            name: name,
        });
        object::delete(id);
    }

    public fun transfer(nft:MyNFT, recipient: address) {
        transfer::public_transfer(nft, recipient);
    }

    public fun update_description(
        nft: &mut MyNFT,
        new_description: vector<u8>
    ) {
        nft.description = string::utf8(new_description);
    }
}

#[test_only]
module my_nft::my_nft_tests {
    // uncomment this line to import the module
    use my_nft::my_nft::{Self, MyNFT};
    use sui::test_scenario as ts;
    use std::string;

    const ENotImplemented: u64 = 0;
    const ENotExpect: u64 = 1;
    const Address1:address = @0x0A;
    const Address2:address = @0x0B;

    #[test]
    fun test_my_nft() {
        // create the NFT
        let mut scenario = ts::begin(Address1);
        let desc1 = b"This is a Test to MyNFT";
        my_nft::mint_to_sender(
            b"TestMyNFT",
            desc1,
            b"https://www.sui.io",
            ts::ctx(&mut scenario)
        );
        // send it from A to B
        ts::next_tx(&mut scenario, Address1);
        let nft = ts::take_from_sender<MyNFT>(&scenario);
        assert!(nft.get_description() == string::utf8(desc1), ENotExpect);
        my_nft::transfer(nft, Address2);
        // update descript In B
        ts::next_tx(&mut scenario, Address2);
        let mut nft = ts::take_from_sender<MyNFT>(&scenario);
        let desc2 = b"This is a Update Test to MyNFT";
        my_nft::update_description(&mut nft, desc2);
        // check descript after update
        assert!(nft.get_description() == string::utf8(desc2), ENotExpect);
        // burn it
        my_nft::burn(nft, ts::ctx(&mut scenario));
        ts::end(scenario);
    }
}
