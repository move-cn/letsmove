mint

sui client call --gas-budget 100000000 \
--package 0x2 \
--module coin \
--function mint_and_transfer \
--type-args '0xff85f8ddcf845480e267cbca8f3735a5738bdd6c9deccf48608960d6bd800a7d::faucetcoin::FAUCETCOIN' \
--args 0x1a66b3fa006648cb42c4da20c5e56d76baa730d29136321294b3e87e812609b6 1000000000000 0xb687f9f00b3f8a67dda2ad309a81e073d7f412a3a9c2cf6c968034cafa49d8c5