# export PACKAGE_ID=0xd6a1142950bb47cc602cd2159befd9d85881a389bd744f01dd7f1f78b8ac2ea2;
# export COIN_A=0x344eb95c53b5111a38699bc19de08d6fcb43d30ffb53b5c3f78268d55a46338d::jeasonnow_coin::JEASONNOW_COIN;
# export COIN_B=0x344eb95c53b5111a38699bc19de08d6fcb43d30ffb53b5c3f78268d55a46338d::jeasonnow_faucet_coin::JEASONNOW_FAUCET_COIN;
# export POOL_ID=0xcb36d0fbc178cee94131f9c269acd6c1cba6b148203f1670a8e7724e1eb7fe14;
# export COIN_A_OBJECT=0xcc193d497d736167fe503223575a14616109ca57181f3d7292c314255a83dc36;
# export COIN_B_OBJECT=0xf2f304f5f708a31ca89e51da1397045cc277ee4b0234d008647a00907ce531e4;

# create_pool
# sui client call  --package $PACKAGE_ID\
#                 --module task5 --function create_pool  \
#                 --type-args $COIN_A $COIN_B \

# add_pool
# sui client call  --package $PACKAGE_ID\
#                 --module task5 --function add_pool  \
#                 --type-args $COIN_A $COIN_B \
#                 --args $POOL_ID $COIN_A_OBJECT $COIN_B_OBJECT 10 10

# swap a to b
# sui client call  --package $PACKAGE_ID\
#                 --module task5 --function swap_a_b  \
#                 --type-args $COIN_A $COIN_B \
#                 --args $POOL_ID $COIN_A_OBJECT 5
