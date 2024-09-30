
```shell
# create pool
sui client call --package  0xe6edf5c0916109151aec1924797ae2634564a91db64785a6cf877309b8236050\
                --module CoinSwap \
                --function createPoool \
                --gas-budget 10000000 \
                --type-args 0x9d2ee87ab4daf1d46b699d4b5e4a62e575374114ab94360b3a41a0159655236f::mycoin::MYCOIN 0xc5f287eb7591ae86d0a9342fb86c97c394c50bce0cef611b070abe23676aee28::mycoin::MYCOIN
```

```shell
# deposit a
sui client call --package  0xe6edf5c0916109151aec1924797ae2634564a91db64785a6cf877309b8236050\
                --module CoinSwap \
                --function depositA \
                --gas-budget 10000000 \
                --type-args 0x9d2ee87ab4daf1d46b699d4b5e4a62e575374114ab94360b3a41a0159655236f::mycoin::MYCOIN 0xc5f287eb7591ae86d0a9342fb86c97c394c50bce0cef611b070abe23676aee28::mycoin::MYCOIN \
                --args 0x96167a56be180e87f6740065b2e196a656dd5920fe1378cd18058de50c0ee43b \
                0xc85348e40a5d97fae1cbefbf221f4714c2c7978e573ea87ad6b3c2d5c16ee92f
```

```shell
# swap
sui client call --package  0xe6edf5c0916109151aec1924797ae2634564a91db64785a6cf877309b8236050\
                --module CoinSwap \
                --function swapA2B \
                --gas-budget 10000000 \
                --type-args 0x9d2ee87ab4daf1d46b699d4b5e4a62e575374114ab94360b3a41a0159655236f::mycoin::MYCOIN 0xc5f287eb7591ae86d0a9342fb86c97c394c50bce0cef611b070abe23676aee28::mycoin::MYCOIN \
                --args 0x96167a56be180e87f6740065b2e196a656dd5920fe1378cd18058de50c0ee43b \
                0xc85348e40a5d97fae1cbefbf221f4714c2c7978e573ea87ad6b3c2d5c16ee92f

```



## pool

```shell
# coinA  type, coin_obj_id, coin_cap
0x60f32bd024c9287f0871e5534a1067a20d3bc4006ac601ca047b531ef9c4ea03::mycoin::MYCOIN
0x5de9a6571c5c33124351f2951dcb061696d4bd40fcb86f41df3941924821ea0a
0xf6e4a0a0241b0ba27fa0bf4f72c7c116e76838a16d99ef995d561d0173a6f143

# coinB  type, coin_obj_id, coin_cap
0x3bab6562026ade12be69f4ef378514f9223ff0476ab3d322389a51af22ff51ec::mycoin::MYCOIN
0x8e115f6e595642ebad5e1ac35a6d36dea4619a18a71a5cd2bbdbea9c3bee6785
0x284ae69c782cc62f89de9d8cb6cc14ca645a6b58da77e487f7f04e94ca11664a


pool obj id =  0x9dfb1095a9efea470732cc5edad509a55276650d5aa2acbd8c82bb2c303009be
packge id  0xbaaa252f382c7cc66c15376bfa035a138c3369bcb21c0fada91f325d3c0351c2

```


```shell
# mint 
sui client call --package  0xca5cf766fee82ff53f7c3c1c3180e79dbf46090106c6ea14054c7653f864d5da\
                --module mycoin \
                --function mint \
                 \
                --args 0xf87debd42f8ee2da2d6467bc04477d03ca31093a394788afccc3413865f2ea7d  \
                       100 \
                       0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c
                       
sui client call --package  0xca5cf766fee82ff53f7c3c1c3180e79dbf46090106c6ea14054c7653f864d5da\
                --module faucetcoin \
                --function mint \
                --gas-budget 10000000 \
                --args 0xa3c1718abb1ac00fb1ac128adff5c0824da7f712fa54aec3ecac0a42949a7ac6  
                
                
sui client call --package  0x40de0e713249894ffd47d14d55a32b65b9e38f3f6df94b5e4ef586cd9e20743a\
                --module CoinSwap \
                --function swapA_to_B \
                --gas-budget 10000000 \
                --type-args 0xca5cf766fee82ff53f7c3c1c3180e79dbf46090106c6ea14054c7653f864d5da::mycoin::MYCOIN 0xca5cf766fee82ff53f7c3c1c3180e79dbf46090106c6ea14054c7653f864d5da::faucetcoin::FAUCETCOIN \
                --args 0xe66c4089b31acc96763766a56e9c21cfa1fde617ccc9a723959aee4e4349b06e \
                0x9a97d0b32c9dc6eb0f6a7909b63122728f8dbf4aba532020ddad50c4e31889c3
```


### mainnet


```shell
pool= 0xe66c4089b31acc96763766a56e9c21cfa1fde617ccc9a723959aee4e4349b06e
package id= 0x40de0e713249894ffd47d14d55a32b65b9e38f3f6df94b5e4ef586cd9e20743a
coinA:
0xca5cf766fee82ff53f7c3c1c3180e79dbf46090106c6ea14054c7653f864d5da::mycoin::MYCOIN
0x9a97d0b32c9dc6eb0f6a7909b63122728f8dbf4aba532020ddad50c4e31889c3
0xf87debd42f8ee2da2d6467bc04477d03ca31093a394788afccc3413865f2ea7d

coinB:
0xca5cf766fee82ff53f7c3c1c3180e79dbf46090106c6ea14054c7653f864d5da::faucetcoin::FAUCETCOIN
0x9fe8e65fbccc1512f1cb1e5e5938f4b9c52ebdd0c9050d59f095f79c6aaa4076
0xa3c1718abb1ac00fb1ac128adff5c0824da7f712fa54aec3ecac0a42949a7ac6

```