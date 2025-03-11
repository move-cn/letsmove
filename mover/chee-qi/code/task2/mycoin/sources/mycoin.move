/*
/// Module: mycoin
module mycoin::mycoin;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module mycoin::mycoin{

    // === Imports === 
    use sui::coin::create_currency;
    use sui::url::Url;
    use std::option::{none};
    use sui::transfer::{public_transfer,public_freeze_object};

    // === Errors ===

    // === Constants ===

    // === Structs ===

    public struct MYCOIN has drop{}

    // === Events ===

    // === Method Aliases ===

    // === Public Functions ===

    fun init(witness: MYCOIN, ctx: &mut TxContext){
        let decimals = 6;
        let symbol = b"MYCOIN";
        let name = b"MYCOIN";
        let description = b"chee coin";
        let icon_url = none<Url>();

        let (treasury, metadata) = create_currency<MYCOIN>(
            witness,
            decimals,
            symbol,
            name,
            description,
            icon_url,
            ctx
        );
        public_freeze_object(metadata);
        public_transfer(treasury, ctx.sender());

    }

    // === View Functions ===

    // === Admin Functions ===

    // === Package Functions ==
    // === Private Functions ===

    // === Test Functions ===

    // packageid : 0xa0ea9faac705ed73e02be8499394b4fa9e4a1ae843ccc7fc35f1ebbd275a2b63

    // 分配自己 https://suiscan.xyz/mainnet/account/0xa97451236151a06f8a33d1711d85f0eee5c3c273cd2aaaa28831d4c3b3f16efb/
    // 分配给目标交易 https://suiscan.xyz/mainnet/tx/CH2LguYEF8TdhqwGNDoLSpZM2P3QND1hjLawDn3TonVJ

}
