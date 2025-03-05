 sui client call \
  --package 0x2 \
  --module coin \
  --function mint_and_transfer \
  --type-args 0xdacf8888168bfa8fbccf2cee479eaec3e3668326a165437bb347e9f0111cf0fc::dao::DAO \
  --args \
    0x7fa2d0cb719e6c40db0426485b62f2025b03491e022501f775b03733c70696c4 \
    10000000000 \
    0xc5608b3f246c832b6a0908abf0c61a22e0703f2a571e65f8b202db7b67fb366d \
   --gas-budget 100000000

 sui client call \
  --package 0x2 \
  --module coin \
  --function mint_and_transfer \
  --type-args 0xdacf8888168bfa8fbccf2cee479eaec3e3668326a165437bb347e9f0111cf0fc::faucetcoin::FAUCETCOIN \
  --args \
    0x34d9d14bef45e3da5c7dec9000c573b421a058b173372ea20b53ebbbdfcf3de0 \
    70000000000 \
    0xc5608b3f246c832b6a0908abf0c61a22e0703f2a571e65f8b202db7b67fb366d \
   --gas-budget 700000000

# dao id 0x421e8725b78903b324cb5982f0ad030d658f5e8e92d1737010f482d570e3929e
# faucet id 0xd0d65c019e15821c72677a857277de3a18495f588a65e43312a4971bb37eba68
# 0x2::coin::TreasuryCap<0xf5832a67eabb78a0a021d807bba92de5d387334bda7ef6852a600fe9887446eb::faucetcoin::FAUCETCOIN>