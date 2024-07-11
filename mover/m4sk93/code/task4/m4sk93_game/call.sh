#!/bin/bash


#sui client publish --skip-dependency-verification
PackageID=0xa8dee2dce7c9fb78b88f05c0b4137bc26ac55e4e906779071416721c47622b4c
Game=0x1e1432f1a0157b96ced2d8e91ee1ace6826d91079c963603fb882eb3f3d8b7dc
AdminCap=0x306064d0d26cd43a777c47b788162484fe80ce8ef330bcabc4841c90a0fb1804

# Task2 Faucet coin
TreasuryCap=0xaa6391b1bd2e95cd3d10418c540c79c4aac371677aa9e4c6f54c6551a48cc38e

## Get Faucet Coin
#sui client call --package $PackageID\
#                --module m4sk93_game \
#                --function get_faucet_coin \
#                --args $TreasuryCap 1000000000 \
#                --gas-budget 10000000
### Created Objects:                                                                                                                                   │
### ┌──                                                                                                                                               │
### │ ObjectID: 0xe5ab56dc35615f183d6f49ee2bc339ed87690a2c1f5e15b8eb94ccd5139fa281                                                                    │
### │ Sender: 0xfd72aa1c93c65b9487ca060a32bff2851624117d35078f54618384b1e0d16849                                                                      │
### │ Owner: Account Address ( 0xfd72aa1c93c65b9487ca060a32bff2851624117d35078f54618384b1e0d16849 )                                                   │
### │ ObjectType: 0x2::coin::Coin<0xe799e4d1324db8877c827cb4ca78dc065a8f9ef70fbe705e4c8c37250e195982::m4sk93_faucet_coin::M4SK93_FAUCET_COIN>         │
### │ Version: 131861848                                                                                                                              │
### │ Digest: 8fy7wYPBYxFsUbE5YhCiqAn99nLNfUUyFeerVBeDs7Xd                                                                                            │
### └──  


input1=0xe5ab56dc35615f183d6f49ee2bc339ed87690a2c1f5e15b8eb94ccd5139fa281   #Balance:1000000000
# Deposit
#sui client call --package $PackageID\
#                --module m4sk93_game \
#                --function deposit \
#                --args $Game $input1 800000000 \
#                --gas-budget 10000000
# https://suiscan.xyz/mainnet/tx/EAnoReMHHyvVzKpL3HSw5gPXLL2ccx4S6wfm5ohYYb9Q
## afeter deposit, remain coin:   
#https://suiscan.xyz/mainnet/object/0x335c7bc010f6e76961c1ae260b69eae900b9b6b8ffd811cbe6c31eb3ec57bb4c

input2=0x335c7bc010f6e76961c1ae260b69eae900b9b6b8ffd811cbe6c31eb3ec57bb4c #Balance:200 000 000
CLOCK=0x6
## play
#sui client call --package $PackageID\
#                --module m4sk93_game \
#                --function play \
#                --args 1 $Game $input2 $CLOCK \
#                --gas-budget 10000000
#
# https://suiscan.xyz/mainnet/tx/Agp3SowVY36Yd12rYgu6tGzDhxXdbPFEQT3V73o8eacq
# Lose,try agin
input3=0xfe8fbeb5741ed2755a9b896e582790c32eab1a4bba4bbcfb66360f4528566e00 #Balance:100 000 000
#sui client call --package $PackageID\
#                --module m4sk93_game \
#                --function play \
#                --args 0 $Game $input3 $CLOCK \
#                --gas-budget 10000000
# Lose gain
# https://suiscan.xyz/mainnet/tx/6Yi8KkWs4eWZCdcKAcDi6msNHDna8GH9BS36dNjx4zEq 
#
#

# withdraw
sui client call --package $PackageID \
                --module m4sk93_game \
                --function withdraw \
                --args $AdminCap $Game 600000000 \
                --gas-budget 10000000

#https://suiscan.xyz/mainnet/tx/CuyiX9MzjxPxBLW94BX6BSEA2DanDVfJXWgzZ1iF8nqf
