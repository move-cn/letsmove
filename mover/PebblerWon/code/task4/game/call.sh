# testnet
# packageid: 0xdb45e9cd2fcf4f816736a9f6d50ca428653bf1a45885568d37b91e7b93ea1ab2
# gameObjectId: 0x059e5357a41ffc783245d9f401896502e959c7804a3dc8d437f2033d155c9169
# whn_coin balance id: 0x070458113803a01856502677ba38bce5d9eb6f4ed36667af73e24974b8dfea83
# gameGap object id: 0x677a1efe9f91c0bf4f11dcf7c2983fecc841e1dfec0c7f70b5867b74ec26f14b

## add_sui
sui client call \
  --package 0xdb45e9cd2fcf4f816736a9f6d50ca428653bf1a45885568d37b91e7b93ea1ab2 \
  --module game \
  --function add_sui \
  --args 0x059e5357a41ffc783245d9f401896502e959c7804a3dc8d437f2033d155c9169 0x05c0d8dfd7240318cb83aa30c661a829beaabc210e133fe226176d0291bd5904 \
  --gas-budget 10000000

## facuet
sui client call \
  --package 0x2 \
  --module coin \
  --function mint_and_transfer \
  --type-args '0x4c5e927d8dd0fe7bc37cfbca401376d6ccc300f6b79cf40f19a1cf329c521dd2::whn_coin::WHN_COIN' \
  --args 0x19e69a05953b0e065ebcd6a9705db902c21ac97f2bc14eb364ea79a889978d0c 10000 0x09be6b8995b7f56d8491a67f54519c56059d3fc24124470366b7ee5b51c27a91

## balance object id  0x05c0d8dfd7240318cb83aa30c661a829beaabc210e133fe226176d0291bd5904


## play
sui client call \
  --package 0xdb45e9cd2fcf4f816736a9f6d50ca428653bf1a45885568d37b91e7b93ea1ab2 \
  --module game \
  --function play \
  --args 0x059e5357a41ffc783245d9f401896502e959c7804a3dc8d437f2033d155c9169 true 0x05c0d8dfd7240318cb83aa30c661a829beaabc210e133fe226176d0291bd5904 0x8\
  --gas-budget 10000000

## withdraw
sui client call \
  --package 0xdb45e9cd2fcf4f816736a9f6d50ca428653bf1a45885568d37b91e7b93ea1ab2 \
  --module game \
  --function withdraw \
  --args 0x677a1efe9f91c0bf4f11dcf7c2983fecc841e1dfec0c7f70b5867b74ec26f14b 0x059e5357a41ffc783245d9f401896502e959c7804a3dc8d437f2033d155c9169 8\
  --gas-budget 10000000