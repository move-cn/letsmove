sui client publish --gas-budget 25000000


# request faucet cion
sui client call \
--package 0xcc458eedd7c3f24cfb36a0a032e48cc00de15faeb5d9f98635c45ef603b9e741  \
--module xiaodi007_faucet_coin \
--function mint \
--args 0xa37194359f322c8daadc40e5b681b71d808dd9ad5fcf458552b8509887e886fb 1000000000 0x79a6386be5a90f7e0b1f67f58e8a5041363a5c50924412ad6694889b762fbaba \


# coin object: 0xd193de568e0514b8dd4132ff1e0d3af085262d10a908bf7184440593509551b1


# get game object
sui client call \
--package 0xcc458eedd7c3f24cfb36a0a032e48cc00de15faeb5d9f98635c45ef603b9e741   \
--module xiaodi_game \
--function creat_game \


# game object: 0x760b5b738d997a60df515125d25979f254209cdfecb662abc0f292f2293b081e


# deposit cion into game object
sui client call \
--package 0xcc458eedd7c3f24cfb36a0a032e48cc00de15faeb5d9f98635c45ef603b9e741  \
--module xiaodi_game \
--function deposit \
--args 0x760b5b738d997a60df515125d25979f254209cdfecb662abc0f292f2293b081e 0xd193de568e0514b8dd4132ff1e0d3af085262d10a908bf7184440593509551b1 1000000000 \


# get ticket
sui client call \
--package 0xcc458eedd7c3f24cfb36a0a032e48cc00de15faeb5d9f98635c45ef603b9e741  \
--module xiaodi007_faucet_coin \
--function mint \
--args 0xa37194359f322c8daadc40e5b681b71d808dd9ad5fcf458552b8509887e886fb 1000000000 0x79a6386be5a90f7e0b1f67f58e8a5041363a5c50924412ad6694889b762fbaba \

# ticket coin object: 0xda8fcb9dfac4da46700ef00095bd9ab1d33ca4aab2c602cac0ba26cac4ce3df8

# play game
sui client call \
--package 0xcc458eedd7c3f24cfb36a0a032e48cc00de15faeb5d9f98635c45ef603b9e741  \
--module xiaodi_game \
--function play \
--args 8 0x760b5b738d997a60df515125d25979f254209cdfecb662abc0f292f2293b081e 0xda8fcb9dfac4da46700ef00095bd9ab1d33ca4aab2c602cac0ba26cac4ce3df8 0x8 \


# play hash AyED8CHZjPKkCJiX629TbgnSAjm2yXwvRnDcdYyP7K8D

# deposit cion into game object
sui client call \
--package 0xcc458eedd7c3f24cfb36a0a032e48cc00de15faeb5d9f98635c45ef603b9e741  \
--module xiaodi_game \
--function withdraw \
--args 0x760b5b738d997a60df515125d25979f254209cdfecb662abc0f292f2293b081e 800000000 \


# deposit hash 7nPBdQ7Xos3dzr3NjMVyAQmUUaBEKJ4V15Jwq6H1YHCA