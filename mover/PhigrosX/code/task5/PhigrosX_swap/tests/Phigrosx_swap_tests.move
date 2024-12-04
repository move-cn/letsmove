
#[test_only]
module Phigrosx_swap::Phigrosx_swap_tests {
    use sui::test_scenario;
    use sui::test_scenario::ctx;
    use Phigrosx_swap::Phigrosx_swap;

    #[test]
    fun test_Phigrosx_swap<PhigrosX_coin, PhigrosX_Faucet_coin>() {
        let addr = @0xA;
        let mut sce = test_scenario::begin(addr); //mut
        {
            //
        };
        test_scenario::end(sce);
    }
}

