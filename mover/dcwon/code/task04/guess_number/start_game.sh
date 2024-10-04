# testnet package id: 0xfaac691d601171b337a0c686b1af2cd6dac590fd40f5425c56a00fee001f016d
#         pool id: 0x12013482b96be21afc6d512eb5b35edc2cede0816efbf8f909c0e994a0e2264c
# mainnet package id: 0xf3cc86549f161364ac7c7f3180199cc4bd95e638154e7b15bfa8d0c885147e68
#         pool id: 0x70c84d530ef09f70789428fb6d5c4c7a41d6d6b1a0c2215f0a08af071d93c970

sui client call  \
--package 0xf3cc86549f161364ac7c7f3180199cc4bd95e638154e7b15bfa8d0c885147e68 \
--module guess_number \
--function start_game \
--args 0x70c84d530ef09f70789428fb6d5c4c7a41d6d6b1a0c2215f0a08af071d93c970 $1 $2