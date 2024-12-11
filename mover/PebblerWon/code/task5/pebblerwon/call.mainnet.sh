# mainnet
# pebblerwon packageid: 0x5e0ac630c0bba8295b9de9a7acb7f0a9cd4b476c3ea3f246678e5c46606e1296

# client addresses 0x60364db3c6fa7128433ad62ce4e32649443a999ab6b54bdcbaf14194ec1a6203
# bank id: 0x13e40067a462367a1a0d04504052f18cf1d7a53b2e337d2f90cbfba70dda755f

## mint whn
  sui client call \
  --package 0x2 \
  --module coin \
  --function mint_and_transfer \
  --type-args '0xd12d0dbe5c01f8ec8aff8b62d440b3b5c7ef9330e55878c3ee30381694ba57ef::whn_coin::WHN_COIN' \
  --args 0x402453b966e86168290e1f01b8c0fdaa92f6ea009258282ccbc33e873ddaba0c 888000 0x60364db3c6fa7128433ad62ce4e32649443a999ab6b54bdcbaf14194ec1a6203


##>>> whn coin id: 0x4032ca8f17230d44653d49a4cdeb310dd7461fc85ab061594f10f09072532baf


## mint whn_facuet
  sui client call \
  --package 0x2 \
  --module coin \
  --function mint_and_transfer \
  --type-args '0x498edfc9e864d78d244315e514569ae842cb26c14cea75acb55224f74e933bbd::whn_coin::WHN_COIN' \
  --args 0xcbd304d44a70d5a080b02b514122f9ca58d7e1481450377ac448d672dad0bbd9 888000 0x60364db3c6fa7128433ad62ce4e32649443a999ab6b54bdcbaf14194ec1a6203



##>>> whn_facuet id: 0x4ff2ab0c9ab266aadb4b9d6d175705838fd2212def149af953a41117de9ec766

# deposit_whn
  sui client call \
  --package 0x5e0ac630c0bba8295b9de9a7acb7f0a9cd4b476c3ea3f246678e5c46606e1296 \
  --module pebblerwon_swap \
  --function deposit_whn \
  --args 0x13e40067a462367a1a0d04504052f18cf1d7a53b2e337d2f90cbfba70dda755f 0x4032ca8f17230d44653d49a4cdeb310dd7461fc85ab061594f10f09072532baf


# deposit_whn_facuet
  sui client call \
  --package 0x5e0ac630c0bba8295b9de9a7acb7f0a9cd4b476c3ea3f246678e5c46606e1296 \
  --module pebblerwon_swap \
  --function deposit_whn_facuet \
  --args 0x13e40067a462367a1a0d04504052f18cf1d7a53b2e337d2f90cbfba70dda755f 0x4ff2ab0c9ab266aadb4b9d6d175705838fd2212def149af953a41117de9ec766


# swap_coin_to_facuet
# whn_coin id:0xe7d4279199f3a45ebd762d941eae284a3e3ef8dcfafb872c9697f954f999e661
  sui client call \
  --package 0x5e0ac630c0bba8295b9de9a7acb7f0a9cd4b476c3ea3f246678e5c46606e1296 \
  --module pebblerwon_swap \
  --function swap_coin_to_facuet \
  --args 0x13e40067a462367a1a0d04504052f18cf1d7a53b2e337d2f90cbfba70dda755f 0xe7d4279199f3a45ebd762d941eae284a3e3ef8dcfafb872c9697f954f999e661

##>>> transaction digest: AJxP2HgDoMtXMkVQBwnzHP25BQbEA1wGmpxhS6MXKhdx

# swap_facuet_to_coin
# whn_coin_facuet id: 0x69b39219b3b1e2a097620d9d81afe38f362a2f25790586b18ec99c5c0616af71
  sui client call \
  --package 0x5e0ac630c0bba8295b9de9a7acb7f0a9cd4b476c3ea3f246678e5c46606e1296 \
  --module pebblerwon_swap \
  --function swap_facuet_to_coin \
  --args 0x13e40067a462367a1a0d04504052f18cf1d7a53b2e337d2f90cbfba70dda755f 0x69b39219b3b1e2a097620d9d81afe38f362a2f25790586b18ec99c5c0616af71
##>>> transaction digest: 5QRYxBrquAA7qc4PnFnRLmrpdAVAVJfeGkFcDBpwMhkG