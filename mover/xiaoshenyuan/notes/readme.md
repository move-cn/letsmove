# 发布项目
sui client publish --gas-budget 200000000 . 

error[E02010]: invalid name
  ┌─ ./sources/hello.move:4:19
  │
4 │     public struct _Object has key, store {
  │                   ^^^^^^^ Invalid struct name '_Object'. Struct names must start with 'A'..'Z'

error[E03004]: unbound type
   ┌─ ./sources/hello.move:10:22
   │
10 │         let object = _Object {
   │                      ^^^^^^^ Unbound type '_Object' in current scope

Failed to build Move modules: Compilation error.

需要换一个类名

## game

sui client publish --gas-budget 40000000

export PACKAGE_ID=0x207f2ab082b865c101527389255cda7b0dc2016c2dd9c21adfa59ef436c43264
export GAME_ID=0xc6908be7ef663ae6c9f594be0576858d551b34a28c50bc7a504976297658df3a
export ADMIN_CAP=0x7cfa9c51e992267a1dd3825486d790508b8ac9a1bc2b7a96df76fad6a5cc10b7 

export FAUCET=0x1410e0c310cc65ba2708bec2fc081660667ee51678b76a3ca7a5e029b6724b29

sui client call --package $PACKAGE_ID --module xiaoshenyuan_game --function get_faucet_coin --args $FAUCET 10000000 --gas-budget 10000000

export FAUCET_COIN=0xa9653adc3eb3ca91e2775521eb76891d3ac3f33b6266270de275e64fdcc689fa    

sui client call --package $PACKAGE_ID --module xiaoshenyuan_game --function deposit --args $GAME_ID  $FAUCET_COIN 5000000 --gas-budget 20000000

Transaction Digest: HrsmKQV9qNkUnqavxLDab7iLUFCyKgEw9MVdAwf2uAGH

export GAME_COIN=0x9133ea5531da48ae6405104f2ae820206a01ff2bd15e3190f45e0e62fb01f7f7  

sui client call --package $PACKAGE_ID --module xiaoshenyuan_game --function play --args $GAME_ID $GAME_COIN 0x6 --gas-budget 100000000

Transaction Digest: 7ttUaQrY7dDup8a8iNnUfgfAeL73Qb63sjqSpTBwtGkB

sui client call --package $PACKAGE_ID --module xiaoshenyuan_game --function withdraw --args $ADMIN_CAP $GAME_ID 2000 --gas-budget 10000000

Transaction Digest: ftLFTVYN8DLHWEe9NemiWWazZ3ZfSffxBGvc1jZf9rs

## swap

ObjectID: 0x389ecbb244fbb599b15829684fdb803571e7cdcbd7261f4484f13efe34cd0692    
0x4d4492d7801a2e5dbe7d97a7a8e3470457d3bce209897c0c5cecdb39925ca570::xiaoshenyuan_coin::XIAOSHENYUAN_COIN
PackageID: 0x4d4492d7801a2e5dbe7d97a7a8e3470457d3bce209897c0c5cecdb39925ca570           

PackageID: 0xbf01d599e92351db4b0192183fe40021d8a84716359efff767100472b978f9e8
ObjectID: 0x1410e0c310cc65ba2708bec2fc081660667ee51678b76a3ca7a5e029b6724b29               
0xbf01d599e92351db4b0192183fe40021d8a84716359efff767100472b978f9e8::xiaoshenyuan_faucet_coin::XIAOSHENYUAN_FAUCET_COIN

0x4d4492d7801a2e5dbe7d97a7a8e3470457d3bce209897c0c5cecdb39925ca570

export COIN_PACKAGE_ID=0x4d4492d7801a2e5dbe7d97a7a8e3470457d3bce209897c0c5cecdb39925ca570

export FAUCET_PACKAGE_ID=0xbf01d599e92351db4b0192183fe40021d8a84716359efff767100472b978f9e8

export COIN_TYPE=0x4d4492d7801a2e5dbe7d97a7a8e3470457d3bce209897c0c5cecdb39925ca570::xiaoshenyuan_coin::XIAOSHENYUAN_COIN
export FAUCET_TYPE=0xbf01d599e92351db4b0192183fe40021d8a84716359efff767100472b978f9e8::xiaoshenyuan_faucet_coin::XIAOSHENYUAN_FAUCET_COIN

export FAUCET_TREA_ID=0x1410e0c310cc65ba2708bec2fc081660667ee51678b76a3ca7a5e029b6724b29

export COIN_TREA_ID=0x389ecbb244fbb599b15829684fdb803571e7cdcbd7261f4484f13efe34cd0692

sui client publish --gas-budget 200000000

export TASK5_PACKAGE_ID=0xf35a298a979eace567237d429313602e563952bec518e5267f00c8073cd5fca4 

export MY_ADDRESS=0x20758996fdf15ac4f57750c501ffe34b8f8d11c8776cdf5155615c94d0ba8b36

sui client call --gas-budget 7500000 --package $COIN_PACKAGE_ID --module xiaoshenyuan_coin --function mint --args $COIN_TREA_ID 1000 $MY_ADDRESS

export COIN_ID_1=0x3c4028564b11e040d969cf7eddea10fb2d925766cd74c82df08b1cc9047f3770  

sui client call --gas-budget 7500000 --package $FAUCET_PACKAGE_ID --module xiaoshenyuan_faucet_coin --function mint --args $FAUCET_TREA_ID 1000 $MY_ADDRESS

export FAUCET_ID_1=0x2634638c49b5fa4af667f79895748adee2c8f278e6d45b7605777a4ba3c6a8e0  

sui client call --gas-budget 7500000 --package $TASK5_PACKAGE_ID --module xiaoshenyuan_swap --function create_pool --type-args $COIN_TYPE $FAUCET_TYPE --args $COIN_ID_1 $FAUCET_ID_1

export POOL_ID=0xd880c851ce281218ea822e549bcad2b208554798956276bdb46c863dd70e511a  

sui client call --gas-budget 7500000 --package $COIN_PACKAGE_ID --module xiaoshenyuan_coin --function mint --args $COIN_TREA_ID 1000 $MY_ADDRESS

export COIN_ID_2=0x6b033400eb39854313bb82610addb3c5e58f6d3700b8427057298f5ec2fc716e        

sui client call --gas-budget 7500000 --package $TASK5_PACKAGE_ID --module xiaoshenyuan_swap --function swap_a_to_b --type-args $COIN_TYPE $FAUCET_TYPE --args $POOL_ID $COIN_ID_2
                                                 
swap coin to faucet:
Transaction Digest: FhttQ11UiJVJJyEBZDeEq5eJLcPqdSiSeN8b2mEdkJnZ

export SWAPED_FAUCET_ID=0x2451834b8bc45d0c94f5ddf8f10d67ba156513a948d128b94ecc354307aef30f           

sui client call --gas-budget 7500000 --package $TASK5_PACKAGE_ID --module xiaoshenyuan_swap --function swap_b_to_a --type-args $COIN_TYPE $FAUCET_TYPE --args $POOL_ID $SWAPED_FAUCET_ID

swap faucet to coin:
Transaction Digest: 5KQ6FmXRnHaks9ASLTzQxZcYXxKfEvihHeKZLRcBtnwC
