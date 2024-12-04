/*
#[test_only]
module eymeria_swap::eymeria_swap_tests {
    // uncomment this line to import the module
    // use eymeria_swap::eymeria_swap;

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_eymeria_swap() {
        // pass
    }

    #[test, expected_failure(abort_code = ::eymeria_swap::eymeria_swap_tests::ENotImplemented)]
    fun test_eymeria_swap_fail() {
        abort ENotImplemented
    }
}
coinpackage:0x512f7ea553294bae5900f4f3c27e0c3f8dd8f48770e0fb07ce2c9b2b7257f6b9
铸造coina
sui client call --package 0x512f7ea553294bae5900f4f3c27e0c3f8dd8f48770e0fb07ce2c9b2b7257f6b9 --module eymeria_faucet --function mint_in_my_module --args 0xf72a3e0cab483404cb763acb9cee7401ee1bc29229cda4314477b165042d13c5 50 0x37bbf31bd0d44debf2eed760eff87ec1c9a4d102f2d3dba14c3d05b40367c371
铸造coinb
sui client call --package 0x512f7ea553294bae5900f4f3c27e0c3f8dd8f48770e0fb07ce2c9b2b7257f6b9 --module eymeria_coin --function mint_in_my_module --args 0x5dd1aef427177db22b68657cc9755eaa1bf69ac240a9fe4688c747956dbd3381 50 0x37bbf31bd0d44debf2eed760eff87ec1c9a4d102f2d3dba14c3d05b40367c371
创造流动池
sui client call --package $package --module eymeria_swap --function create_pool --type-args $CoinAType $CoinBType

package=0xbe1952478dde49e946f717bf520f1a03af12b897d0671a7f05f9ce700a6e979d
pool hash: CT5JHV7depj91u1CdaWQq2fhfKi5MnUdhmcT3AFkh8aj
pocket:0xa709b47f59be6ac0321c9e3054d3680292324ef7e685166ae6023e4d95b03829
pool id:0xda528e7b60fe7692238c49145458b37cb70e9535a2cea4d7dd43a2412292279c
CoinAType=0x512f7ea553294bae5900f4f3c27e0c3f8dd8f48770e0fb07ce2c9b2b7257f6b9::eymeria_faucet::EYMERIA_FAUCET
CoinBType=0x512f7ea553294bae5900f4f3c27e0c3f8dd8f48770e0fb07ce2c9b2b7257f6b9::eymeria_coin::EYMERIA_COIN
增加流动性：
sui client call --package $package --module eymeria_swap --function add_liquidity --args $pool 0x5b8b7d10713ca5ddffc87a16e79fe9b0201bbc3c8000cfedc5ddeff8a1e6c4f0 0xb17490fae3559836dfcbffc95176896e1ea695415acb96b7b83997498093ea21 $pocket --type-args $CoinAType $CoinBType
lp hash:E7aXmS22o2whGDPAxJtdYogjkPx6xpd8Y89tmc2RPYwD
Lp id:0xb5fc1a65f6e35c679d73edf058fb7a6c70ff322c8732704c14f22ebb89085087
//a swap b
sui client call --package $package --module eymeria_swap --function a_swap_b --args $pool 0x8116ec7a9811b11aa214f914ac5fa1671ac3dbd13080142d1d6cb35f40b5901e --type-args $CoinAType $CoinBType
tx hash:32fhu7ZSJADH6BVU9PWoLQ5oVXiU83DnfiK8jSa4nj3S
b swap a
sui client call --package $package --module eymeria_swap --function b_swap_a --args $pool 0x2b9eecfd4689fada13a272d73aa006c388da401196c567aaf250e36b39d63fb6 --type-args $CoinAType $CoinBType

移除流动性
sui client call --package $package --module eymeria_swap --function remove_liquidity --args $pool $lp  $pocket --type-args $CoinA $CoinB
*/
