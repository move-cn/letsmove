// Copyright (c) Mysten Labs, Inc.
// SPDX-License-Identifier: Apache-2.0

/// A minimalist example to demonstrate how to create an NFT like object on Sui.
module task03::sample_nft {
    use sui::url::{Self, Url};
    use std::string;
    use sui::event;

    /// An example NFT that can be minted by anybody
    public struct SampleNFT has key, store {
        id: UID,
        /// Name for the token
        name: string::String,
        /// Description of the token
        description: string::String,
        /// URL for the token
        url: Url,
    }

    public struct MintNFTEvent has copy, drop {
        // The Object ID of the NFT
        object_id: ID,
        // The creator of the NFT
        creator: address,
        // The name of the NFT
        name: string::String,
    }

    /// Create a new sample_nft
    public entry fun mint(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let nft = SampleNFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };
        let sender = tx_context::sender(ctx);
        event::emit(MintNFTEvent {
            object_id: object::uid_to_inner(&nft.id),
            creator: sender,
            name: nft.name,
        });
        transfer::public_transfer(nft, sender);
    }

    /// Transfer `nft` to `recipient`
    public entry fun transfer(
        nft: SampleNFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }

    /// Update the `description` of `nft` to `new_description`
    public entry fun update_description(
        nft: &mut SampleNFT,
        new_description: vector<u8>,
    ) {
        nft.description = string::utf8(new_description)
    }

    /// Permanently delete `nft`
    public entry fun burn(nft: SampleNFT) {
        let SampleNFT { id, name: _, description: _, url: _ } = nft;
        object::delete(id)
    }

    /// Get the NFT's `name`
    public fun name(nft: &SampleNFT): &string::String {
        &nft.name
    }

    /// Get the NFT's `description`
    public fun description(nft: &SampleNFT): &string::String {
        &nft.description
    }

    /// Get the NFT's `url`
    public fun url(nft: &SampleNFT): &Url {
        &nft.url
    }
}

#[test_only]
module task03::sample_nft_tests {
    use task03::sample_nft::{Self, SampleNFT};
    use sui::test_scenario as ts;
    use std::string;

    #[test]
    fun mint_transfer_update() {
        let addr1 = @0xA;
        let addr2 = @0xB;
        // create the NFT
        let mut scenario = ts::begin(addr1);
        {
            sample_nft::mint(b"test", b"a test", b"https://www.sui.io", ts::ctx(&mut scenario))
        };
        // send it from A to B
        ts::next_tx(&mut scenario, addr1);
        {
            let nft = ts::take_from_sender<SampleNFT>(&scenario);
            transfer::public_transfer(nft, addr2);
        };
        // update its description
        ts::next_tx(&mut scenario, addr2);
        {
            let mut nft = ts::take_from_sender<SampleNFT>(&scenario);
            sample_nft::update_description(&mut nft, b"a new description") ;
            assert!(*string::bytes(sample_nft::description(&nft)) == b"a new description", 0);
            ts::return_to_sender(&scenario, nft);
        };
        // burn it
        ts::next_tx(&mut scenario, addr2);
        {
            let nft = ts::take_from_sender<SampleNFT>(&scenario);
            sample_nft::burn(nft)
        };
        ts::end(scenario);
    }
}
