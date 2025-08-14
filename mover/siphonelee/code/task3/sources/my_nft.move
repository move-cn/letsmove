module my_nft::my_nft {
    use sui::tx_context::sender;
    use sui::table::{Table, Self};
    use sui::event;
    use sui::address;
    use std::string;
    use std::string::{utf8, String};
    use sui::package;
    use sui::display;

    const EWrongNameFormat: u64 = 1;
    const EWrongDescriptionFormat: u64 = 2;
    const EWrongUrlFormat: u64 = 3;
    const EPermissionDenied: u64 = 4;
    const ENoSuchNFT: u64 = 5;

    #[test_only]
    const EWrongMinter: u64 = 0x10;
    #[test_only]
    const EInconsistentState: u64 = 0x11;

    public struct MyNFT has key, store {
        id: UID,
        name: String,
        description: String,
        url: String,
    }

    public struct MY_NFT has drop {}

    public struct NFTFaucet has key {
        id: UID,
        minter: u256,
        ntf_to_owner: Table<vector<u8>, u256>,
    }

    public struct NFTMintEvent has copy, drop {
        owner: address,
        nft: address,
    }

    public struct NFTBurnEvent has copy, drop {
        nft: address,
        owner: address,
    }

    fun init(_witness: MY_NFT, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"description"),
            utf8(b"image_url"),
        ];

        let values = vector[
            utf8(b"{name}"),
            utf8(b"{description}"),
            utf8(b"{url}"),
        ];

        let publisher = package::claim(_witness, ctx);
        let mut display = display::new_with_fields<MyNFT>(
            &publisher, keys, values, ctx
        );        
        display::update_version(&mut display);
        transfer::public_transfer(display, sender(ctx));
        transfer::public_transfer(publisher, sender(ctx));

        let nft_faucet = NFTFaucet {
            id: object::new(ctx),
            minter: address::to_u256(sender(ctx)),
            ntf_to_owner: table::new(ctx),
        };
        transfer::share_object(nft_faucet);
    }

    /// only minter can mint NFT
    public entry fun mint(faucet: &mut NFTFaucet, name: vector<u8>, description: vector<u8>, url: vector<u8>, recipient: address, ctx: &mut TxContext) {
        assert!(faucet.minter == address::to_u256(sender(ctx)), EPermissionDenied);

        let mut u_name = string::try_utf8(name);
        let mut u_description = string::try_utf8(description);
        let mut u_url = string::try_utf8(url);

        assert!(u_name.is_some(), EWrongNameFormat);
        assert!(u_description.is_some(), EWrongDescriptionFormat);
        assert!(u_url.is_some(), EWrongUrlFormat);

        let id = object::new(ctx);

        let nft = object::uid_to_bytes(&id);
        faucet.ntf_to_owner.add(nft, address::to_u256(recipient)); 

        event::emit(NFTMintEvent {
            owner: recipient,
            nft: object::uid_to_address(&id),
        });

        let nft = MyNFT {
            id,
            name: u_name.extract(),
            description: u_description.extract(),
            url: u_url.extract(),
        };

        transfer::public_transfer(nft, recipient);
    }

    /// only owner can burn NFT
    public entry fun burn(faucet: &mut NFTFaucet, nft: MyNFT, ctx: &mut TxContext) {
        let nft_id = object::uid_to_bytes(&nft.id);
        assert!(faucet.ntf_to_owner.contains(nft_id), ENoSuchNFT);
        let owner = faucet.ntf_to_owner.borrow(nft_id);
        assert!(owner == address::to_u256(sender(ctx)), EPermissionDenied);

        event::emit(NFTBurnEvent {
            nft: address::from_bytes(nft_id),
            owner: address::from_u256(*owner),
        });

        faucet.ntf_to_owner.remove(nft_id);
        let MyNFT {id, name:_, description:_, url:_} = nft;
        object::delete(id);
    }

    /// only owner can transfer NFT to others
    public entry fun transfer(faucet: &mut NFTFaucet, nft: MyNFT, recipient: address, ctx: &mut TxContext) {
        let nft_id = object::uid_to_bytes(&nft.id);
        assert!(faucet.ntf_to_owner.contains(nft_id), ENoSuchNFT);
        let owner = faucet.ntf_to_owner.borrow(nft_id);
        assert!(owner == address::to_u256(sender(ctx)), EPermissionDenied);
        
        faucet.ntf_to_owner.remove(nft_id);
        faucet.ntf_to_owner.add(nft_id, address::to_u256(recipient)); 

        transfer::public_transfer(nft, recipient);
    }

    #[test_only]
    /// Wrapper of module initializer for testing
    public fun test_init(ctx: &mut TxContext) {
        init(MY_NFT {}, ctx)
    }

    #[test]
    fun test_my_nft_destroy() {
        use sui::test_scenario;
        use sui::test_scenario::{next_tx, ctx};

        let addr1 = @0xA;
        let addr2 = @0xB;
        let _dummy_address = @0xCAFE;

        let mut scenario = test_scenario::begin(addr1);

        {  
            test_init(scenario.ctx());
        };


        next_tx(&mut scenario, addr1);
        {
            let mut faucet = test_scenario::take_shared<NFTFaucet>(&scenario);
            assert!(faucet.minter == address::to_u256(addr1), EWrongMinter);

            mint(&mut faucet, b"test", b"test description", b"http://test.url", addr2, scenario.ctx());
            
            test_scenario::return_shared(faucet);
        };

        next_tx(&mut scenario, addr2);
        {
            let mut faucet = test_scenario::take_shared<NFTFaucet>(&scenario);
            let nft = test_scenario::take_from_sender<MyNFT>(&scenario);

            let nft_id = object::uid_to_bytes(&nft.id);
            assert!(faucet.ntf_to_owner.contains(nft_id), EInconsistentState);

            burn(&mut faucet, nft, scenario.ctx());
            assert!(!faucet.ntf_to_owner.contains(nft_id), EInconsistentState);
            
            test_scenario::return_shared(faucet);
        };

        test_scenario::end(scenario);
    }

    #[test]
    fun test_my_nft_transfer() {
        use sui::test_scenario;
        use sui::test_scenario::{next_tx, ctx};

        let addr1 = @0xA;
        let addr2 = @0xB;
        let dummy_address = @0xCAFE;

        let mut scenario = test_scenario::begin(addr1);

        {  
            test_init(scenario.ctx());
        };


        next_tx(&mut scenario, addr1);
        {
            let mut faucet = test_scenario::take_shared<NFTFaucet>(&scenario);
            assert!(faucet.minter == address::to_u256(addr1), EWrongMinter);

            mint(&mut faucet, b"test", b"test description", b"http://test.url", addr2, scenario.ctx());

            test_scenario::return_shared(faucet);
        };

        next_tx(&mut scenario, addr2);
        {
            let mut faucet = test_scenario::take_shared<NFTFaucet>(&scenario);
            let nft = test_scenario::take_from_sender<MyNFT>(&scenario);

            let nft_id = object::uid_to_bytes(&nft.id);
            assert!(faucet.ntf_to_owner.contains(nft_id), EInconsistentState);
            assert!(faucet.ntf_to_owner.borrow(nft_id) == address::to_u256(addr2), EInconsistentState);

            transfer(&mut faucet, nft, addr1, scenario.ctx());
            
            test_scenario::return_shared(faucet);
        };

        next_tx(&mut scenario, addr1);
        {
            let mut faucet = test_scenario::take_shared<NFTFaucet>(&scenario);
            let nft = test_scenario::take_from_sender<MyNFT>(&scenario);

            let nft_id = object::uid_to_bytes(&nft.id);
            assert!(faucet.ntf_to_owner.contains(nft_id), EInconsistentState);
            assert!(faucet.ntf_to_owner.borrow(nft_id) == address::to_u256(addr1), EInconsistentState);
            
            transfer(&mut faucet, nft, dummy_address, scenario.ctx());
            test_scenario::return_shared(faucet);
        };

        test_scenario::end(scenario);
    }

}