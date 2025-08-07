#!/bin/bash
sui client call --package 0x2 --module coin --function mint_and_transfer --type-args 0x92c4d6224e9638b7aeae3077c4a253a157635cacc7a22db8ab67ea7e727c71c3::faucet_coin::FAUCET_COIN --args 0x45ef74abb23ec6ea5cdcc1bf5fc2d51dad0f35a0e4a278917366ebb39947fb40 10000000 0xe1737aebeba598a19136f89859b9a4cd9b50e9ecd74e4fb1893033f78187d3b8
