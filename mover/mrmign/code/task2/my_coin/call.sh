# mint my coin
sui client call --package 0x2 \
--module coin \
--function mint_and_transfer \
--type-args 0x7e1f7f4d2f38ccd7a143c65e05301f8dddab80aa015fe9cd37eb4c5a25ee6d5f::usd::USD \
--args 0x318aeb4280a523a0afb45fc4d4a618c7ba5be81cdab6aa7047ec0bff185fbcb4 10000000000 0xbecf7738a5b792939a8777eb32e5ed7b2fbf4c9c82d88037ec4c2e3e3bd1d4b5


# get my coin objects 
sui client objects --json | jq '.[]|.data | select(.type | contains("coin::Coin"))'

# transfer my coin 

sui client pay --input-coins 0x521f47dca1367f9c2c51f30f6aa2172ca4e9f75faf9ef3764996c8e92f293471 \
--recipients 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 \
--amounts 1000000000

# mint facet coin

sui client call --package 0x2 \
--module coin \
--function mint_and_transfer \
--type-args 0x7320629debca301db2cb0099fda11d31c20a86fa31af11fe4f3b00abade6fce2::rmb::RMB \
--args 0xeba48d53faf920cec041cea4b187be590e6767b41b526fafdb1ea5c69d202905 10000000000 0xbecf7738a5b792939a8777eb32e5ed7b2fbf4c9c82d88037ec4c2e3e3bd1d4b5


sui client call --package 0x2 \
--module coin \
--function mint_and_transfer \
--type-args 0x7320629debca301db2cb0099fda11d31c20a86fa31af11fe4f3b00abade6fce2::rmb::RMB \
--args 0xeba48d53faf920cec041cea4b187be590e6767b41b526fafdb1ea5c69d202905 88888800000000 0xac01746f08451813ca94d94dc9a2edfef71f7841e02a1ab9995b1dd4f9717a24