sui client call --package 0x2 \
--module coin \
--function mint_and_transfer \
--type-args 0x76ed920226db822677e4f23b47776f9ab4e1f5731ce5f7a44786ddf137cdfcd5::rmb::RMB \
--args 0x1dc12ea9cef2afe350ecfa5068adf0d2e1384545551579b5a34982058d284dee 10000000000 0x05f384e5792c5834c3b57dbd2f110134eaf64f11f1a40636ddfe84283f94daa5

sui client new-address ed25519 charles

sui client switch --address charles

sui client call --package 0x2 \
--module coin \
--function mint_and_transfer \
--type-args 0x76ed920226db822677e4f23b47776f9ab4e1f5731ce5f7a44786ddf137cdfcd5::rmb::RMB \
--args 0x1dc12ea9cef2afe350ecfa5068adf0d2e1384545551579b5a34982058d284dee 10000000000 0xd49cd505c20c2b2acd41e918304a32fedc8801a1c6827536624e2f9c4f918015


sui client pay \
--recipients 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 \
--input-coins 0x6683122c3afd3ccbcae06236aa3f1ca7c79c9891c0ed6403275095e145c0cd3d \
--amounts 50000000 \
--gas-budget 10000000
