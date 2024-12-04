sui client switch --env mainnet
sui client envs

sui client switch --address 0x167b61dcef37260fc8335e15a16cbad0a2f3ddc8a511169820f0c013396f205b
sui client addresses

# 创建一个属于0x167b61dcef37260fc8335e15a16cbad0a2f3ddc8a511169820f0c013396f205b的NTF
sui client call \
--package 0x355a186a5f9905a8cee04bb15219b6a2c077cfa5f7a42a80c3cc8218c8dc86d4 \
--module blue_ntf \
--function mint_ntf

# 将0x167b61dcef37260fc8335e15a16cbad0a2f3ddc8a511169820f0c013396f205b的NTF
# 转移给0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
sui client call \
--package 0x355a186a5f9905a8cee04bb15219b6a2c077cfa5f7a42a80c3cc8218c8dc86d4 \
--module blue_ntf \
--function transfer \
--args 0x2b44b1293e575b831954effa7fb85ac10fd7be22ab4ea29fef71ad6b4e4c17e2 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

