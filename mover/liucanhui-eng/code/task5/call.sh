
# 铸造 100 rmb
sui client call --package 0x2 \
--module coin \
--function mint_and_transfer \
--type-args 0x76ed920226db822677e4f23b47776f9ab4e1f5731ce5f7a44786ddf137cdfcd5::rmb::RMB \
--args 0x1dc12ea9cef2afe350ecfa5068adf0d2e1384545551579b5a34982058d284dee 10000000000 0x05f384e5792c5834c3b57dbd2f110134eaf64f11f1a40636ddfe84283f94daa5

# 铸造100 usd

sui client call --package 0x2 \
--module coin \
--function mint_and_transfer \
--type-args 0x3fa7160c7ba94f821f8575aa75d9741127cd9f80e45e2331a4dcaaa5f9cf7b83::usd::USD \
--args 0x5cffb0a4aaa50ce538c8bf05f89f2ba84c18f1ef428b94bdb81d924270ccf84f 10000000000 0x05f384e5792c5834c3b57dbd2f110134eaf64f11f1a40636ddfe84283f94daa5





# 存款100 usd
sui client call --package 0x9ee3d2d888ac5ad80444a54e78d638300f6f203418e5f8276406419c49692838 \
--module swap_usd_rmb \
--function deposit_usd \
--args 0x7d8acef66205d5cfe9e3869d1e8d0a2a920dfa1771f5261ce0a3f624b4171144 0xfcb4626dcc0cc62e4b54099ac55e951e2ed4be33f46f848472fa13cb8b94bbbf




# 存款100 rmb
sui client call --package 0x9ee3d2d888ac5ad80444a54e78d638300f6f203418e5f8276406419c49692838 \
--module swap_usd_rmb \
--function deposit_rmb \
--args 0x7d8acef66205d5cfe9e3869d1e8d0a2a920dfa1771f5261ce0a3f624b4171144 0xc6b9a1cfd5dbcde3762b9055315137f3fc1e6f72edd7e8299f16f24fc23f48fe




# 用100 rmb兑换usd

sui client call --package 0x9ee3d2d888ac5ad80444a54e78d638300f6f203418e5f8276406419c49692838 \
--module swap_usd_rmb \
--function rmb_swap_usd \
--args 0x0e831606aeb652406bafa6ac0e4e0bb2b8543ab04e20e5b8f0e81df949555956 0x7d8acef66205d5cfe9e3869d1e8d0a2a920dfa1771f5261ce0a3f624b4171144


# 铸造10 usd

sui client call --package 0x2 \
--module coin \
--function mint_and_transfer \
--type-args 0x3fa7160c7ba94f821f8575aa75d9741127cd9f80e45e2331a4dcaaa5f9cf7b83::usd::USD \
--args 0x5cffb0a4aaa50ce538c8bf05f89f2ba84c18f1ef428b94bdb81d924270ccf84f 1000000000 0x05f384e5792c5834c3b57dbd2f110134eaf64f11f1a40636ddfe84283f94daa5



# 用10 usd兑换rmb

sui client call --package 0x9ee3d2d888ac5ad80444a54e78d638300f6f203418e5f8276406419c49692838 \
--module swap_usd_rmb \
--function usd_swap_rmb \
--args 0x0eaf71bb9f32bf9d83653fc010c45609de0a53ea801b255cd36a528130e1d6cd 0x7d8acef66205d5cfe9e3869d1e8d0a2a920dfa1771f5261ce0a3f624b4171144