# add tokens
sui client call --package 0x0a210de6094352ace503c219362ad61c9b867d13e5985223ea8fee6d31d5be4d \
    --module flip_coin \
    --function addTokens \
    --args 0x23e9c47bf03b867d637753dc8353eb76c8649d4335310677de7e3c01d02f041a 0xadfdbe36f6c394db5e18ec522e4620f3e4417bcd06025d657b86b2e7d4b81ffa

# flip coin
sui client call --package 0x0a210de6094352ace503c219362ad61c9b867d13e5985223ea8fee6d31d5be4d \
    --module flip_coin \
    --function play \
    --args 0x23e9c47bf03b867d637753dc8353eb76c8649d4335310677de7e3c01d02f041a \
    0x8 \
    true \
    0xa0d1403c5c2a9571ecf319bcd8801a1fb63ad143674265d8152113e4c7e569dd

# withdraw
sui client call --package 0x0a210de6094352ace503c219362ad61c9b867d13e5985223ea8fee6d31d5be4d \
    --module flip_coin \
    --function withdraw \
    --args 0x1f1f1c7ef3a50a438dc53e449bbff36c21439f83432c9feb6fbb026610a028d5 \
    0x23e9c47bf03b867d637753dc8353eb76c8649d4335310677de7e3c01d02f041a \
    10000000