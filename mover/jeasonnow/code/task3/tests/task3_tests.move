#[test_only]
module task3::task3_tests {
    // uncomment this line to import the module
    // use task3::task3;
    use task3::jeasonnow_nft;
    use std::string::{utf8};
    use sui::test_scenario::{Self, next_tx, ctx};
    use std::debug::print;
    use sui::url;

    const ENftNameError: u64 = 0;
    const ENftImageError: u64 = 1;


    #[test]
    fun test_task3() {
        let addr1 = @0xA;
        let addr2 = @0xB;

        let img_url = b"https://avatars.githubusercontent.com/u/16950207?v=4";

        // print img_url use move language and use println module
        print(&img_url);


        let mut scenario = test_scenario::begin(addr1);
        {
            jeasonnow_nft::test_init(ctx(&mut scenario))
        };
        // test mint
        next_tx(&mut scenario, addr1);
        {
            let mut state = test_scenario::take_shared<jeasonnow_nft::State>(&scenario);
            jeasonnow_nft::mint(
                utf8(b"JeasonNow"),
                utf8(b"JeasonNowNft"),
                img_url,
                &mut state,
                ctx(&mut scenario)
            );
            test_scenario::return_shared<jeasonnow_nft::State>(state);
        };

        // test transfer
        next_tx(&mut scenario, addr1);
        {
            let nft = test_scenario::take_from_address<jeasonnow_nft::JeasonnowNft>(&scenario, addr1);
            let image_url = jeasonnow_nft::image_url(&nft);
            assert!(utf8(b"JeasonNow") == jeasonnow_nft::name(&nft), ENftNameError);
            assert!(url::inner_url(image_url) == img_url.to_ascii_string(), ENftImageError);
            jeasonnow_nft::transfer(nft, addr2, ctx(&mut scenario));
        };

        test_scenario::end(scenario);
    }
}

