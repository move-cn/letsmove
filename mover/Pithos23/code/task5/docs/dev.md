

```shell
# create pool
sui client call --package  0x484015a26efba1067cccabd9f19f815c1d4dc7aba06e8a0ec58a9dfb799db34f\
                --module Pithos23CoinSwap \
                --function createPoool \
                --gas-budget 10000000 \
                --type-args 0x37069dd83e90896c26ff3df91f9a68173346b5ef758030885122c3a94b4d4529::Pithos23Coin::PITHOS23COIN 0x37069dd83e90896c26ff3df91f9a68173346b5ef758030885122c3a94b4d4529::Pithos23Faucet::PITHOS23FAUCET
```

```shell
# deposit a
sui client call --package  0x484015a26efba1067cccabd9f19f815c1d4dc7aba06e8a0ec58a9dfb799db34f\
                --module Pithos23CoinSwap \
                --function depositX \
                --gas-budget 10000000 \
                --type-args 0x37069dd83e90896c26ff3df91f9a68173346b5ef758030885122c3a94b4d4529::Pithos23Coin::PITHOS23COIN\
                 0x37069dd83e90896c26ff3df91f9a68173346b5ef758030885122c3a94b4d4529::Pithos23Faucet::PITHOS23FAUCET\
                --args 0xc2b0d605f2e535f24223c0194f22411e9d75c259580c6aa0195602b7a57faf2a\
                 0x710659f0014715dbda046d22d6789bd5edb0fdc4e6c1fcc381bfbc51a85fb1c6
```



```shell
# deposit y
sui client call --package  0x484015a26efba1067cccabd9f19f815c1d4dc7aba06e8a0ec58a9dfb799db34f\
                --module Pithos23CoinSwap \
                --function depositY \
                --gas-budget 10000000 \
                --type-args 0x37069dd83e90896c26ff3df91f9a68173346b5ef758030885122c3a94b4d4529::Pithos23Coin::PITHOS23COIN\
                 0x37069dd83e90896c26ff3df91f9a68173346b5ef758030885122c3a94b4d4529::Pithos23Faucet::PITHOS23FAUCET\
                --args 0xc2b0d605f2e535f24223c0194f22411e9d75c259580c6aa0195602b7a57faf2a\
                 0xc7066c205e6031c38dc61703766a77a484d3a81a5c2869d19fe80754b2e47a98
```
TXID:
8PvudMLmDJy1r4r3zbKKQpF85vYNEZY9LcduaGySKqkW
# 

BANK
0xc2b0d605f2e535f24223c0194f22411e9d75c259580c6aa0195602b7a57faf2a

capX:
0x0eec11b3b5816174676a1ef3bb3e5b132bb9cbc2adb00cd902c8a52d76fe3090

CoinX:
0x710659f0014715dbda046d22d6789bd5edb0fdc4e6c1fcc381bfbc51a85fb1c6

holderY:
0xdeb1c057502194b1a63c86bd0d94d51a8a4280ff87e1a31a36e63d4459fced11

CoinY:
0xc7066c205e6031c38dc61703766a77a484d3a81a5c2869d19fe80754b2e47a98


CoinX2:
0x380fe1cc5c2434983d71e5c912e1aa0f656653c76a47665fce2c4938b9617ab5

CoinY2:
0x239bb21698f073fb3b2ffc740aa07b531028cbfa9dc4cb63067665ace738fa5c


```shell
# swap X2Y
                
sui client call --package  0x484015a26efba1067cccabd9f19f815c1d4dc7aba06e8a0ec58a9dfb799db34f\
                --module Pithos23CoinSwap \
                --function swapX_to_Y \
                --gas-budget 10000000 \
                --type-args 0x37069dd83e90896c26ff3df91f9a68173346b5ef758030885122c3a94b4d4529::Pithos23Coin::PITHOS23COIN\
                 0x37069dd83e90896c26ff3df91f9a68173346b5ef758030885122c3a94b4d4529::Pithos23Faucet::PITHOS23FAUCET\
                --args 0xc2b0d605f2e535f24223c0194f22411e9d75c259580c6aa0195602b7a57faf2a\
                 0x380fe1cc5c2434983d71e5c912e1aa0f656653c76a47665fce2c4938b9617ab5

```
```shell
# withdrawY:
sui client call --package  0x484015a26efba1067cccabd9f19f815c1d4dc7aba06e8a0ec58a9dfb799db34f\
                --module Pithos23CoinSwap \
                --function withdrawY \
                --gas-budget 10000000 \
                --type-args 0x37069dd83e90896c26ff3df91f9a68173346b5ef758030885122c3a94b4d4529::Pithos23Coin::PITHOS23COIN\
                 0x37069dd83e90896c26ff3df91f9a68173346b5ef758030885122c3a94b4d4529::Pithos23Faucet::PITHOS23FAUCET\
                --args 0xc2b0d605f2e535f24223c0194f22411e9d75c259580c6aa0195602b7a57faf2a\
                 50000000

```


```shell
# mint 
sui client call --package  0x37069dd83e90896c26ff3df91f9a68173346b5ef758030885122c3a94b4d4529\
                --module Pithos23Coin \
                --function mint \
                --gas-budget 100000000 \
                --args 0x0eec11b3b5816174676a1ef3bb3e5b132bb9cbc2adb00cd902c8a52d76fe3090  \
                       100000000 \
                       0xd19dcf3419253ff759614f63b7026bee4e4cc46b823099f262d1b9a858dc5312
                       
sui client call --package  0x37069dd83e90896c26ff3df91f9a68173346b5ef758030885122c3a94b4d4529\
                --module Pithos23Faucet \
                --function mint \
                --gas-budget 10000000 \
                --args 0xdeb1c057502194b1a63c86bd0d94d51a8a4280ff87e1a31a36e63d4459fced11  
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