### mainnet

# add liquidity
sui client call --package 0xa07aee6c9fcece8f36819ca102e2b4a1ad067aea1cfb0fe9c96a49e2333781b0 \
--module swap \
--function add_liquidity \
--args 0x53acf6ac4294d6bd2bf7d874ebf0a54f0b26e540d5cd651a724ee1e322c5e7f8 0xcbdf2422fb0308c9205b6d40acb63b03245199e1ca6878c4e47f6788a8f4912e 0x11b2af1ca52c09855cc7223ac2f867ed31a0acd90f2bc2fdcb46371ea4b47daf 0x27a086a18277330efe8be779db5e1640cdb43adf5885680cd7d992332e4ab248


## swap qqb -> faucet_coin
sui client call --package 0xa07aee6c9fcece8f36819ca102e2b4a1ad067aea1cfb0fe9c96a49e2333781b0 \
--module swap \
--function swap_a_to_b \
--args 0xcbdf2422fb0308c9205b6d40acb63b03245199e1ca6878c4e47f6788a8f4912e 0x658c3912b8f7a8ba29833d59f8f73aa6acda83d3d28e4fbd4533ea0bdc492818

## swap faucet_coin -> qqb

sui client call --package 0xa07aee6c9fcece8f36819ca102e2b4a1ad067aea1cfb0fe9c96a49e2333781b0 \
--module swap \
--function swap_b_to_a \
--args 0xcbdf2422fb0308c9205b6d40acb63b03245199e1ca6878c4e47f6788a8f4912e 0xa808d0e202473992b29fde1840b8afba08098e3cde0b75941a554f1b382553f8


### Test-net
# add liquidity
sui client call --package 0x0078ec03db24b6d024763af521eb1d44c604205c8697ec58e5503f2da6a19f3f \
--module swap \
--function add_liquidity \
--args 0x34407df1c501c367fb536c3e2b887232c342b5be6dbd1a91a008710c9558085b 0x6d4f3afb745dab7dc6f0813b52e98d834a9c022227b995f4972883b0ff8ae576 0x7767b4e62df9dfe47b2ed084037d36ec5977fdb8a1f2c3018e4e79c8e63a5af6 0x75f922a165b6abe10c90ebd889db3e5dc954c032b4a0b8e0ccd7203c32ad18d4


## swap qqb -> faucet_coin
sui client call --package 0xe09ea1271de2e7f6cdbcbe5867ae63b8044b3decb66e9e3c606c8495c5b53e8c \
--module swap \
--function swap_a_to_b \
--args 0x6d4f3afb745dab7dc6f0813b52e98d834a9c022227b995f4972883b0ff8ae576 0x3017300d30f2e4dbf5997206600638f2f5132f62d5ebacf20ac8c93675f66299

## swap faucet_coin -> qqb

sui client call --package 0xe09ea1271de2e7f6cdbcbe5867ae63b8044b3decb66e9e3c606c8495c5b53e8c \
--module swap \
--function swap_b_to_a \
--args 0x6d4f3afb745dab7dc6f0813b52e98d834a9c022227b995f4972883b0ff8ae576 0xa2837b02cbd6199dce25fc7dfd88b1b073969f90580a5711a0ddea402d61965f
