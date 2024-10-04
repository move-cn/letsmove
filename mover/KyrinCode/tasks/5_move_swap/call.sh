# mainnet
PACKAGE_ID=0x41136239846916254ae2849781d5f74db9bd853aebb092045ac79d10f90fa014

FACTORY=0x8d2cedcb9b3c28eae0f44fca4a70b909e5e01608b1e83bbd5feec42ba7ea37c8
# A
KYRINCODE_COIN_TYPE=0x66adaa020fab967c1617d226a3d868f062aa37bb13ac44deb18f1366f6ec7980::kyrincode_coin::KYRINCODE_COIN
# B
KYRINCODE_FAUCET_COIN_TYPE=0xde2d0d163530740d7587d71d4e9503338c2a7596c221688311a912d33f40bc97::kyrincode_faucet_coin::KYRINCODE_FAUCET_COIN

# # create pool
# # balance: 100000000
# KYRINCODE_COIN=0xa5d00e46301d074309a0c95b8cd74ea990782db9e2aae39d42e4fb76c50889f9
# # balance: 100000000
# KYRINCODE_FAUCET_COIN=0xb7d08e990215a861fe209209a23c6c9d55c3312eb63c96d95f3ee9439080adf5
# sui client call --package $PACKAGE_ID \
#                 --module uniswapV2 \
#                 --function create_pool_with_coins_and_transfer_lp_to_sender \
#                 --type-args $KYRINCODE_COIN_TYPE $KYRINCODE_FAUCET_COIN_TYPE \
#                 --args $FACTORY $KYRINCODE_COIN $KYRINCODE_FAUCET_COIN \
#

# swap kyrincode_coin for kyrincode_faucet_coin
POOL=0x9d24a2bef83e531eb14d9fce977cd2caa7e415ccfc816cb8d305915b33389434
# balance: 100000000
KYRINCODE_COIN=0xab1158865bfa5de3f48ee1c3a7335aab316b910433d230674d82ab2e980b9b2c
MIN_OUT=0
sui client call --package $PACKAGE_ID \
                --module uniswapV2 \
                --function swap_a_for_b_with_coin_and_transfer_to_sender \
                --type-args $KYRINCODE_COIN_TYPE $KYRINCODE_FAUCET_COIN_TYPE \
                --args $POOL $KYRINCODE_COIN $MIN_OUT \
