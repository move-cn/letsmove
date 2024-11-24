#[test_only]
module nft::nft_tests;
// uncomment this line to import the module
use nft::nft;
use sui::test_scenario;
use std::string::utf8;

#[test]
fun test_nft() {
    let mut scenario_val = test_scenario::begin(@0x01);
    let scenario = &mut scenario_val;

    nft::mint(utf8(b"xx"), utf8(b"url"),  scenario.ctx());

    scenario.next_tx(@0x01);
    let nft = scenario.take_from_sender<nft::MyNFT>();
    assert!(nft::get_name(&nft) == utf8(b"xx"), 1);

    scenario.next_tx(@0x03);
    nft::send(nft, @0x02, scenario.ctx());


    scenario.next_tx(@0x02);
    {
        let nft = scenario.take_from_sender<nft::MyNFT>();
        assert!(nft::get_name(&nft) == utf8(b"xx"), 1);

        scenario.return_to_sender(nft);
    };

    scenario_val.end();
}

#[test, expected_failure]
fun test_nft_fail() {
    let mut scenario_val = test_scenario::begin(@0x01);
    let scenario = &mut scenario_val;

    nft::mint(utf8(b"xx"), utf8(b"url"),  scenario.ctx());

    scenario.next_tx(@0x01);
    let nft = scenario.take_from_sender<nft::MyNFT>();
    assert!(nft::get_name(&nft) == utf8(b"xx"), 1);

    scenario.next_tx(@0x03);
    nft::send(nft, @0x02, scenario.ctx());

    // abort
    scenario.next_tx(@0x01);
    {
        let nft = scenario.take_from_sender<nft::MyNFT>();
        assert!(nft::get_name(&nft) == utf8(b"xx"), 1);

        scenario.return_to_sender(nft);
    };

    scenario_val.end();
}