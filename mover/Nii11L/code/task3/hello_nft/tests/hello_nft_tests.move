#[test_only]
module hello_nft::hello_nft_tests{
    use sui::test_scenario::{Self};
    use hello_nft::my_nft::{Self, MyNFT};
    use std::ascii;

    #[test]
    fun test_mint_to_sender() {
        let owner = @0xA;
        let mut scenario = test_scenario::begin(owner);

        scenario.next_tx(owner);
        {
            my_nft::mint_to_sender(
                ascii::string(b"My NFT"),
                ascii::string(b"This is my NFT"),
                ascii::string(b"https://example.com/image.png"),
                scenario.ctx(),
            );
        };

        scenario.next_tx(owner);
        {
            assert!(test_scenario::has_most_recent_for_sender<MyNFT>(&scenario), 1);
            let nft = scenario.take_from_sender<MyNFT>();
            assert!(my_nft::name(&nft) == ascii::string(b"My NFT"), 1);
            assert!(my_nft::description(&nft) == ascii::string(b"This is my NFT"), 1);
            assert!(my_nft::image_url(&nft) == ascii::string(b"https://example.com/image.png"), 1);
            test_scenario::return_to_sender(&scenario, nft)
        };

        scenario.end();
    }

    #[test]
    fun test_mint_to_address() {
        let owner = @0xA;
        let minter = @0xB;
        let mut scenario = test_scenario::begin(owner);

        scenario.next_tx(owner);
        {
            my_nft::mint_to_address(
                minter,
                ascii::string(b"My NFT"),
                ascii::string(b"This is my NFT"),
                ascii::string(b"https://example.com/image.png"),
                scenario.ctx(),
            );
        };

        scenario.next_tx(owner);
        {
            assert!(test_scenario::has_most_recent_for_address<MyNFT>( minter), 1);
            let nft = scenario.take_from_address<MyNFT>(minter);
            assert!(my_nft::name(&nft) == ascii::string(b"My NFT"), 1);
            assert!(my_nft::description(&nft) == ascii::string(b"This is my NFT"), 1);
            assert!(my_nft::image_url(&nft) == ascii::string(b"https://example.com/image.png"), 1);
            test_scenario::return_to_address(minter, nft);
        };

        scenario.end();
    }
}