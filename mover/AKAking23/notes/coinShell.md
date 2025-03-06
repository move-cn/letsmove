sui client call \
--package 0x2 \
--module coin \
--function mint_and_transfer \
--type-args 0x411103fd7f11ddf98e5aa2ead6ca0292cd7b029b0223965cfebcd4b1132bfc07::faucet_coin::FAUCET_COIN \
--args 0x4afe86178dda8454d88381a41d03fe25d49f2ef0bb187aaa1b642eff8db7d3ff 10000000000 0xe75a090888082e699c99b6877f93aaacedba68cd172f32006605e76b99260bb8


sui client call \
--package 0x2 \
--module coin \
--function mint_and_transfer \
--type-args packageID::模块名::HUAHUAHUA1223_FAUCET_COIN \
--args TreasuryCapObjectID 10000000000 ReceivingAddress
