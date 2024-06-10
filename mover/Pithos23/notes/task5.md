## Key info of executing the task5.

# all args.

Task2 packageId:
0x343a6612df28090372bd49824fb5225ba6d2f797380d6da749386cb90de06934

Task5 packageId:
0x41200a189e44151399fc2a74e2f90b9237c439379a0ba23ac44176f382b4e85b

BANK
0x6a3bfc1693e9841d068765605c886997c96556374a5705e680d2061fff89046e

capX:
0x746ffd30ee96481bf9c3dd8b3a30f61c268f045579669a8fd0814545ec82529d

CoinX:

0x292af2705a4c1294352c8d2638079aa22bd3213e8324d7f5b879fbb5de2efc97

holderY:
0xa9fd0160514ca53b8de2543ecdafe7655c5c83022e72b4ad5127aa05dc4f8e98

CoinY:
0x722a777fdc65bb3d192a3bb9cbc246e6e753bb157f2e774817329fc0f3c2bcb9

CoinX2:
0xfe143d703861f878fb8827a1d841d67b3e49c9d672fecaad09f3841c91e28b6c

CoinY2:
0xcd21da12b221aadf55417002410c9853218c72ed116d39e1033a304060cd73f9

## Result
x2y hash:
9w124XCCXNGvUicJnpHoQLwz2wiPj6BHbdLhLH7sUUo7

y2x hash:
7V9MjFHKWDekXFjQEH7i36DDHE6snmm3mswT5JtcEAqQ

# command.

```shell
# create pool
sui client call --package  0x41200a189e44151399fc2a74e2f90b9237c439379a0ba23ac44176f382b4e85b\
                --module Pithos23CoinSwap \
                --function createPoool \
                --gas-budget 10000000 \
                --type-args 0x343a6612df28090372bd49824fb5225ba6d2f797380d6da749386cb90de06934::Pithos23Coin::PITHOS23COIN \
                 0x343a6612df28090372bd49824fb5225ba6d2f797380d6da749386cb90de06934::Pithos23Faucet::PITHOS23FAUCET
```

```shell
# deposit a
sui client call --package  0x41200a189e44151399fc2a74e2f90b9237c439379a0ba23ac44176f382b4e85b\
                --module Pithos23CoinSwap \
                --function depositX \
                --gas-budget 10000000 \
                --type-args 0x343a6612df28090372bd49824fb5225ba6d2f797380d6da749386cb90de06934::Pithos23Coin::PITHOS23COIN\
                 0x343a6612df28090372bd49824fb5225ba6d2f797380d6da749386cb90de06934::Pithos23Faucet::PITHOS23FAUCET\
                --args 0x6a3bfc1693e9841d068765605c886997c96556374a5705e680d2061fff89046e\
                 0x292af2705a4c1294352c8d2638079aa22bd3213e8324d7f5b879fbb5de2efc97
                 
                 # txid:
                 HzHGoJ7vFvUEnD1rEdwdeBwNWHuVTfspDh8LupJtLvN1
```

```shell
# deposit y
sui client call --package  0x41200a189e44151399fc2a74e2f90b9237c439379a0ba23ac44176f382b4e85b\
                --module Pithos23CoinSwap \
                --function depositY \
                --gas-budget 10000000 \
                --type-args 0x343a6612df28090372bd49824fb5225ba6d2f797380d6da749386cb90de06934::Pithos23Coin::PITHOS23COIN\
                 0x343a6612df28090372bd49824fb5225ba6d2f797380d6da749386cb90de06934::Pithos23Faucet::PITHOS23FAUCET\
                --args 0x6a3bfc1693e9841d068765605c886997c96556374a5705e680d2061fff89046e\
                 0x722a777fdc65bb3d192a3bb9cbc246e6e753bb157f2e774817329fc0f3c2bcb9
                 
                 # txid:
                 GR5Y8JDAUtz2nJZbj9vmhsrs7MMBHn49EzVkPUbm2No3
```

TXID:

```shell
# swap X2Y
                
sui client call --package  0x41200a189e44151399fc2a74e2f90b9237c439379a0ba23ac44176f382b4e85b\
                --module Pithos23CoinSwap \
                --function swapX_to_Y \
                --gas-budget 10000000 \
                --type-args 0x343a6612df28090372bd49824fb5225ba6d2f797380d6da749386cb90de06934::Pithos23Coin::PITHOS23COIN\
                 0x343a6612df28090372bd49824fb5225ba6d2f797380d6da749386cb90de06934::Pithos23Faucet::PITHOS23FAUCET\
                --args 0x6a3bfc1693e9841d068765605c886997c96556374a5705e680d2061fff89046e\
                 0xfe143d703861f878fb8827a1d841d67b3e49c9d672fecaad09f3841c91e28b6c
                 
sui client call --package  0x41200a189e44151399fc2a74e2f90b9237c439379a0ba23ac44176f382b4e85b\
                --module Pithos23CoinSwap \
                --function swapY_to_X \
                --gas-budget 10000000 \
                --type-args 0x343a6612df28090372bd49824fb5225ba6d2f797380d6da749386cb90de06934::Pithos23Coin::PITHOS23COIN\
                 0x343a6612df28090372bd49824fb5225ba6d2f797380d6da749386cb90de06934::Pithos23Faucet::PITHOS23FAUCET\
                --args 0x6a3bfc1693e9841d068765605c886997c96556374a5705e680d2061fff89046e\
                 0xcd21da12b221aadf55417002410c9853218c72ed116d39e1033a304060cd73f9
                 

```

```shell
# withdrawY:
sui client call --package  0x41200a189e44151399fc2a74e2f90b9237c439379a0ba23ac44176f382b4e85b\
                --module Pithos23CoinSwap \
                --function withdrawY \
                --gas-budget 10000000 \
                --type-args 0x343a6612df28090372bd49824fb5225ba6d2f797380d6da749386cb90de06934::Pithos23Coin::PITHOS23COIN\
                 0x343a6612df28090372bd49824fb5225ba6d2f797380d6da749386cb90de06934::Pithos23Faucet::PITHOS23FAUCET\
                --args 0x6a3bfc1693e9841d068765605c886997c96556374a5705e680d2061fff89046e\
                 50000000

```

```shell
# mint X
sui client call --package  0x343a6612df28090372bd49824fb5225ba6d2f797380d6da749386cb90de06934\
                --module Pithos23Coin \
                --function mint \
                --gas-budget 100000000 \
                --args 0x746ffd30ee96481bf9c3dd8b3a30f61c268f045579669a8fd0814545ec82529d  \
                       200000000 \
                       0xd19dcf3419253ff759614f63b7026bee4e4cc46b823099f262d1b9a858dc5312
                       
sui client call --package  0x343a6612df28090372bd49824fb5225ba6d2f797380d6da749386cb90de06934\
                --module Pithos23Coin \
                --function mint \
                --gas-budget 100000000 \
                --args 0x746ffd30ee96481bf9c3dd8b3a30f61c268f045579669a8fd0814545ec82529d  \
                       50000000 \
                       0xd19dcf3419253ff759614f63b7026bee4e4cc46b823099f262d1b9a858dc5312
        
# mint Y               
sui client call --package  0x343a6612df28090372bd49824fb5225ba6d2f797380d6da749386cb90de06934\
                --module Pithos23Faucet \
                --function mint \
                --gas-budget 10000000 \
                --args 0xa9fd0160514ca53b8de2543ecdafe7655c5c83022e72b4ad5127aa05dc4f8e98  
```