#[test_only]
module move_nft::move_nft_tests {
    use move_nft::move_nft::mint;
    use move_nft::move_nft::transfer;
    use move_nft::move_nft::IRurlNFT;
    use move_nft::move_nft;
    use sui::url;
    use sui::test_scenario;
    use std::debug;
    use sui::display::Display;

    #[test]
    fun test_move_nft() {
        let initial_owner = @0xc838b31b3a3865a5df8d682e9f6d767aad91acc438ee05699cfa71e37db82a6a;
        let recipient = @0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2;
        let mut scenario = test_scenario::begin(initial_owner);
        {
            move_nft::test_init(scenario.ctx());
        };
        scenario.next_tx(initial_owner);
        {
            let mut _ctx = test_scenario::ctx(&mut scenario);
            let _url = b"https://avatars.githubusercontent.com/u/103364468?v=4";
            let _name = b"iRurl".to_string();
            let _traits = b"first".to_string();
            mint(_name,_traits,_url,_ctx);
        };
        scenario.next_tx(initial_owner);
        {
            let mut _nft = test_scenario::take_from_sender<IRurlNFT>(&scenario);
            debug::print(&_nft);
            transfer(_nft,recipient,scenario.ctx());
        };

        scenario.end();
    }

}

