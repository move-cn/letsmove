#!/bin/bash
sui client call --package 0x2 --module coin --function mint_and_transfer --type-args 0x59a1d86e148649d9cc99e7b051c2b2a75d4c38c72091608d4f9c4a751ce4f327::my_coin::MY_COIN --args 0x7be53a569bbb1650b4785d8ec6cc7ab02b815d4ba8c476a82b3caf2f27792da8 10000000 0x9b45b2c6a3869f0b4c6128847b421fafc1325538e42741ce10291df8bf997b72
