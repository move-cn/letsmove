module admin::nft {
    use sui::url::{Self, Url};
    use std::string::{Self, String};
    use sui::object::{Self, ID, UID};
    use sui::bcs;
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use std::vector;
    //use std::debug;

    #[test_only]
    use sui::test_scenario;
    #[test_only]
    use sui::test_utils::assert_eq;

    //==============================================================================================
    // Constants
    //==============================================================================================
    const NFT_IMAGE: vector<u8> = b"ipfs://bafybeieshsowcu2h45bija22nblvbmnpu76y3s3vjjwm4sfttm2zekh4fi/1.jpg"; 

    //==============================================================================================
    // Structs 
    //==============================================================================================
    struct Counter has key {
        id: UID,
        //no of minted nft from this contract collection
        minted: u64
    }

    struct HuiSqNFT has key, store {
        id: UID,
        /// Name for the token
        name: String,
        /// Description of the token
        description: String,
        /// URL for the token
        url: Url,
        // TODO: allow custom attributes
    }

    //==============================================================================================
    // Event Structs 
    //==============================================================================================
    struct NFTMinted has copy, drop {
        // The Object ID of the NFT
        object_id: ID,
        // The creator of the NFT
        creator: address,
        // The name of the NFT
        name: String,
        description: String
    }

    //==============================================================================================
    // Init
    //==============================================================================================

    fun init(ctx: &mut TxContext) {
        transfer::share_object(Counter{id: object::new(ctx), minted: 0});
    }

    //==============================================================================================
    // Entry Functions 
    //==============================================================================================

    /// Create a new nft
    public entry fun mint_to_sender(
        name: String,
        description: String,
        counter: &mut Counter,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let desc = string::utf8(b", #");
        let num = num_to_string(counter.minted + 1);        
        string::append(&mut desc, num);
        string::append_utf8(&mut desc, b" of the HuiSqNFT collection");
        string::append(&mut description, desc);
        let nft = HuiSqNFT {
            id: object::new(ctx),
            name,
            description,
            url: url::new_unsafe_from_bytes(NFT_IMAGE)
        };

        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
            description: nft.description
        });
        counter.minted = counter.minted + 1;
        transfer::public_transfer(nft, sender);
    }

    /// Transfer `nft` to `recipient`
    public entry fun transfer(
        nft: HuiSqNFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }

    /// Update the `description` of `nft` to `new_description`
    public entry fun update_description(
        nft: &mut HuiSqNFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

    /// Permanently delete `nft`
    public entry fun burn(nft: HuiSqNFT, _: &mut TxContext) {
        let HuiSqNFT { id, name: _, description: _, url: _ } = nft;
        object::delete(id)
    }

    //==============================================================================================
    // Public View Functions 
    //==============================================================================================

    /// Get the NFT's `name`
    public fun name(nft: &HuiSqNFT): &String {
        &nft.name
    }

    /// Get the NFT's `description`
    public fun description(nft: &HuiSqNFT): &String {
        &nft.description
    }

    /// Get the NFT's `url`
    public fun url(nft: &HuiSqNFT): &Url {
        &nft.url
    }

    //==============================================================================================
    // Helper Functions 
    //==============================================================================================

    fun num_to_string(num: u64): String {
        use std::string;
        let num_vec = vector::empty<u8>();
        if (num == 0) {
            vector::push_back(&mut num_vec, 48);
        } else {
            while (num != 0) {
                let mod = num % 10 + 48;
                vector::push_back(&mut num_vec, (mod as u8));
                num = num / 10;
            };
        };

        vector::reverse(&mut num_vec);
        string::utf8(num_vec)
    }

    //==============================================================================================
    // Tests 
    //==============================================================================================
    #[test]
    fun test_init_success() {
        let module_owner = @0xa;

        let scenario_val = test_scenario::begin(module_owner);
        let scenario = &mut scenario_val;

        {
            init(test_scenario::ctx(scenario));
        };
        let tx = test_scenario::next_tx(scenario, module_owner);
        let expected_events_emitted = 0;
        let expected_created_objects = 1;
        assert_eq(
            test_scenario::num_user_events(&tx), 
            expected_events_emitted
        );
        assert_eq(
            vector::length(&test_scenario::created(&tx)),
            expected_created_objects
        );
        test_scenario::end(scenario_val);
    }

    #[test]
    fun test_mint_nft_success() {
        let module_owner = @0xa;
        
        let scenario_val = test_scenario::begin(module_owner);
        let scenario = &mut scenario_val;

        {
            init(test_scenario::ctx(scenario));
        };
        let tx = test_scenario::next_tx(scenario, module_owner);
        let expected_events_emitted = 0;
        let expected_created_objects = 1;
        assert_eq(
            test_scenario::num_user_events(&tx), 
            expected_events_emitted
        );
        assert_eq(
            vector::length(&test_scenario::created(&tx)),
            expected_created_objects
        );

        let nft_name = string::utf8(b"test_nft_name");
        let nft_description = string::utf8(b"test_nft_description");
        {

            let counter = test_scenario::take_shared<Counter>(scenario);
            
            mint_to_sender(
                nft_name, 
                nft_description, 
                &mut counter,
                test_scenario::ctx(scenario)
            );

            test_scenario::return_shared(counter);
        };
        
        let tx = test_scenario::next_tx(scenario, module_owner);
        let expected_events_emitted = 1;
        let expected_created_objects = 1;
        assert_eq(
            test_scenario::num_user_events(&tx), 
            expected_events_emitted
        );
        assert_eq(
            vector::length(&test_scenario::created(&tx)),
            expected_created_objects
        );

        {
            let nft = test_scenario::take_from_sender<HuiSqNFT>(scenario);

            assert_eq(
                nft.name, 
                nft_name
            );
            // assert_eq(
            //     nft.description, 
            //     string::utf8(nft_description)
            // );
            assert_eq(
                nft.url, 
                url::new_unsafe_from_bytes(NFT_IMAGE)
            );

            test_scenario::return_to_sender(scenario, nft);
        };
        
        test_scenario::end(scenario_val);
    }

}