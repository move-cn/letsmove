sui client call --gas-budget 100000000 \
--package 0xf428422051433310369762186ba9b0984c524d269d83d0e8368ae04db7adf0a2 \
--module tmm_nft --function mint_to_sender \
--args TMM_NFT

sui client call --gas-budget 100000000 \
--package 0xf428422051433310369762186ba9b0984c524d269d83d0e8368ae04db7adf0a2 \
--module tmm_nft --function transfer \
--args 0x5f2a408396c4c93a989ac64a99d690d55e0c042ea9a283c64629d8dabc374868 \
0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
