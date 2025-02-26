# mint my coin
sui client call --package 0x2 \
--module coin \
--function mint_and_transfer \
--type-args 0xba74e7bdc1d7b7663844417a6ae4ecbffb909c834aac8c16f88db6f6aaed408e::qqb::QQB \
--args 0x3a7a622cd6a3ef2851bcfd38d477fe4b000f8dfc9dae1a98356a1b19ef04ff28 888800000000 0xe7da86dcf25d97f5ca8c838c87175641b8d2ae210e3d2b098db24650e935ec43


# get my coin objects 
sui client objects --json | jq '.[]|.data | select(.type | contains("coin::Coin"))'

# transfer my coin 

sui client pay --input-coins 0x4fd4cfb2008628bd33e75dc03ed80f88ec911ec978447e8b0459863601147400 \
--recipients 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 \
--amounts 8800000000

# mint facet coin

sui client call --package 0x2 \
--module coin \
--function mint_and_transfer \
--type-args 0xb719adc514601326081489f46e57db8e384da20525e629bf2ac877aec3749adf::faucet_coin::FAUCET_COIN \
--args 0xf25f7d1d3521003dc11fbbaffb66534747c2e3f38b7b07db208072c4781cf4ff 88800000000 0xe7da86dcf25d97f5ca8c838c87175641b8d2ae210e3d2b098db24650e935ec43


sui client call --package 0x2 \
--module coin \
--function mint_and_transfer \
--type-args 0xb719adc514601326081489f46e57db8e384da20525e629bf2ac877aec3749adf::faucet_coin::FAUCET_COIN \
--args 0xf25f7d1d3521003dc11fbbaffb66534747c2e3f38b7b07db208072c4781cf4ff 88888800000000 0xb8218fef65515484b5cb7bb34707f9ba5366646ae34c5191725c86762a6bc3ac