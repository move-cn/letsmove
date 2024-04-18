#[test_only]
module move_nft::move_nft_tests {
    // uncomment this line to import the module
    use move_nft::move_nft::mint;
    use move_nft::move_nft::transfer;
    use move_nft::move_nft::JiuCaiNFT;
    use move_nft::move_nft;
    use sui::url;
    use sui::test_scenario;
    use std::debug;
    use sui::display::Display;

    #[test]
    fun test_move_nft() {
        let initial_owner = @0xCAFE;
        let recipient = @0xCAFEBABE;
        let mut scenario = test_scenario::begin(initial_owner);
        {
            move_nft::test_init(scenario.ctx());
        };
        scenario.next_tx(initial_owner);
        {
            let mut _ctx = test_scenario::ctx(&mut scenario);
            let _url = b"https://avatars.githubusercontent.com/u/49402277?v=4";
            let _name = b"jiucai".to_string();
            let _traits = b"one".to_string();
            // let _url = url::new_unsafe(url_str);
            mint(_name,_traits,_url,_ctx);
        };
        scenario.next_tx(initial_owner);
        {
            let mut _nft = test_scenario::take_from_sender<JiuCaiNFT>(&scenario);
            debug::print(&_nft);
            transfer(_nft,recipient,scenario.ctx());
        };

        scenario.end();
    }

}

