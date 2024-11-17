/// Module: faucet_coin
module my_faucet_coin::alexwaker_faucet_coin {
    //use std::ascii;
    use sui::coin::{Self, TreasuryCap};
    //use sui::url;

    public struct ALEXWAKER_FAUCET_COIN has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: ALEXWAKER_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            9,
            b"AWF",
            b"AlexWaker_FAUCET_COIN",
            b"alexwaker faucet coin. ",
            option::none(),
            ctx);

        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    public entry fun mint_in_my_module(
        treasury_cap: &mut TreasuryCap<ALEXWAKER_FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
    }
    //testnet:
    //packageid 0x0414a27f58e752e8659c5e86d3b563f39b9e9cd40e15df8eb2e4c8512b86f3ec
    //TreasuryCap objectid  0x72444a11f047f344a12770c1b65cf6ff7592b79a9d45e6b077b1180a6f118575
    //sui client call --package <packageid> --module <modulename> --function mint_in_my_module  --args <treasurycap objectid> <amount> <address to be send>
    
    //mainnet:
    //packageid 0x2adc11d7339def7528121fb6302719cc37e588e4ea2672851efa8180c29037e5
    //TreasuryCap objectid  0xe0c3f2fe67dfb2e47be028a8b3f4e9999c5aaac30adbc2523048d93f3f322622
}
