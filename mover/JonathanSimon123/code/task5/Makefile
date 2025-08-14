#Makefile
export PACKAGE_ID=0x8d19cd76a55af9a4d0129fa8da1735dd44ea944d45f1f7b163bd4ee9607d9cee
export COIN_TOM_TREASURY_CAP=0x9f435c8a3c829ce744154df6bd86c2cf53a96c94ff1e45a9b5172519098556e9
export COIN_JERRY_TREASURY_CAP=0xc533a906040885a7af9f6ab231faa01db48ce928760a3ee261496b8eeb0aa22c
export COIN_TOM_TYPE=0x8d19cd76a55af9a4d0129fa8da1735dd44ea944d45f1f7b163bd4ee9607d9cee::coin_tom::COIN_TOM
export COIN_JERRY_TYPE=0x8d19cd76a55af9a4d0129fa8da1735dd44ea944d45f1f7b163bd4ee9607d9cee::coin_jerry::COIN_JERRY
export POCKET=0xbbc46c797ec0cd213f12f3a2e64be4e273220aea196f43c613831ca2a185ce5c
export OWNER=0x90755c93d459d98352906117443f179ebe27bec4e9d1baf9a6b7ff45b67963c3

export POOL=0x2cd272315923b75e070e40807400890b0c7ff3deb70fb6facb5fa07afd99db3a
export COIN_TOM=0xb4272b95221bd2795b42989fa964fbc4a715779d91be9866e61d2852a7912003
export COIN_JERRY=0x9c13ef96d974127e4ef0740874a5b4f45c9f9036955c9ce25e4c2fed8c594a0a
export LP=0x746fc6681c63d955985012c794301d01a208a5ab670cc28de8f9b54f60d1ba6e

export COIN_TOM_Swap=0xc43afab147196a119428d7477500def78803189d28b6d81c6eff5873b322c69b
export COIN_JERRY_Swap=





call-mint-tom:
	sui client call --package ${PACKAGE_ID} --module coin_tom --function mint --args ${COIN_TOM_TREASURY_CAP} 100000 ${OWNER} --gas-budget 10000000

call-mint-jerry:
	sui client call --package ${PACKAGE_ID} --module coin_jerry --function mint --args ${COIN_JERRY_TREASURY_CAP} 100000 ${OWNER} --gas-budget 10000000

call-createpool:
	sui client call --package ${PACKAGE_ID} --module swap --function create_pool --type-args ${COIN_TOM_TYPE} ${COIN_JERRY_TYPE} --gas-budget 10000000

call-add_liquidity:	
	sui client call --package ${PACKAGE_ID} --module swap --function add_liquidity --args ${POOL} ${COIN_TOM} ${COIN_JERRY} ${POCKET} --type-args ${COIN_TOM_TYPE} ${COIN_JERRY_TYPE} --gas-budget 10000000

call-tom_swap_jerry:
	sui client call --package ${PACKAGE_ID} --module swap --function tom_swap_jerry --args ${POOL} ${COIN_TOM_Swap} --type-args ${COIN_TOM_TYPE} ${COIN_JERRY_TYPE} --gas-budget 10000000	

call-jerry_swap_tom:
	sui client call --package ${PACKAGE_ID} --module swap --function jerry_swap_tom --args ${POOL} ${COIN_TOM_Swap} --type-args ${COIN_TOM_TYPE} ${COIN_JERRY_TYPE} --gas-budget 10000000	
