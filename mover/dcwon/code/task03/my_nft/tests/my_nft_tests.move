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
