export PackageID=0xdd882763e8e4514bf8bca936cdb954efeb60ee49bd89ede74b1379512e8c1486
# mint lihuazhang_coin
export CoinX="0xc919ec34c71d1a6e1e64759b9ffcb6cccca1d71df9943ae629479dcf5cf052d1::lihuazhang_coin::LIHUAZHANG_COIN"
# lihuazhang_faucet_coin
export CoinY="0x0820453d29a70f37b4555f7e8340c278119a84b8de48d701eaf34e61489246cf::lihuazhang_faucet_coin::LIHUAZHANG_FAUCET_COIN"

# create a pool
export PackageID=0xdd882763e8e4514bf8bca936cdb954efeb60ee49bd89ede74b1379512e8c1486
export CoinX="0xc919ec34c71d1a6e1e64759b9ffcb6cccca1d71df9943ae629479dcf5cf052d1::lihuazhang_coin::LIHUAZHANG_COIN"
export CoinY="0x0820453d29a70f37b4555f7e8340c278119a84b8de48d701eaf34e61489246cf::lihuazhang_faucet_coin::LIHUAZHANG_FAUCET_COIN"
sui client call --function create_pool --module lihuazhang_swap --package $PackageID --type-args $CoinX $CoinY  --gas-budget 300000000

export PoolID=0x5a00f3247944642211ded85dffa6ea13452e63eb77adddbe75bc9423a2045703

# create a pocket
sui client call --function create_pocket --module lihuazhang_swap --package $PackageID  --gas-budget 300000000

export PocketID=0x844eb2c746fb4b5144d5e394d650ce46b78cc7bec66affb33ce2587c4dd804e1

# create a LP
export coinXObjId=0x4eefdecc8e053bc6c9772d3c738264e948a0c845556c72b0d2428b720c23f4f6
export coinYObjId=0x679a1ddc8873008eb9f07cd500ab64b00c098fdcb8c59b3bf8d1e1a15b174671

sui client call --package $PackageID \
                --module lihuazhang_swap \
                --function deposit_totally \
                --gas-budget 300000000 \
                --type-args $CoinX $CoinY \
                --args $PoolID \
                       $coinXObjId \
                       $coinYObjId \
                       $PocketID

export LPID=0x1bfc404258368b670029938c01e6df7becab85828ffc4eb03b8d243bba266fae
# 0xa5ea05fb3c7daf1c63e04b750ac85e416b1acd628c1ca6662ba50c0551613805

sui client call --package $PackageID \
                --module lihuazhang_swap \
                --function swap_x_to_y \
                --gas-budget 300000000 \
                --type-args $CoinX $CoinY \
                --args $PoolID \
                       '["0x728f79bce5f8bb12bcba5553188399fefee70ae082f0d60e6b7dbe1a13d49996"]' \
                       \"15000000000\"

# swap_x_to_y hash [BUc59P2xzaMNGLeTeA5KDJ8KscXDu1wjgshGvH8tUQqD](https://suivision.xyz/txblock/BUc59P2xzaMNGLeTeA5KDJ8KscXDu1wjgshGvH8tUQqD?tab=Overview)

sui client call --package $PackageID \
                --module lihuazhang_swap \
                --function swap_y_to_x \
                --gas-budget 300000000 \
                --type-args $CoinX $CoinY \
                --args $PoolID \
                       '["0x085dd4ddae071b60e49e753216de73bf9f74c8edf5f694dcad660aa84f7e9ca1"]' \
                       \"40000000000\"

# swap_y_to_x hash [G5Cw4RbkdCBDak3BenLgBz7HmSFjcBoyuj6EtZMwdR1S](https://suivision.xyz/txblock/G5Cw4RbkdCBDak3BenLgBz7HmSFjcBoyuj6EtZMwdR1S?tab=Overview)
                       G5Cw4RbkdCBDak3BenLgBz7HmSFjcBoyuj6EtZMwdR1S